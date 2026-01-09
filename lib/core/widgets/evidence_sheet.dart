import 'package:flutter/material.dart';
import '../models/generated_output.dart';

class EvidenceSheet extends StatelessWidget {
  final List<EvidenceItem> evidenceItems;
  final String targetPath;

  const EvidenceSheet({
    super.key,
    required this.evidenceItems,
    required this.targetPath,
  });

  @override
  Widget build(BuildContext context) {
    final relevantEvidence = evidenceItems.where(
      (e) => e.targetPath == targetPath,
    ).toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Evidence',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Expanded(
                child: relevantEvidence.isEmpty
                    ? Center(
                        child: Text(
                          'No evidence available for this section',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                      )
                    : ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: relevantEvidence.length,
                        itemBuilder: (context, index) {
                          final evidence = relevantEvidence[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (evidence.characterRefs.isNotEmpty) ...[
                                    Text(
                                      'Character References:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Wrap(
                                      spacing: 8,
                                      children: evidence.characterRefs
                                          .map(
                                            (char) => Chip(
                                              label: Text(char),
                                              labelStyle: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                  if (evidence.assessmentRefs.isNotEmpty) ...[
                                    Text(
                                      'Assessment References:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Wrap(
                                      spacing: 8,
                                      children: evidence.assessmentRefs
                                          .map(
                                            (ref) => Chip(
                                              label: Text(ref),
                                              labelStyle: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
