import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/usecases/get_all_{{name.snakeCase()}}_usecase.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/usecases/i_get_all_{{name.snakeCase()}}_usecase.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/providers/{{name.snakeCase()}}_repositories_providers.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/usecases/add_{{name.snakeCase()}}_usecase.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/usecases/get_{{name.snakeCase()}}_usecase.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/usecases/i_add_{{name.snakeCase()}}_usecase.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/usecases/i_get_{{name.snakeCase()}}_usecase.dart';

final add{{name.pascalCase()}}UseCaseProvider = Provider.autoDispose<IAdd{{name.pascalCase()}}UseCase>((ref) {
  return Add{{name.pascalCase()}}UseCase(repository: ref.watch({{name.camelCase()}}RepositoryProvider));
});

final get{{name.pascalCase()}}UseCaseProvider = Provider.autoDispose<IGet{{name.pascalCase()}}UseCase>((ref) {
  return Get{{name.pascalCase()}}UseCase(repository: ref.watch({{name.camelCase()}}RepositoryProvider));
});

final getAll{{name.pascalCase()}}UseCaseProvider = Provider.autoDispose<IGetAll{{name.pascalCase()}}UseCase>((
  ref,
) {
  return GetAll{{name.pascalCase()}}UseCase(repository: ref.watch({{name.camelCase()}}RepositoryProvider));
});