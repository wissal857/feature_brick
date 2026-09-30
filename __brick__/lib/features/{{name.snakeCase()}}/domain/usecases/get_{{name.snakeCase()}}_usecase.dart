import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/usecases/i_get_{{name.snakeCase()}}_usecase.dart';

class Get{{name.pascalCase()}}UseCase implements IGet{{name.pascalCase()}}UseCase {
  final I{{name.pascalCase()}}Repository _repository;

  Get{{name.pascalCase()}}UseCase({required I{{name.pascalCase()}}Repository repository})
    : _repository = repository;

  @override
  Future<Result<{{name.pascalCase()}}>> call(int id) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
