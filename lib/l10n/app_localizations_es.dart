// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Smile Friend';

  @override
  String get howAreYouFeeling => '¿Cómo te sientes?';

  @override
  String get moodHappy => 'Feliz';

  @override
  String get moodSad => 'Triste';

  @override
  String get moodAnxious => 'Ansioso';

  @override
  String get moodNeutral => 'Neutral';

  @override
  String get moodExcited => 'Emocionado';

  @override
  String get moodOverwhelmed => 'Abrumado';

  @override
  String get unknown => 'Desconocido';

  @override
  String get justAMoment => 'Hace un momento';

  @override
  String minutesAgo(Object minutes) {
    return 'Hace $minutes min';
  }

  @override
  String hoursAgo(Object hours) {
    return 'Hace $hours h';
  }

  @override
  String daysAgo(Object days) {
    return 'Hace $days días';
  }

  @override
  String get connect => 'Conectar';

  @override
  String get sending => 'Enviando...';

  @override
  String get chat => 'Chat';

  @override
  String get friendRequestSentSuccess =>
      'Solicitud de amistad enviada con éxito.';

  @override
  String errorSendingFriendRequest(Object error) {
    return 'Error al enviar solicitud: $error';
  }

  @override
  String get defaultUserName => 'Usuario';

  @override
  String get whatIsOnYourMind => '¿Qué tienes en mente?';

  @override
  String get publish => 'Publicar';

  @override
  String get publishing => 'Publicando...';

  @override
  String get errorPublishingPost => 'Error al publicar el post';

  @override
  String minPostLength(Object min) {
    return 'El post debe tener al menos $min caracteres';
  }

  @override
  String maxPostLength(Object max) {
    return 'El post no puede exceder los $max caracteres';
  }

  @override
  String get mentalHealthTopics => 'Temas de Salud Mental';

  @override
  String get depression => 'Depresión';

  @override
  String get anxiety => 'Ansiedad';

  @override
  String get stress => 'Estrés';

  @override
  String get grief => 'Duelo';

  @override
  String get selfEsteem => 'Autoestima';

  @override
  String get relationships => 'Relaciones';

  @override
  String get workSchool => 'Trabajo/Escuela';

  @override
  String get personalGrowth => 'Crecimiento Personal';

  @override
  String get addTopic => 'Añadir Tema';

  @override
  String get selectMood => 'Seleccionar Estado de Ánimo';

  @override
  String get selectTopics => 'Seleccionar Temas';

  @override
  String get createPost => 'Crear Publicación';

  @override
  String get profile => 'Perfil';

  @override
  String get save => 'Guardar';

  @override
  String get edit => 'Editar';

  @override
  String get aboutMe => 'Sobre mí';

  @override
  String get tellUsAboutYouHint => 'Cuéntanos un poco sobre ti...';

  @override
  String get addDescriptionHint => 'Agrega una descripción sobre ti';

  @override
  String get interests => 'Intereses';

  @override
  String get addInterestsHint =>
      'Agrega algunos intereses para conectar con personas afines';

  @override
  String get helpResources => 'Recursos de ayuda';

  @override
  String get professionalHelpPrompt => 'Si necesitas ayuda profesional:';

  @override
  String get suicidePreventionLine => 'Línea de Prevención del Suicidio';

  @override
  String get lifeLine => 'Línea de la Vida';

  @override
  String get emergencies => 'Emergencias';

  @override
  String get close => 'Cerrar';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get confirmLogout => '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get profileUpdatedSuccess => 'Perfil actualizado correctamente';

  @override
  String get errorUpdatingProfile => 'Error al actualizar el perfil';

  @override
  String get meditation => 'Meditación';

  @override
  String get exercise => 'Ejercicio';

  @override
  String get reading => 'Lectura';

  @override
  String get music => 'Música';

  @override
  String get art => 'Arte';

  @override
  String get nature => 'Naturaleza';

  @override
  String get cooking => 'Cocina';

  @override
  String get videogames => 'Videojuegos';

  @override
  String get movies => 'Películas';

  @override
  String get sports => 'Deportes';

  @override
  String get photography => 'Fotografía';

  @override
  String get travel => 'Viajes';

  @override
  String get technology => 'Tecnología';

  @override
  String get writing => 'Escritura';

  @override
  String get volunteering => 'Voluntariado';

  @override
  String get relatedTopicsOptional => 'Temas relacionados (opcional)';

  @override
  String get selectTopicsDescription =>
      'Selecciona los temas que mejor describan tu situación';

  @override
  String get home => 'Inicio';

  @override
  String get chats => 'Chats';
}
