import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy_factory.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/filtering/cursor_and_search_db_query_strategy.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/filtering/cursor_db_query_strategy.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/filtering/search_db_query_strategy.dart';

class {{name.pascalCase()}}DBQueryStrategyFactory implements IDbQueryStrategyFactory {
  @override
  IDbQueryStrategy getStrategy(DbPaginatedQueryParams params) {
    if (params.query != null && params.query!.isNotEmpty) {
      return {{name.pascalCase()}}CursorAndSearchDbQueryStrategy(
        searchStrategy: {{name.pascalCase()}}SearchDbQueryStrategy(),
        cursorStrategy: {{name.pascalCase()}}CursorDbQueryStrategy(),
      );
    } else {
      return {{name.pascalCase()}}CursorDbQueryStrategy();
    }
  }
}
