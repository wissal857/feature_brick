import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/usecases/i_add_{{name.snakeCase()}}_usecase.dart';

class Add{{name.pascalCase()}}UseCase implements IAdd{{name.pascalCase()}}UseCase {
  final I{{name.pascalCase()}}Repository _repository;

  Add{{name.pascalCase()}}UseCase({required I{{name.pascalCase()}}Repository repository})
    : _repository = repository;

  @override
  Future<Result<{{name.pascalCase()}}>> call(Add{{name.pascalCase()}} {{name.camelCase()}}) {
    return _repository.add{{name.pascalCase()}}({{name.camelCase()}});
  }
}
