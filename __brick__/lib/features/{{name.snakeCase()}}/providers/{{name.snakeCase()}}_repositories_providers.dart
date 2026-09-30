import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/{{name.snakeCase()}}_datasource_providers.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository.dart';

final {{name.camelCase()}}RepositoryProvider = Provider.autoDispose<I{{name.pascalCase()}}Repository>((ref) {
  final remoteDatasource = ref.watch({{name.camelCase()}}RemoteDatasourceProvider);
  final localDatasource = ref.watch({{name.camelCase()}}LocalDatasourceProvider);
  return {{name.pascalCase()}}Repository(
    {{name.camelCase()}}LocalDatasource: localDatasource,
    {{name.camelCase()}}RemoteDatasource: remoteDatasource,
  );
});