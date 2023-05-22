import 'package:flutter_helper/config.dart';

class DataProvider {
  final String name;
  final String classpath;

  DataProvider(this.name, this.classpath);

  //return Map<String, String>
  Map<String, String> toMap() {
    return {'class': name, 'classpath': classpath};
  }
}

class Configurable {
  final AppConfig config;

  Configurable(this.config);

  DataProvider getDataProvider() {
    final dataProviderName =
        config.configMap['key_providers']['data_provider']['name'];
    final dataProviderClasspath =
        config.configMap['key_providers']['data_provider']['path'];
    return DataProvider(dataProviderName,
        "package:${config.configMap['package']}$dataProviderClasspath");
  }
}
