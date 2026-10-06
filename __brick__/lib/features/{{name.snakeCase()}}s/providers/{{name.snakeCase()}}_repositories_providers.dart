import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/core/caching/providers/persistence_providers.dart';
import 'package:{{project_name}}/core/caching/providers/sync_engine_providers.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/repositories/{{name.snakeCase()}}_offline_first_repository.dart';

final {{name.camelCase()}}RepositoryProvider = Provider.autoDispose<I{{name.pascalCase()}}Repository>((ref) {
  return {{name.pascalCase()}}OfflineFirstRepository(
    localStateStore: ref.read(localStateStoreProvider),
    syncEngine: ref.read(syncEngineProvider),
  );
});
