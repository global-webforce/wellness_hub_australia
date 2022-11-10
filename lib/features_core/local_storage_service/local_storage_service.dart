import 'dart:convert';

import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/models/address.model.dart';
import 'package:wellness_hub_australia/models/user.model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final log = getLogger('LocalStorageService');

  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      // Initialise the asynchronous shared preferences
      _preferences = await SharedPreferences.getInstance();
      _instance = LocalStorageService();
    }

    return Future.value(_instance);
  }

  static const String placesInAustraliaKey = 'placesInAustralia';
  Future<List<Address>> placesInAustralia() async {
    try {
      var response =
          await rootBundle.loadString('assets/json/au_postcodes.json');
      return List<Address>.from(
          jsonDecode(response).map((model) => Address.fromJson(model)));
    } catch (e) {
      log.e("Failed to load places in Australia");
    }
    return [];
  }

  static const String appLanguagesKey = 'languages';
  List<String> get languages => _getFromDisk(appLanguagesKey);
  set languages(List<String> appLanguages) =>
      _saveToDisk(appLanguagesKey, appLanguages);

  static const String darkModeKey = 'darkmode';
  bool get darkMode => _getFromDisk(darkModeKey);
  set darkMode(bool value) => _saveToDisk(darkModeKey, value);

  static const String tokenKey = 'token';
  String? get token => _getFromDisk(tokenKey);
  set token(String? value) => _saveToDisk(tokenKey, value);

  static const String isOnboardedKey = 'firstTimeKey';
  bool? get isOnboarded => _getFromDisk(isOnboardedKey);
  set isOnboarded(bool? value) => _saveToDisk(isOnboardedKey, value);

  static const String userKey = 'user';

  User? get user {
    var userJson = _getFromDisk(userKey);

    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }

    return null;
  }

  set user(User? userToSave) {
    _saveToDisk(userKey, json.encode(userToSave?.toJson()));
  }

  void deleteUser() {
    _preferences!.remove(userKey);
    _preferences!.remove(tokenKey);
    print('LocalStorageService:deleteUser. userKey & tokenKey removed');
  }

  dynamic _getFromDisk(String key) {
    try {
      var value = _preferences!.get(key);
      print('Get from disk | key: $key value: $value');
      return value;
    } catch (e) {
      log.w("_getFromDisk failed");
    }
  }

// updated _saveToDisk function that handles all types
  void _saveToDisk<T>(String key, T content) {
    try {
      print('Save to dsik | key: $key value: $content');
      if (content is String) {
        _preferences!.setString(key, content);
      }
      if (content is bool) {
        _preferences!.setBool(key, content);
      }
      if (content is int) {
        _preferences!.setInt(key, content);
      }
      if (content is double) {
        _preferences!.setDouble(key, content);
      }
      if (content is List<String>) {
        _preferences!.setStringList(key, content);
      }
    } catch (e) {
      log.w("_saveToDisk failed");
    }
  }
}
