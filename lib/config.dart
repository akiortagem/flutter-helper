import 'dart:io';
import 'package:yaml/yaml.dart';

class AppConfig {
  final String filePath;
  Map<String, dynamic> _configMap = {};

  AppConfig(this.filePath);

  void loadConfig() {
    File file = File(filePath);
    String yamlString = file.readAsStringSync();
    YamlMap yamlMap = loadYaml(yamlString);
    _configMap = _parseYamlMap(yamlMap);
  }

  Map<String, dynamic> _parseYamlMap(YamlMap yamlMap) {
    Map<String, dynamic> resultMap = {};

    yamlMap.forEach((key, value) {
      if (key is String) {
        resultMap[key] = _parseYamlValue(value);
      }
    });

    return resultMap;
  }

  dynamic _parseYamlValue(dynamic yamlValue) {
    if (yamlValue is YamlMap) {
      return _parseYamlMap(yamlValue);
    } else if (yamlValue is YamlList) {
      return _parseYamlList(yamlValue);
    } else {
      return yamlValue;
    }
  }

  List<dynamic> _parseYamlList(YamlList yamlList) {
    List<dynamic> resultList = [];

    for (var yamlValue in yamlList) {
      resultList.add(_parseYamlValue(yamlValue));
    }

    return resultList;
  }

  Map<String, dynamic> get configMap => _configMap;
}
