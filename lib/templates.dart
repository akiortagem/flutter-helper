import 'package:mustache_template/mustache_template.dart';

class ModelTemplates {
  static final String dartModel = '''
  class {{className}} {
    {{className}}({{constructorParams}});

    {{#fields}}
    {{{type}}} {{{name}}};
    {{/fields}}
  }
  ''';

  static getDartModelTemplate() {
    return Template(dartModel, name: 'dart_model');
  }
}
