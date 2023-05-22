import 'package:flutter_helper/argparser.dart';
import 'package:flutter_helper/config.dart';
import 'package:flutter_helper/generators/dart_model_generator.dart';

void main(List<String> args) {
  final results = parseArgs(args);
  final AppConfig config = AppConfig('.helper_settings.yaml');
  DartModelGenerator(config)
      .generate(results['class'], results['json'], results['output']);
}
