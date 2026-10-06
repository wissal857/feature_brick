import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/core/caching/providers/persistence_providers.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/{{name.snakeCase()}}_local_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/providers/{{name.snakeCase()}}_datasource_providers.dart';

/// A registration class that registers all state handlers for the {{name.camelCase()}} feature
class {{name.pascalCase()}}sLocalDatasourcesRegistration {
  {{name.pascalCase()}}sLocalDatasourcesRegistration._();

  static void register(Ref ref) {
    final registry = ref.read(entityLocalDatasourceRegistryProvider);
    final {{name.camelCase()}}sLocalDatasource = {{name.pascalCase()}}LocalDatasource(
      {{name.camelCase()}}sDao: ref.read({{name.camelCase()}}sDaoProvider),
    );
    registry.register({{name.camelCase()}}sLocalDatasource);
  }
}
