import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DataStorage {
  static SharedPreferences? prefs;

  static Future<void> initializeStorage() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String? getName() {
    return prefs?.getString('Username');
  }

  static int? getAge() {
    return prefs?.getInt('user age');
  }

  static Map? getChallangeData() {
    String? data = prefs?.getString('Challange Data');
    if (data == null) return null;
    return jsonDecode(data);
  }

  static void saveName(String name) {
    prefs?.setString('Username', name);
  }

  static void saveAge(int age) {
    prefs?.setInt('user age', age);
  }

  static void saveChallangeData(Map data) {
    prefs?.setString('Challange Data', jsonEncode(data));
  }
}
