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

class ConfirmAlertLocalizations {
  ConfirmAlertLocalizations();

  static ConfirmAlertLocalizations? _current;

  static ConfirmAlertLocalizations get current {
    assert(
      _current != null,
      'No instance of ConfirmAlertLocalizations was loaded. Try to initialize the ConfirmAlertLocalizations delegate before accessing ConfirmAlertLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<ConfirmAlertLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = ConfirmAlertLocalizations();
      ConfirmAlertLocalizations._current = instance;

      return instance;
    });
  }

  static ConfirmAlertLocalizations of(BuildContext context) {
    final instance = ConfirmAlertLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of ConfirmAlertLocalizations present in the widget tree. Did you add ConfirmAlertLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static ConfirmAlertLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<ConfirmAlertLocalizations>(
      context,
      ConfirmAlertLocalizations,
    );
  }

  /// `cancelar`
  String get cancel {
    return Intl.message('cancelar', name: 'cancel', desc: '', args: []);
  }

  /// `confirmar`
  String get confirm {
    return Intl.message('confirmar', name: 'confirm', desc: '', args: []);
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<ConfirmAlertLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<ConfirmAlertLocalizations> load(Locale locale) =>
      ConfirmAlertLocalizations.load(locale);
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
