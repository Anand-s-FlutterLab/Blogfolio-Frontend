// Import the necessary package.
import 'package:shared_preferences/shared_preferences.dart';

// Function to write a key-value pair to SharedPreferences.
Future<void> writeStorage(String name, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(name, value);
}

// Function to read a value from SharedPreferences based on a given key.
Future<String?> readStorage(String name) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(name);
}

// Function to remove a key-value pair from SharedPreferences based on a given key.
Future<void> removeStorage(String name) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(name);
}

// Function to clear all data from SharedPreferences.
Future<void> clearStorage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
