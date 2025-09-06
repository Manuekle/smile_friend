import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/app_theme.dart';

class TopicSelector extends StatelessWidget {
  final List<String> selectedTopics;
  final ValueChanged<String> onTopicSelected; // Changed to single topic selection
  final List<String> availableTopics;
  final int maxTopics;

  const TopicSelector({
    super.key,
    required this.selectedTopics,
    required this.onTopicSelected,
    required this.availableTopics,
    this.maxTopics = 5,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.relatedTopicsOptional,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.selectTopicsDescription,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: availableTopics.map((topic) {
              final isSelected = selectedTopics.contains(topic);
              return FilterChip(
                label: Text(topic),
                selected: isSelected,
                onSelected: (selected) {
                  // The logic for adding/removing is now handled by the parent widget
                  // via onTopicSelected, which also manages the maxTopics logic.
                  onTopicSelected(topic);
                },
                selectedColor: AppColors.primary.withOpacity(0.3),
                checkmarkColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: isSelected ? AppColors.primary : AppColors.text,
                ),
                backgroundColor: AppColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected ? AppColors.primary : AppColors.textSecondary.withOpacity(0.3),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}