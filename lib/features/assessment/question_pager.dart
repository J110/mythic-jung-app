import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/character.dart';
import '../../core/models/assessment_answer.dart';
import '../../core/storage/repositories.dart';
import '../../core/api/api_client.dart';

class QuestionPager extends ConsumerStatefulWidget {
  final String assessmentType;
  final String moduleName;
  final List<Character> characters;

  const QuestionPager({
    super.key,
    required this.assessmentType,
    required this.moduleName,
    required this.characters,
  });

  @override
  ConsumerState<QuestionPager> createState() => _QuestionPagerState();
}

class _QuestionPagerState extends ConsumerState<QuestionPager> {
  int _currentQuestionIndex = 0;
  final List<String> _selectedCharacters = [];
  List<Map<String, dynamic>> _questions = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final apiClient = ref.read(apiClientProvider);
      final questions = await apiClient.getAssessmentQuestions(
        assessmentType: widget.assessmentType,
      );
      
      setState(() {
        _questions = questions;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.moduleName)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null || _questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.moduleName)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error loading questions: $_error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadQuestions,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final answerType = currentQuestion['answerType'] as String? ?? 'SINGLE';
    final maxSelections = currentQuestion['maxSelections'] as int? ?? 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moduleName),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / _questions.length,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    currentQuestion['question'] as String? ?? currentQuestion['text'] as String? ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  if (currentQuestion['subtext'] != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      currentQuestion['subtext'] as String,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 48),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: widget.characters.length,
                      itemBuilder: (context, index) {
                        final character = widget.characters[index];
                        final isSelected = _selectedCharacters.contains(character.id);

                        final canSelect = answerType == 'MULTI' 
                          ? _selectedCharacters.length < maxSelections
                          : true;
                        final isDisabled = !isSelected && !canSelect && _selectedCharacters.length >= maxSelections;

                        return InkWell(
                          onTap: isDisabled ? null : () {
                            setState(() {
                              if (isSelected) {
                                _selectedCharacters.remove(character.id);
                              } else {
                                if (answerType == 'SINGLE') {
                                  _selectedCharacters.clear();
                                }
                                _selectedCharacters.add(character.id);
                              }
                            });
                          },
                          child: Opacity(
                            opacity: isDisabled ? 0.5 : 1.0,
                            child: Card(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primaryContainer
                                  : null,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isSelected ? Icons.check_circle : Icons.circle_outlined,
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : null,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    character.displayName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: isSelected ? FontWeight.bold : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (_currentQuestionIndex > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _currentQuestionIndex--;
                          _selectedCharacters.clear();
                        });
                      },
                      child: const Text('Previous'),
                    ),
                  ),
                if (_currentQuestionIndex > 0) const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selectedCharacters.isEmpty
                        ? null
                        : () => _handleNext(),
                    child: Text(
                      _currentQuestionIndex < _questions.length - 1
                          ? 'Next'
                          : 'Complete',
                    ),
                  ),
                ),
                if (answerType == 'MULTI' && _selectedCharacters.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '${_selectedCharacters.length}/$maxSelections',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleNext() async {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedCharacters.clear();
      });
    } else {
      // Save answer for current question
      final question = _questions[_currentQuestionIndex];
      final answer = AssessmentAnswer(
        assessmentType: widget.assessmentType,
        questionId: question['questionId'] as String? ?? question['id'] as String,
        selectedCharacterIds: _selectedCharacters,
        updatedAt: DateTime.now(),
      );

      try {
        await ref.read(userProfileRepositoryProvider.notifier).saveAssessmentAnswer(answer);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Assessment saved. Outputs are being regenerated...'),
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error saving: $e'),
            ),
          );
        }
      }
    }
  }
}
