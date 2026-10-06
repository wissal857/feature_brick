import 'package:drift/drift.dart';
import 'package:{{project_name}}/core/data/models/local/paginated_cache_model.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';
import 'package:{{project_name}}/core/database/drift_dao_mixin.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy_factory.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/dao/i_{{name.snakeCase()}}_dao.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/model/{{name.snakeCase()}}_cache_model.dart';

part '{{name.snakeCase()}}_drift_dao.g.dart';

@DriftAccessor(tables: [T{{name.pascalCase()}}s])
class {{name.pascalCase()}}DriftDao extends DatabaseAccessor<AppDatabase>
    with _${{name.pascalCase()}}DriftDaoMixin, DriftDaoMixin
    implements I{{name.pascalCase()}}sDao {
  {{name.pascalCase()}}DriftDao(
    super.attachedDatabase, {
    required IDbQueryStrategyFactory queryStrategyFactory,
  }) : _queryStrategyFactory = queryStrategyFactory;

  final IDbQueryStrategyFactory _queryStrategyFactory;

  @override
  Future<{{name.pascalCase()}}sData> findById(int id) async {
    return await (db.select(
      db.t{{name.pascalCase()}}s,
    )..where((t) => t.id.equals(id))).getSingle();
  }

  @override
  Future<PaginatedCacheModel<{{name.pascalCase()}}sData>> findAll(
    DbPaginatedQueryParams params,
  ) {
    return executePaginatedQuery<T{{name.pascalCase()}}s, {{name.pascalCase()}}sData>(
      db: db,
      table: db.t{{name.pascalCase()}}s,
      //mapper: (r) => r.(),
      idSelector: (r) => r.id,
      params: params,
      queryStrategyFactory: _queryStrategyFactory,
    );
  }

  @override
  Future<{{name.pascalCase()}}sData> insert{{name.pascalCase()}}(T{{name.pascalCase()}}sCompanion {{name.camelCase()}}) async {
    return db.into(db.t{{name.pascalCase()}}s).insertReturning({{name.camelCase()}});
  }

  @override
  Future<{{name.pascalCase()}}sData> update{{name.pascalCase()}}(T{{name.pascalCase()}}sCompanion {{name.camelCase()}}) async {
    await (db.update(db.t{{name.pascalCase()}}s)..where((t) => t.id.equals({{name.camelCase()}}.id.value))).write(
      {{name.camelCase()}},
    );
    return await (db.select(
      db.t{{name.pascalCase()}}s,
    )..where((t) => t.id.equals({{name.camelCase()}}.id.value))).getSingle();
  }

  @override
  Future<void> delete{{name.pascalCase()}}(int id) async {
    await (db.delete(db.t{{name.pascalCase()}}s)..where((t) => t.id.equals(id))).go();
  }
}
