import 'package:{{project_name}}/core/data/models/local/paginated_cache_model.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';

abstract interface class I{{name.pascalCase()}}sDao {
  Future<{{name.pascalCase()}}sData> findById(int id);
  Future<PaginatedCacheModel<{{name.pascalCase()}}sData>> findAll(
    DbPaginatedQueryParams params,
  );
  Future<{{name.pascalCase()}}sData> insert{{name.pascalCase()}}(T{{name.pascalCase()}}sCompanion {{name.camelCase()}});
  Future<{{name.pascalCase()}}sData> update{{name.pascalCase()}}(T{{name.pascalCase()}}sCompanion {{name.camelCase()}});
  Future<void> delete{{name.pascalCase()}}(int id);
}
