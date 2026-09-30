import 'package:{{project_name}}/core/data/models/local/paginated_cache_model.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

abstract interface class I{{name.pascalCase()}}LocalDatasource {
  Future<{{name.pascalCase()}}Data> findById(int id);
  Future<PaginatedCacheModel<{{name.pascalCase()}}Data>> findAll(
    DbPaginatedQueryParams<{{name.pascalCase()}}Data> queryParams,
  );
  Future<{{name.pascalCase()}}Data> add{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}});
  Future<{{name.pascalCase()}}Data> update{{name.pascalCase()}}({{name.pascalCase()}} {{name.camelCase()}});
  void delete{{name.pascalCase()}}(int id);
}
