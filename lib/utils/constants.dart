class AppConstants {
  // Temas disponibles para los posts
  static const List<String> mentalHealthTopics = [
    'Depresión',
    'Ansiedad',
    'Soledad',
    'Estrés',
    'Autoestima',
    'Relaciones',
    'Trabajo',
    'Familia',
    'Duelo',
    'Insomnio',
    'Motivación',
    'Esperanza',
    'Pánico',
    'Tristeza',
    'Ira',
    'Miedo',
    'Terapia',
    'Medicación',
    'Ejercicio',
    'Meditación',
  ];

  // Intereses disponibles para el perfil
  static const List<String> userInterests = [
    'Meditación',
    'Ejercicio',
    'Lectura',
    'Música',
    'Arte',
    'Naturaleza',
    'Cocina',
    'Videojuegos',
    'Películas',
    'Deportes',
    'Fotografía',
    'Viajes',
    'Tecnología',
    'Escritura',
    'Voluntariado',
    'Mascotas',
    'Jardinería',
    'Baile',
    'Yoga',
    'Pintura',
  ];

  // Recursos de ayuda
  static const Map<String, String> helpResources = {
    'Línea de Prevención del Suicidio': '106',
    'Línea de la Vida': '01 8000 113 113',
    'Emergencias': '123',
    'ICBF - Línea de Protección': '141',
    'Violencia de Género': '155',
  };

  // Mensajes de apoyo
  static const List<String> supportMessages = [
    'Recuerda que no estás solo en esto.',
    'Cada día es una nueva oportunidad para sanar.',
    'Tus sentimientos son válidos.',
    'Está bien no estar bien todo el tiempo.',
    'Pedir ayuda es un acto de valentía.',
    'Eres más fuerte de lo que crees.',
    'Este momento difícil también pasará.',
    'Mereces amor y comprensión.',
  ];

  // Configuraciones de la app
  static const int maxPostLength = 500;
  static const int maxBioLength = 200;
  static const int maxTopicsPerPost = 5;
  static const int maxInterestsPerUser = 10;
}