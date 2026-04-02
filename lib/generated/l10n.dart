// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Time Lens`
  String get appTitle {
    return Intl.message('Time Lens', name: 'appTitle', desc: '', args: []);
  }

  /// `Meet the past Experience it today`
  String get onboarding1Title {
    return Intl.message(
      'Meet the past Experience it today',
      name: 'onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Step into immersive worlds and relive the past like never before`
  String get onboarding1Subtitle {
    return Intl.message(
      'Step into immersive worlds and relive the past like never before',
      name: 'onboarding1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Unveil the Tales Etched in Walls`
  String get onboarding2Title {
    return Intl.message(
      'Unveil the Tales Etched in Walls',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Poowered by AI and VR, converse with history’s greatest figures`
  String get onboarding2Subtitle {
    return Intl.message(
      'Poowered by AI and VR, converse with history’s greatest figures',
      name: 'onboarding2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `History Speaks Your Language`
  String get onboarding3Title {
    return Intl.message(
      'History Speaks Your Language',
      name: 'onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `Explore and learn in multiple languages wherever you are`
  String get onboarding3Subtitle {
    return Intl.message(
      'Explore and learn in multiple languages wherever you are',
      name: 'onboarding3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get onboardingSkip {
    return Intl.message('Skip', name: 'onboardingSkip', desc: '', args: []);
  }

  /// `Start`
  String get onboardingStart {
    return Intl.message('Start', name: 'onboardingStart', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forget password?`
  String get forgetPass {
    return Intl.message(
      'Forget password?',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `learn Across The Millennia`
  String get homeTitle {
    return Intl.message(
      'learn Across The Millennia',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `An error occurred`
  String get errorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Rulers of Ancient Egypt`
  String get figuresTitle {
    return Intl.message(
      'Rulers of Ancient Egypt',
      name: 'figuresTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dynasty`
  String get figureDynasty {
    return Intl.message('Dynasty', name: 'figureDynasty', desc: '', args: []);
  }

  /// `Reign in BC`
  String get figureReign {
    return Intl.message('Reign in BC', name: 'figureReign', desc: '', args: []);
  }

  /// `Weather`
  String get weather {
    return Intl.message('Weather', name: 'weather', desc: '', args: []);
  }

  /// `Search for a city`
  String get searchCity {
    return Intl.message(
      'Search for a city',
      name: 'searchCity',
      desc: '',
      args: [],
    );
  }

  /// `No cities found`
  String get noCitiesFound {
    return Intl.message(
      'No cities found',
      name: 'noCitiesFound',
      desc: '',
      args: [],
    );
  }

  /// `Enter a city name`
  String get enterCityName {
    return Intl.message(
      'Enter a city name',
      name: 'enterCityName',
      desc: '',
      args: [],
    );
  }

  /// `Lat`
  String get lat {
    return Intl.message('Lat', name: 'lat', desc: '', args: []);
  }

  /// `Lon`
  String get lon {
    return Intl.message('Lon', name: 'lon', desc: '', args: []);
  }

  /// `THOTH`
  String get thoth {
    return Intl.message('THOTH', name: 'thoth', desc: '', args: []);
  }

  /// `Speak and time shall answer`
  String get thothAskAbout {
    return Intl.message(
      'Speak and time shall answer',
      name: 'thothAskAbout',
      desc: '',
      args: [],
    );
  }

  /// `Thoth may err, wisdom is ever evolving`
  String get thothCanMakemistakes {
    return Intl.message(
      'Thoth may err, wisdom is ever evolving',
      name: 'thothCanMakemistakes',
      desc: '',
      args: [],
    );
  }

  /// `What would you like to know?`
  String get thothWhatWouldU {
    return Intl.message(
      'What would you like to know?',
      name: 'thothWhatWouldU',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `virtual reality`
  String get vr {
    return Intl.message('virtual reality', name: 'vr', desc: '', args: []);
  }

  /// `Explore the world`
  String get exploreTheWorld {
    return Intl.message(
      'Explore the world',
      name: 'exploreTheWorld',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Thoth`
  String get chatWithThoth {
    return Intl.message(
      'Chat with Thoth',
      name: 'chatWithThoth',
      desc: '',
      args: [],
    );
  }

  /// `More About ...`
  String get moreAbout {
    return Intl.message(
      'More About ...',
      name: 'moreAbout',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `1. Put on your VR headset and ensure it is properly adjusted for comfort.`
  String get instructions1 {
    return Intl.message(
      '1. Put on your VR headset and ensure it is properly adjusted for comfort.',
      name: 'instructions1',
      desc: '',
      args: [],
    );
  }

  /// `2. Use the controllers to navigate through the virtual environment and interact with objects.`
  String get instructions2 {
    return Intl.message(
      '2. Use the controllers to navigate through the virtual environment and interact with objects.',
      name: 'instructions2',
      desc: '',
      args: [],
    );
  }

  /// `3. Follow the on-screen prompts to access different features and experiences within the VR world.`
  String get instructions3 {
    return Intl.message(
      '3. Follow the on-screen prompts to access different features and experiences within the VR world.',
      name: 'instructions3',
      desc: '',
      args: [],
    );
  }

  /// `4. To chat with Figures, approach the designated area and talk to initiate the conversation.`
  String get instructions4 {
    return Intl.message(
      '4. To chat with Figures, approach the designated area and talk to initiate the conversation.',
      name: 'instructions4',
      desc: '',
      args: [],
    );
  }

  /// `5. Enjoy exploring the immersive world and engaging with figures to learn more about history and the past.`
  String get instructions5 {
    return Intl.message(
      '5. Enjoy exploring the immersive world and engaging with figures to learn more about history and the past.',
      name: 'instructions5',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
