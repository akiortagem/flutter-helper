import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:flutter_helper/templates.dart';

import 'package:flutter_helper/configurable.dart';
import 'package:flutter_helper/config.dart';
import 'package:flutter_helper/utils.dart';

class DartModelGenerator extends Configurable {
  DartModelGenerator(AppConfig config) : super(config);

  void generate(String className, String jsonFilePath, String outputPath) {
    final jsonData = jsonPathToMap(jsonFilePath);
    final dartModelString =
        _generateDartModelFromMap(jsonData, className: className);

    // Write the Dart model to the output file
    final outputFile = File(outputPath);
    outputFile.writeAsStringSync(dartModelString);
  }

  String _generateDartModelFromMap(Map<String, dynamic> mapData,
      {String className = 'GeneratedModel'}) {
    final template = ModelTemplates.getDartModelTemplate();

    Map<String, dynamic> templateData = {};

    // iterate on each field in mapData, and figure out the type
    final fields = <Map<String, dynamic>>[];
    mapData.forEach((key, value) {
      final field = <String, dynamic>{};
      field['dartName'] = cleanKeyword(snakeToCamel(key));
      field['name'] = key;
      if (value is String) {
        field['type'] = 'String';
      } else if (value is int) {
        field['type'] = 'int';
      } else if (value is double) {
        field['type'] = 'double';
      } else if (value is bool) {
        field['type'] = 'bool';
      } else if (value is List) {
        List<dynamic> valueList = value;
        if (valueList.isEmpty) {
          field['type'] = 'List<dynamic>';
        } else {
          //get type of list
          final listType = value.first.runtimeType;
          //then get the string representation of the type
          field['type'] = 'List\<${listType.toString()}\>';
        }
      } else if (value is Map) {
        field['type'] = 'Map';
      } else {
        field['type'] = 'dynamic';
      }
      fields.add(field);
    });

    // list constructors from fields
    List<String> constructors = [];
    for (Map<String, dynamic> field in fields) {
      constructors.add('required this.${field['dartName']}');
    }

    //collapse constructors to a comma and newline separated string
    String constructorParams = constructors.join(',\n');

    //enclose constructorParams in curly braces
    constructorParams = '{\n$constructorParams\n}';

    templateData['fields'] = fields;
    templateData['className'] = className;
    templateData['constructorParams'] = constructorParams;

    final dartModelString = template.renderString(templateData);
    final dartModelFormattedString = DartFormatter().format(dartModelString);

    return dartModelFormattedString;
  }
}
