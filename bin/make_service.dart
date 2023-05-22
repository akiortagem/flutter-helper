import 'dart:io';
import 'package:args/args.dart';
import 'package:flutter_helper/config.dart';

import 'package:flutter_helper/generators/service_generator.dart';

void main(List<String> args) {
  final parser = ArgParser();
  parser.addOption('class',
      abbr: 'c', help: 'The class name to use for the generated model.');
  parser.addOption('output', abbr: 'o', help: 'The output file path.');

  final results = parser.parse(args);

  // All arguments must be present, throw error if not
  if (results['class'] == null || results['output'] == null) {
    print(parser.usage);
    exit(1);
  }
  final AppConfig config = AppConfig('.helper_settings.yaml');
  config.loadConfig();
  ServiceGenerator(config).generate(results['class'], results['output']);
}
