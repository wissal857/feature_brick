import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/entities/{{name.snakeCase()}}.dart';

abstract interface class IGet{{name.pascalCase()}}UseCase {
  Future<Result<{{name.pascalCase()}}>> call(int id);
}
