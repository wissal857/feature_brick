import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/usecases/i_get_all_{{name.snakeCase()}}_usecase.dart';

class GetAll{{name.pascalCase()}}UseCase implements IGetAll{{name.pascalCase()}}UseCase {
  final I{{name.pascalCase()}}Repository _repository;

  GetAll{{name.pascalCase()}}UseCase({required I{{name.pascalCase()}}Repository repository})
    : _repository = repository;

  @override
  Future<Result<List<{{name.pascalCase()}}>>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
