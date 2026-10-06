import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/core/caching/persistence/state_stores/entity_local_datasource.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy_factory.dart';
import 'package:{{project_name}}/core/network/http_client.dart';
import 'package:{{project_name}}/core/network/i_http_client.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/{{name.snakeCase()}}_local_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/dao/{{name.snakeCase()}}_drift_dao.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/dao/i_{{name.snakeCase()}}_dao.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/filtering/{{name.snakeCase()}}_db_query_strategy_factory.dart';

final httpClientProvider = Provider.autoDispose<IHttpClient>((ref) {
  return HttpClient();
});

// Not needed in offline first architecture
// final {{name.camelCase()}}sRemoteDatasourceProvider =
//     Provider.autoDispose<I{{name.pascalCase()}}sRemoteDatasource>((ref) {
//       final httpClient = ref.watch(httpClientProvider);
//       return {{name.pascalCase()}}sRemoteDatasource(httpClient: httpClient);
//     });

// Local datasource providers
final appDatabaseProvider = Provider.autoDispose<AppDatabase>((ref) {
  return AppDatabase();
});

final queryStrategyFactoryProvider =
    Provider.autoDispose<IDbQueryStrategyFactory>((ref) {
      return {{name.pascalCase()}}DBQueryStrategyFactory();
    });

final {{name.camelCase()}}sDaoProvider = Provider.autoDispose<I{{name.pascalCase()}}sDao>((ref) {
  return {{name.pascalCase()}}DriftDao(
    ref.watch(appDatabaseProvider),
    queryStrategyFactory: ref.watch(queryStrategyFactoryProvider),
  );
});

final {{name.camelCase()}}sLocalDatasourceProvider =
    Provider.autoDispose<EntityLocalDatasource>((ref) {
      return {{name.pascalCase()}}LocalDatasource({{name.camelCase()}}sDao: ref.watch({{name.camelCase()}}sDaoProvider));
    });