import 'package:{{project_name}}/core/data/models/local/paginated_cache_model.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/dao/i_{{name.snakeCase()}}_dao.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/i_{{name.snakeCase()}}_local_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}LocalDatasource implements I{{name.pascalCase()}}LocalDatasource {
  const {{name.pascalCase()}}LocalDatasource({required I{{name.pascalCase()}}Dao {{name.camelCase()}}Dao})
    : _{{name.camelCase()}}Dao = {{name.camelCase()}}Dao;

  final I{{name.pascalCase()}}Dao _{{name.camelCase()}}Dao;

  @override
  Future<{{name.pascalCase()}}Data> findById(int id) {
    return _{{name.camelCase()}}Dao.findById(id);
  }

  @override
  Future<PaginatedCacheModel<{{name.pascalCase()}}Data>> findAll(
    DbPaginatedQueryParams<{{name.pascalCase()}}Data> queryParams,
  ) {
    return _{{name.camelCase()}}Dao.findAll(queryParams);
  }

  @override
  Future<{{name.pascalCase()}}Data> add{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}}) {
    return _{{name.camelCase()}}Dao.insert{{name.pascalCase()}}({{name.camelCase()}});
  }

  @override
  Future<{{name.pascalCase()}}Data> update{{name.pascalCase()}}({{name.pascalCase()}} {{name.camelCase()}}) {
    return _{{name.camelCase()}}Dao.update{{name.pascalCase()}}({{name.camelCase()}});
  }

  @override
  void delete{{name.pascalCase()}}(int id) {
    _{{name.camelCase()}}Dao.delete{{name.pascalCase()}}(id);
  }
}
