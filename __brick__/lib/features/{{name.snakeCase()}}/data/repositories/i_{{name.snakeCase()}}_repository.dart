import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

abstract interface class I{{name.pascalCase()}}Repository {
  Future<Result<{{name.pascalCase()}}>> find{{name.pascalCase()}}ById(int id);
  Future<Result<{{name.pascalCase()}}>> add{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}});
}
