import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/entities/{{name.snakeCase()}}.dart';

abstract interface class I{{name.pascalCase()}}Repository {
  Future<Result<{{name.pascalCase()}}>> find{{name.pascalCase()}}ById(int id);
  Future<Result<{{name.pascalCase()}}>> save{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}});
}
