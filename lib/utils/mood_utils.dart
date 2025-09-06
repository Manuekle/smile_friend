class MoodUtils {
  static const Map<String, Map<String, dynamic>> moods = {
    'happy': {
      'label': 'Feliz',
      'icon': '😊',
      'color': 0xFF4ECDC4, // AppColors.success
      'description': 'Me siento bien y positivo',
    },
    'sad': {
      'label': 'Triste',
      'icon': '😢',
      'color': 0xFFFF6B6B, // AppColors.error
      'description': 'Me siento desanimado o melancólico',
    },
    'anxious': {
      'label': 'Ansioso',
      'icon': '😰',
      'color': 0xFFFF9800, // Orange
      'description': 'Me siento preocupado o nervioso',
    },
    'neutral': {
      'label': 'Neutral',
      'icon': '😐',
      'color': 0xFFB0B0B0, // AppColors.textSecondary
      'description': 'No me siento ni bien ni mal',
    },
    'excited': {
      'label': 'Emocionado',
      'icon': '🤩',
      'color': 0xFFF4C430, // AppColors.primary
      'description': 'Me siento lleno de energía y entusiasmo',
    },
    'overwhelmed': {
      'label': 'Abrumado',
      'icon': '😵',
      'color': 0xFF9C27B0, // Purple
      'description': 'Siento que hay demasiadas cosas que manejar',
    },
  };

  static Map<String, dynamic>? getMoodData(String mood) {
    return moods[mood];
  }

  static String getMoodLabel(String mood) {
    return moods[mood]?['label'] ?? 'Desconocido';
  }

  static String getMoodIcon(String mood) {
    return moods[mood]?['icon'] ?? '😐';
  }

  static Color getMoodColor(String mood) {
    final colorInt = moods[mood]?['color'];
    return colorInt != null ? Color(colorInt) : const Color(0xFFB0B0B0);
  }

  static List<String> getAllMoodKeys() {
    return moods.keys.toList();
  }
}