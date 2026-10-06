import 'package:drift/drift.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/model/{{name.snakeCase()}}_cache_model.dart';

class {{name.pascalCase()}}SearchDbQueryStrategy
    implements IDbQueryStrategy<T{{name.pascalCase()}}s, {{name.pascalCase()}}sData> {
  @override
  Expression<bool> buildWhereClause(
    DbPaginatedQueryParams<{{name.pascalCase()}}sData> params,
    T{{name.pascalCase()}}s table,
  ) {
    return params.query == null || params.query!.isEmpty
        ? Constant(true)
        : table.name.contains(params.query!);
  }
}
