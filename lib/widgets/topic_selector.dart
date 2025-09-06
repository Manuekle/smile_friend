import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TopicSelector extends StatelessWidget {
  final List<String> selectedTopics;
  final ValueChanged<List<String>> onTopicsChanged;
  final List<String> availableTopics;

  const TopicSelector({
    super.key,
    required this.selectedTopics,
    required this.onTopicsChanged,
    required this.availableTopics,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Temas relacionados (opcional)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Selecciona los temas que mejor describan tu situación',
            style: TextStyle(
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
                  final newTopics = List<String>.from(selectedTopics);
                  if (selected) {
                    newTopics.add(topic);
                  } else {
                    newTopics.remove(topic);
                  }
                  onTopicsChanged(newTopics);
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