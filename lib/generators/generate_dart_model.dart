import 'package:dart_style/dart_style.dart';
import 'package:flutter_helper/templates.dart';

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}

String _snakeToCamel(String input) {
  List<String> words = input.split('_');
  String firstWord = words.removeAt(0);
  String camelCase = firstWord + words.map((word) => word.capitalize).join('');
  return camelCase;
}

String generateDartModelFromMap(Map<String, dynamic> mapData,
    {String className = 'GeneratedModel'}) {
  final template = ModelTemplates.getDartModelTemplate();

  Map<String, dynamic> templateData = {};

  // iterate on each field in mapData, and figure out the type
  final fields = <Map<String, dynamic>>[];
  mapData.forEach((key, value) {
    final field = <String, dynamic>{};
    field['dartName'] = _snakeToCamel(key);
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
      //get type of list
      final listType = value.first.runtimeType;
      //then get the string representation of the type
      field['type'] = 'List\<${listType.toString()}\>';
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
