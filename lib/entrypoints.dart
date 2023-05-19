import 'dart:convert';
import 'dart:io';

import 'package:flutter_helper/generators/generate_dart_model.dart';

/// Read a JSON file and generate a Dart model class to a filepath
void generateDartModelFromJSONFile(
    String className, String jsonFilePath, String outputPath) {
  // Read the JSON file into Map<String, dynamic>
  final jsonFile = File(jsonFilePath);
  final jsonString = jsonFile.readAsStringSync();

  // Parse the JSON string into a Map<String, dynamic>
  final jsonData = Map<String, dynamic>.from(json.decode(jsonString));

  final dartModelString = generateDartModelFromMap(jsonData);

  // Write the Dart model to the output file
  final outputFile = File(outputPath);
  outputFile.writeAsStringSync(dartModelString);
}
