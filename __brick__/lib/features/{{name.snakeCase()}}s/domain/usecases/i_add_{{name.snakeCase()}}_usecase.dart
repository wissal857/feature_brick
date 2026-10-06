import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/entities/{{name.snakeCase()}}.dart';

abstract interface class IAdd{{name.pascalCase()}}UseCase {
  Future<Result<{{name.pascalCase()}}>> call(Add{{name.pascalCase()}} {{name.camelCase()}});
}
