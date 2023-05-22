import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'package:flutter_helper/configurable.dart';
import 'package:flutter_helper/config.dart';
import 'package:flutter_helper/templates.dart';

class ServiceGenerator extends Configurable {
  ServiceGenerator(AppConfig config) : super(config);

  void generate(String className, String outputPath) {
    final template = ServiceTemplates.getServiceTemplate();

    Map<String, dynamic> templateData = {};
    templateData['className'] = className;
    templateData['dataProvider'] = getDataProvider().toMap();

    final serviceString = template.renderString(templateData);
    final serviceFormattedString = DartFormatter().format(serviceString);

    // Write the Dart model to the output file
    final outputFile = File(outputPath);
    outputFile.writeAsStringSync(serviceFormattedString);
  }
}
