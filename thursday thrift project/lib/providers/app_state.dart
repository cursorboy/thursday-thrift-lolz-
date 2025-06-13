import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';
import '../models/thrift_item.dart';
import '../utils/mock_data.dart';

class AppState extends ChangeNotifier {
  User? _user;
  bool _hasCompletedOnboarding = false;
  bool _hasCompletedStyleQuiz = false;
  List<ThriftItem> _savedItems = [];
  List<ThriftItem> _availableItems = [];

  User? get user => _user;
  bool get hasCompletedOnboarding => _hasCompletedOnboarding;
  bool get hasCompletedStyleQuiz => _hasCompletedStyleQuiz;
  List<ThriftItem> get savedItems => _savedItems;
  List<ThriftItem> get availableItems => _availableItems;

  AppState() {
    _loadData();
    _availableItems = MockData.getMockThriftItems().take(10).toList();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _hasCompletedOnboarding = prefs.getBool('hasCompletedOnboarding') ?? false;
    _hasCompletedStyleQuiz = prefs.getBool('hasCompletedStyleQuiz') ?? false;
    
    final userJson = prefs.getString('user');
    if (userJson != null) {
      _user = User.fromJson(jsonDecode(userJson));
    }

    final savedItemsJson = prefs.getStringList('savedItems') ?? [];
    _savedItems = savedItemsJson
        .map((item) => ThriftItem.fromJson(jsonDecode(item)))
        .toList();
    
    notifyListeners();
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', _hasCompletedOnboarding);
    await prefs.setBool('hasCompletedStyleQuiz', _hasCompletedStyleQuiz);
    
    if (_user != null) {
      await prefs.setString('user', jsonEncode(_user!.toJson()));
    }

    final savedItemsJson = _savedItems
        .map((item) => jsonEncode(item.toJson()))
        .toList();
    await prefs.setStringList('savedItems', savedItemsJson);
  }

  Future<void> completeOnboarding(String name, String email) async {
    _user = User(name: name, email: email);
    _hasCompletedOnboarding = true;
    await _saveData();
    notifyListeners();
  }

  Future<void> completeStyleQuiz(List<String> selectedStyles) async {
    if (_user != null) {
      _user = _user!.copyWith(selectedStyles: selectedStyles);
      _hasCompletedStyleQuiz = true;
      await _saveData();
      notifyListeners();
    }
  }

  Future<void> saveItem(ThriftItem item) async {
    if (!_savedItems.any((savedItem) => savedItem.id == item.id)) {
      _savedItems.add(item);
      await _saveData();
      notifyListeners();
    }
  }

  Future<void> removeSavedItem(String itemId) async {
    _savedItems.removeWhere((item) => item.id == itemId);
    await _saveData();
    notifyListeners();
  }

  void resetApp() async {
    _user = null;
    _hasCompletedOnboarding = false;
    _hasCompletedStyleQuiz = false;
    _savedItems = [];
    _availableItems = MockData.getMockThriftItems().take(10).toList();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }
} 