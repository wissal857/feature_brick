import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/entities/{{name.snakeCase()}}.dart';

abstract interface class IGetAll{{name.pascalCase()}}UseCase {
  Future<Result<List<{{name.pascalCase()}}>>> call();
}
