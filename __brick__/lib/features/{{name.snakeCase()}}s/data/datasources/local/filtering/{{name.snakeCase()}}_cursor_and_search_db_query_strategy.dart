import 'package:drift/drift.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/filtering/{{name.snakeCase()}}_cursor_db_query_strategy.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/filtering/{{name.snakeCase()}}_search_db_query_strategy.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/model/{{name.snakeCase()}}_cache_model.dart';

class {{name.pascalCase()}}CursorAndSearchDbQueryStrategy
    implements IDbQueryStrategy<T{{name.pascalCase()}}s, {{name.pascalCase()}}sData> {
  const {{name.pascalCase()}}CursorAndSearchDbQueryStrategy({
    required {{name.pascalCase()}}SearchDbQueryStrategy searchStrategy,
    required {{name.pascalCase()}}CursorDbQueryStrategy cursorStrategy,
  }) : _searchStrategy = searchStrategy,
       _cursorStrategy = cursorStrategy;

  final {{name.pascalCase()}}SearchDbQueryStrategy _searchStrategy;
  final {{name.pascalCase()}}CursorDbQueryStrategy _cursorStrategy;

  @override
  Expression<bool> buildWhereClause(
    DbPaginatedQueryParams<{{name.pascalCase()}}sData> params,
    T{{name.pascalCase()}}s table,
  ) {
    final searchExpression = params.query == null || params.query!.isEmpty
        ? const Constant(true)
        : _searchStrategy.buildWhereClause(params, table);
    final cursorExpression = _cursorStrategy.buildWhereClause(params, table);

    return searchExpression & cursorExpression;
  }
}
