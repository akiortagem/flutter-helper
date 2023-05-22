import 'dart:io';
import 'dart:convert';

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}

String snakeToCamel(String input) {
  List<String> words = input.split('_');
  String firstWord = words.removeAt(0);
  String camelCase = firstWord + words.map((word) => word.capitalize).join('');
  return camelCase;
}

Map<String, dynamic> jsonPathToMap(String jsonFilePath) {
  // Read the JSON file into Map<String, dynamic>
  final jsonFile = File(jsonFilePath);
  final jsonString = jsonFile.readAsStringSync();

  // Parse the JSON string into a Map<String, dynamic>
  return Map<String, dynamic>.from(json.decode(jsonString));
}
