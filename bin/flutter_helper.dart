import 'package:args/args.dart';
import 'package:flutter_helper/entrypoints.dart';

void main(List<String> args) {
  final parser = ArgParser();
  parser.addOption('json', abbr: 'j', help: 'The JSON file to parse.');
  parser.addOption('class',
      abbr: 'c', help: 'The class name to use for the generated model.');
  parser.addOption('output', abbr: 'o', help: 'The output file path.');

  final results = parser.parse(args);

  // All arguments must be present, throw error if not
  if (results['json'] == null ||
      results['class'] == null ||
      results['output'] == null) {
    print(parser.usage);
    return;
  }

  generateDartModelFromJSONFile(
      results['class'], results['json'], results['output']);
}
