import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/i_{{name.snakeCase()}}_local_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/remote/i_{{name.snakeCase()}}_remote_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}Repository implements I{{name.pascalCase()}}Repository {
  {{name.pascalCase()}}Repository({
    required I{{name.pascalCase()}}LocalDatasource {{name.camelCase()}}LocalDatasource,
    required I{{name.pascalCase()}}RemoteDatasource {{name.camelCase()}}RemoteDatasource,
  }) : _{{name.camelCase()}}LocalDatasource = {{name.camelCase()}}LocalDatasource,
       _{{name.camelCase()}}RemoteDatasource = {{name.camelCase()}}RemoteDatasource;

  final I{{name.pascalCase()}}LocalDatasource _{{name.camelCase()}}LocalDatasource;
  final I{{name.pascalCase()}}RemoteDatasource _{{name.camelCase()}}RemoteDatasource;

  @override
  Future<Result<{{name.pascalCase()}}>> add{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}}) {
    // TODO: implement add{{name.pascalCase()}}
    throw UnimplementedError();
  }

  @override
  Future<Result<{{name.pascalCase()}}>> find{{name.pascalCase()}}ById(int id) {
    // TODO: implement find{{name.pascalCase()}}ById
    throw UnimplementedError();
  }
}
