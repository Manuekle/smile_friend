import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Smile Friend'**
  String get appName;

  /// No description provided for @howAreYouFeeling.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling?'**
  String get howAreYouFeeling;

  /// No description provided for @moodHappy.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get moodHappy;

  /// No description provided for @moodSad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get moodSad;

  /// No description provided for @moodAnxious.
  ///
  /// In en, this message translates to:
  /// **'Anxious'**
  String get moodAnxious;

  /// No description provided for @moodNeutral.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get moodNeutral;

  /// No description provided for @moodExcited.
  ///
  /// In en, this message translates to:
  /// **'Excited'**
  String get moodExcited;

  /// No description provided for @moodOverwhelmed.
  ///
  /// In en, this message translates to:
  /// **'Overwhelmed'**
  String get moodOverwhelmed;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @justAMoment.
  ///
  /// In en, this message translates to:
  /// **'Just a moment ago'**
  String get justAMoment;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min ago'**
  String minutesAgo(Object minutes);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours} h ago'**
  String hoursAgo(Object hours);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String daysAgo(Object days);

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @sending.
  ///
  /// In en, this message translates to:
  /// **'Sending...'**
  String get sending;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @friendRequestSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Friend request sent successfully.'**
  String get friendRequestSentSuccess;

  /// No description provided for @errorSendingFriendRequest.
  ///
  /// In en, this message translates to:
  /// **'Error sending friend request: {error}'**
  String errorSendingFriendRequest(Object error);

  /// No description provided for @defaultUserName.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get defaultUserName;

  /// No description provided for @whatIsOnYourMind.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind?'**
  String get whatIsOnYourMind;

  /// No description provided for @publish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get publish;

  /// No description provided for @publishing.
  ///
  /// In en, this message translates to:
  /// **'Publishing...'**
  String get publishing;

  /// No description provided for @errorPublishingPost.
  ///
  /// In en, this message translates to:
  /// **'Error publishing post'**
  String get errorPublishingPost;

  /// No description provided for @minPostLength.
  ///
  /// In en, this message translates to:
  /// **'Post must be at least {min} characters long'**
  String minPostLength(Object min);

  /// No description provided for @maxPostLength.
  ///
  /// In en, this message translates to:
  /// **'Post cannot exceed {max} characters'**
  String maxPostLength(Object max);

  /// No description provided for @mentalHealthTopics.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Topics'**
  String get mentalHealthTopics;

  /// No description provided for @depression.
  ///
  /// In en, this message translates to:
  /// **'Depression'**
  String get depression;

  /// No description provided for @anxiety.
  ///
  /// In en, this message translates to:
  /// **'Anxiety'**
  String get anxiety;

  /// No description provided for @stress.
  ///
  /// In en, this message translates to:
  /// **'Stress'**
  String get stress;

  /// No description provided for @grief.
  ///
  /// In en, this message translates to:
  /// **'Grief'**
  String get grief;

  /// No description provided for @selfEsteem.
  ///
  /// In en, this message translates to:
  /// **'Self-Esteem'**
  String get selfEsteem;

  /// No description provided for @relationships.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get relationships;

  /// No description provided for @workSchool.
  ///
  /// In en, this message translates to:
  /// **'Work/School'**
  String get workSchool;

  /// No description provided for @personalGrowth.
  ///
  /// In en, this message translates to:
  /// **'Personal Growth'**
  String get personalGrowth;

  /// No description provided for @addTopic.
  ///
  /// In en, this message translates to:
  /// **'Add Topic'**
  String get addTopic;

  /// No description provided for @selectMood.
  ///
  /// In en, this message translates to:
  /// **'Select Mood'**
  String get selectMood;

  /// No description provided for @selectTopics.
  ///
  /// In en, this message translates to:
  /// **'Select Topics'**
  String get selectTopics;

  /// No description provided for @createPost.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get createPost;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get aboutMe;

  /// No description provided for @tellUsAboutYouHint.
  ///
  /// In en, this message translates to:
  /// **'Tell us a little about yourself...'**
  String get tellUsAboutYouHint;

  /// No description provided for @addDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Add a description about yourself'**
  String get addDescriptionHint;

  /// No description provided for @interests.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get interests;

  /// No description provided for @addInterestsHint.
  ///
  /// In en, this message translates to:
  /// **'Add some interests to connect with like-minded people'**
  String get addInterestsHint;

  /// No description provided for @helpResources.
  ///
  /// In en, this message translates to:
  /// **'Help Resources'**
  String get helpResources;

  /// No description provided for @professionalHelpPrompt.
  ///
  /// In en, this message translates to:
  /// **'If you need professional help:'**
  String get professionalHelpPrompt;

  /// No description provided for @suicidePreventionLine.
  ///
  /// In en, this message translates to:
  /// **'Suicide Prevention Line'**
  String get suicidePreventionLine;

  /// No description provided for @lifeLine.
  ///
  /// In en, this message translates to:
  /// **'Life Line'**
  String get lifeLine;

  /// No description provided for @emergencies.
  ///
  /// In en, this message translates to:
  /// **'Emergencies'**
  String get emergencies;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get confirmLogout;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @profileUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdatedSuccess;

  /// No description provided for @errorUpdatingProfile.
  ///
  /// In en, this message translates to:
  /// **'Error updating profile'**
  String get errorUpdatingProfile;

  /// No description provided for @meditation.
  ///
  /// In en, this message translates to:
  /// **'Meditation'**
  String get meditation;

  /// No description provided for @exercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get exercise;

  /// No description provided for @reading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get reading;

  /// No description provided for @music.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// No description provided for @art.
  ///
  /// In en, this message translates to:
  /// **'Art'**
  String get art;

  /// No description provided for @nature.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get nature;

  /// No description provided for @cooking.
  ///
  /// In en, this message translates to:
  /// **'Cooking'**
  String get cooking;

  /// No description provided for @videogames.
  ///
  /// In en, this message translates to:
  /// **'Video Games'**
  String get videogames;

  /// No description provided for @movies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get movies;

  /// No description provided for @sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// No description provided for @photography.
  ///
  /// In en, this message translates to:
  /// **'Photography'**
  String get photography;

  /// No description provided for @travel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get travel;

  /// No description provided for @technology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technology;

  /// No description provided for @writing.
  ///
  /// In en, this message translates to:
  /// **'Writing'**
  String get writing;

  /// No description provided for @volunteering.
  ///
  /// In en, this message translates to:
  /// **'Volunteering'**
  String get volunteering;

  /// No description provided for @relatedTopicsOptional.
  ///
  /// In en, this message translates to:
  /// **'Related Topics (optional)'**
  String get relatedTopicsOptional;

  /// No description provided for @selectTopicsDescription.
  ///
  /// In en, this message translates to:
  /// **'Select the topics that best describe your situation'**
  String get selectTopicsDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
