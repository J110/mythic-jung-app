import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/repositories.dart';
import '../../core/models/assessment_answer.dart';
import '../../core/utils/constants.dart';
import 'question_pager.dart';

class AssessmentTab extends ConsumerWidget {
  const AssessmentTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment'),
      ),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null || profile.characters.length != AppConstants.requiredCharacterCount) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.quiz, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'Please complete character entry first',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          }

          final modules = [
            {'type': AppConstants.libidinalCharge, 'name': 'Libidinal Charge'},
            {'type': AppConstants.egoPosition, 'name': 'Ego Position'},
            {'type': AppConstants.personaFormation, 'name': 'Persona Formation'},
            {'type': AppConstants.shadowProximity, 'name': 'Shadow Proximity'},
            {'type': AppConstants.feelingFunction, 'name': 'Feeling Function'},
            {'type': AppConstants.costCompensation, 'name': 'Cost & Compensation'},
            {'type': AppConstants.individuationDirection, 'name': 'Individuation Direction'},
          ];

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                ],
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.quiz,
                            color: Theme.of(context).colorScheme.primary,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Assessment Modules',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Complete each module to refine your mythic narrative',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ...modules.asMap().entries.map((entry) {
                  final index = entry.key;
                  final module = entry.value;
                  final moduleType = module['type'] as String;
                  final moduleName = module['name'] as String;
                  
                  final hasAnswer = profile.answers.any(
                    (a) => a.assessmentType == moduleType,
                  );
                  
                  final answer = profile.answers.firstWhere(
                    (a) => a.assessmentType == moduleType,
                    orElse: () => const AssessmentAnswer(
                      assessmentType: '',
                      questionId: '',
                      selectedCharacterIds: [],
                    ),
                  );

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: hasAnswer
                            ? Colors.green.withOpacity(0.3)
                            : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionPager(
                              assessmentType: moduleType,
                              moduleName: moduleName,
                              characters: profile.characters,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                gradient: hasAnswer
                                    ? LinearGradient(
                                        colors: [
                                          Colors.green.shade400,
                                          Colors.green.shade600,
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [
                                          Colors.grey.shade400,
                                          Colors.grey.shade600,
                                        ],
                                      ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    moduleName,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    hasAnswer
                                        ? 'Last updated: ${answer.updatedAt != null ? _formatDate(answer.updatedAt!) : 'Recently'}'
                                        : 'Not started',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: hasAnswer ? Colors.green.shade700 : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              hasAnswer
                                  ? Icons.check_circle
                                  : Icons.arrow_forward_ios,
                              color: hasAnswer
                                  ? Colors.green
                                  : Colors.grey,
                              size: hasAnswer ? 28 : 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
