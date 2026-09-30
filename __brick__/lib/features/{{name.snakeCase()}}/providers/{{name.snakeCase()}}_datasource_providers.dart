import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy_factory.dart';
import 'package:{{project_name}}/core/network/http_client.dart';
import 'package:{{project_name}}/core/network/i_http_client.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/dao/i_{{name.snakeCase()}}_dao.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/dao/{{name.snakeCase()}}_drift_dao.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/filtering/db_query_strategy_factory.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/i_{{name.snakeCase()}}_local_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/{{name.snakeCase()}}_local_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/remote/i_{{name.snakeCase()}}_remote_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/remote/{{name.snakeCase()}}_remote_datasource.dart';

final httpClientProvider = Provider.autoDispose<IHttpClient>((ref) {
  return HttpClient();
});
final {{name.camelCase()}}RemoteDatasourceProvider =
    Provider.autoDispose<I{{name.pascalCase()}}RemoteDatasource>((ref) {
      final httpClient = ref.watch(httpClientProvider);
      return {{name.pascalCase()}}RemoteDatasource(httpClient: httpClient);
    });

// Local datasource providers
final appDatabaseProvider = Provider.autoDispose<AppDatabase>((ref) {
  return AppDatabase();
});

final queryStrategyFactoryProvider =
    Provider.autoDispose<IDbQueryStrategyFactory>((ref) {
      return {{name.pascalCase()}}DBQueryStrategyFactory();
    });

final {{name.camelCase()}}DaoProvider = Provider.autoDispose<I{{name.pascalCase()}}Dao>((ref) {
  return {{name.pascalCase()}}DriftDao(
    ref.watch(appDatabaseProvider),
    queryStrategyFactory: ref.watch(queryStrategyFactoryProvider),
  );
});

final {{name.camelCase()}}LocalDatasourceProvider =
    Provider.autoDispose<I{{name.pascalCase()}}LocalDatasource>((ref) {
      return {{name.pascalCase()}}LocalDatasource({{name.camelCase()}}Dao: ref.watch({{name.camelCase()}}DaoProvider));
    });
