// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Smile Friend';

  @override
  String get howAreYouFeeling => 'How are you feeling?';

  @override
  String get moodHappy => 'Happy';

  @override
  String get moodSad => 'Sad';

  @override
  String get moodAnxious => 'Anxious';

  @override
  String get moodNeutral => 'Neutral';

  @override
  String get moodExcited => 'Excited';

  @override
  String get moodOverwhelmed => 'Overwhelmed';

  @override
  String get unknown => 'Unknown';

  @override
  String get justAMoment => 'Just a moment ago';

  @override
  String minutesAgo(Object minutes) {
    return '$minutes min ago';
  }

  @override
  String hoursAgo(Object hours) {
    return '$hours h ago';
  }

  @override
  String daysAgo(Object days) {
    return '$days days ago';
  }

  @override
  String get connect => 'Connect';

  @override
  String get sending => 'Sending...';

  @override
  String get chat => 'Chat';

  @override
  String get friendRequestSentSuccess => 'Friend request sent successfully.';

  @override
  String errorSendingFriendRequest(Object error) {
    return 'Error sending friend request: $error';
  }

  @override
  String get defaultUserName => 'User';

  @override
  String get whatIsOnYourMind => 'What\'s on your mind?';

  @override
  String get publish => 'Publish';

  @override
  String get publishing => 'Publishing...';

  @override
  String get errorPublishingPost => 'Error publishing post';

  @override
  String minPostLength(Object min) {
    return 'Post must be at least $min characters long';
  }

  @override
  String maxPostLength(Object max) {
    return 'Post cannot exceed $max characters';
  }

  @override
  String get mentalHealthTopics => 'Mental Health Topics';

  @override
  String get depression => 'Depression';

  @override
  String get anxiety => 'Anxiety';

  @override
  String get stress => 'Stress';

  @override
  String get grief => 'Grief';

  @override
  String get selfEsteem => 'Self-Esteem';

  @override
  String get relationships => 'Relationships';

  @override
  String get workSchool => 'Work/School';

  @override
  String get personalGrowth => 'Personal Growth';

  @override
  String get addTopic => 'Add Topic';

  @override
  String get selectMood => 'Select Mood';

  @override
  String get selectTopics => 'Select Topics';

  @override
  String get createPost => 'Create Post';

  @override
  String get profile => 'Profile';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get aboutMe => 'About me';

  @override
  String get tellUsAboutYouHint => 'Tell us a little about yourself...';

  @override
  String get addDescriptionHint => 'Add a description about yourself';

  @override
  String get interests => 'Interests';

  @override
  String get addInterestsHint =>
      'Add some interests to connect with like-minded people';

  @override
  String get helpResources => 'Help Resources';

  @override
  String get professionalHelpPrompt => 'If you need professional help:';

  @override
  String get suicidePreventionLine => 'Suicide Prevention Line';

  @override
  String get lifeLine => 'Life Line';

  @override
  String get emergencies => 'Emergencies';

  @override
  String get close => 'Close';

  @override
  String get logout => 'Logout';

  @override
  String get confirmLogout => 'Are you sure you want to log out?';

  @override
  String get cancel => 'Cancel';

  @override
  String get profileUpdatedSuccess => 'Profile updated successfully';

  @override
  String get errorUpdatingProfile => 'Error updating profile';

  @override
  String get meditation => 'Meditation';

  @override
  String get exercise => 'Exercise';

  @override
  String get reading => 'Reading';

  @override
  String get music => 'Music';

  @override
  String get art => 'Art';

  @override
  String get nature => 'Nature';

  @override
  String get cooking => 'Cooking';

  @override
  String get videogames => 'Video Games';

  @override
  String get movies => 'Movies';

  @override
  String get sports => 'Sports';

  @override
  String get photography => 'Photography';

  @override
  String get travel => 'Travel';

  @override
  String get technology => 'Technology';

  @override
  String get writing => 'Writing';

  @override
  String get volunteering => 'Volunteering';

  @override
  String get relatedTopicsOptional => 'Related Topics (optional)';

  @override
  String get selectTopicsDescription =>
      'Select the topics that best describe your situation';
}
