import 'package:flutter/material.dart';
import '../models/mood_model.dart';

class MoodUtils {
  static final List<Mood> moods = [
    const Mood(
      label: 'Feliz',
      icon: '😊',
      color: Color(0xFF4ECDC4),
      description: 'Me siento bien y positivo',
    ),
    const Mood(
      label: 'Triste',
      icon: '😢',
      color: Color(0xFFFF6B6B),
      description: 'Me siento desanimado o melancólico',
    ),
    const Mood(
      label: 'Ansioso',
      icon: '😰',
      color: Color(0xFFFF9800),
      description: 'Me siento preocupado o nervioso',
    ),
    const Mood(
      label: 'Neutral',
      icon: '😐',
      color: Color(0xFFB0B0B0),
      description: 'No me siento ni bien ni mal',
    ),
    const Mood(
      label: 'Emocionado',
      icon: '🤩',
      color: Color(0xFFF4C430),
      description: 'Me siento lleno de energía y entusiasmo',
    ),
    const Mood(
      label: 'Abrumado',
      icon: '😵',
      color: Color(0xFF9C27B0),
      description: 'Siento que hay demasiadas cosas que manejar',
    ),
  ];

  static Mood? getMoodData(String moodLabel) {
    try {
      return moods.firstWhere((mood) => mood.label == moodLabel);
    } catch (e) {
      return null;
    }
  }

  static String getMoodLabel(String moodLabel) {
    final mood = getMoodData(moodLabel);
    return mood?.label ?? 'Desconocido';
  }

  static String getMoodIcon(String moodLabel) {
    final mood = getMoodData(moodLabel);
    return mood?.icon ?? '😐';
  }

  static Color getMoodColor(String moodLabel) {
    final mood = getMoodData(moodLabel);
    return mood?.color ?? const Color(0xFFB0B0B0);
  }

  static List<Mood> getAllMoods() {
    return moods;
  }
}
