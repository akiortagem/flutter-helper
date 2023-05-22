# flutter-helper

collection of CLI tools to help development of a flutter app

## Usage

First add this project to your `pubspec.yml`, like so :

```yaml
dev_dependencies:
  flutter_helper:
    git:
      url: git://github.com/username/flutter_helper.git
      ref: main
```

### Dart Model Generator

In your own flutter project, you can use it like so :

`dart run flutter_helper:make_model <args>`

Run with no args to see the actual usage.

### Service Stub Generator

`dart run flutter_helper:make_service -c ServiceName -o /path/to/output.dart`

But before this can work, please init your workspace with the following `.helper_settings.yaml`

```yaml
package: your_package_name

key_providers:
  data_provider:
    name: 'YourDataProvider'
    path: '/path/to/data/provider.dart'

dirs:
 - services: '/services'
 - models: '/models'
```
