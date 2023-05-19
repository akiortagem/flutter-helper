import 'package:mustache_template/mustache_template.dart';

class ModelTemplates {
  static final String dartModel = '''
  class {{className}} {
    {{#fields}}
    final {{{type}}} {{dartName}};
    {{/fields}}

    {{className}}({{constructorParams}});

    factory {{className}}.fromJson(Map<String, dynamic> json) {
      return {{className}}(
        {{#fields}}
        {{{dartName}}}: json['{{name}}'],
        {{/fields}}
      );
    }

    Map<String, dynamic> toJson() => {
      {{#fields}}
      '{{name}}': {{{dartName}}},
      {{/fields}}
    };
  }
  ''';

  static getDartModelTemplate() {
    return Template(dartModel, name: 'dart_model');
  }
}
