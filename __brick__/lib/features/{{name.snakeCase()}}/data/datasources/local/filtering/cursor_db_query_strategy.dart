import 'package:drift/drift.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy.dart';
import 'package:{{project_name}}/core/sorting/sort_direction.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/model/{{name.snakeCase()}}_cache_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/sorting/db_{{name.snakeCase()}}_sort_by.dart';

/// The cursor strategy used used here is a composite cursor
/// so that if two rows are equal it uses their id as the cursor
/// instead of the sortBy column
class {{name.pascalCase()}}CursorDbQueryStrategy
    implements IDbQueryStrategy<T{{name.pascalCase()}}, {{name.pascalCase()}}Data> {
  @override
  Expression<bool> buildWhereClause(
    DbPaginatedQueryParams<{{name.pascalCase()}}Data> params,
    T{{name.pascalCase()}} table,
  ) {
    return switch (params.sortBy) {
      Db{{name.pascalCase()}}SortBy.name =>
        params.sortDirection == SortDirection.ascending
            ? table.name.isBiggerThan(Constant(params.cursor.name)) |
                  (table.name.equals(params.cursor.name) &
                      table.id.isBiggerThan(Constant(params.cursor.id)))
            : table.name.isSmallerThan(Constant(params.cursor.name)) |
                  (table.name.equals(params.cursor.name) &
                      table.id.isSmallerThan(Constant(params.cursor.id))),
      _ =>
        params.sortDirection == SortDirection.ascending
            ? table.id.isBiggerThan(Constant(params.cursor.id))
            : table.id.isSmallerThan(Constant(params.cursor.id)),
    };
  }
}
