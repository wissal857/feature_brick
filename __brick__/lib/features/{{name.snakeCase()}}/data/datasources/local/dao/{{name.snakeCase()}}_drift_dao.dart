import 'package:drift/drift.dart';
import 'package:{{project_name}}/core/data/models/local/paginated_cache_model.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/db_paginated_query_params.dart';
import 'package:{{project_name}}/core/database/drift_dao_mixin.dart';
import 'package:{{project_name}}/core/database/i_db_query_strategy_factory.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/dao/i_{{name.snakeCase()}}_dao.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/mappers/table_{{name.snakeCase()}}_mapper.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/local/model/{{name.snakeCase()}}_cache_model.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_drift_dao.g.dart';

@DriftAccessor(tables: [T{{name.pascalCase()}}])
class {{name.pascalCase()}}DriftDao extends DatabaseAccessor<AppDatabase>
    with _${{name.pascalCase()}}DriftDaoMixin, DriftDaoMixin
    implements I{{name.pascalCase()}}Dao {
  {{name.pascalCase()}}DriftDao(
    super.attachedDatabase, {
    required IDbQueryStrategyFactory queryStrategyFactory,
  }) : _queryStrategyFactory = queryStrategyFactory;

  final IDbQueryStrategyFactory _queryStrategyFactory;

  @override
  Future<{{name.pascalCase()}}Data> findById(int id) async {
    return await (db.select(
      db.t{{name.pascalCase()}},
    )..where((t) => t.id.equals(id))).getSingle();
  }

  @override
  Future<PaginatedCacheModel<{{name.pascalCase()}}Data>> findAll(
    DbPaginatedQueryParams params,
  ) {
    return executePaginatedQuery<{{name.pascalCase()}}, T{{name.pascalCase()}}, {{name.pascalCase()}}Data>(
      db: db,
      table: db.t{{name.pascalCase()}},
      //mapper: (r) => r.(),
      idSelector: (r) => r.id,
      params: params,
      queryStrategyFactory: _queryStrategyFactory,
    );
  }

  @override
  Future<{{name.pascalCase()}}Data> insert{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}}) async {
    return db.into(db.t{{name.pascalCase()}}).insertReturning({{name.camelCase()}}.toInsertCompanion());
  }

  @override
  Future<{{name.pascalCase()}}Data> update{{name.pascalCase()}}({{name.pascalCase()}} {{name.camelCase()}}) async {
    await (db.update(db.t{{name.pascalCase()}})..where((t) => t.id.equals({{name.camelCase()}}.id))).write(
      {{name.camelCase()}}.toUpdateCompanion(id: {{name.camelCase()}}.id),
    );
    return await (db.select(
      db.t{{name.pascalCase()}},
    )..where((t) => t.id.equals({{name.camelCase()}}.id))).getSingle();
  }

  @override
  Future<void> delete{{name.pascalCase()}}(int id) async {
    await (db.delete(db.t{{name.pascalCase()}})..where((t) => t.id.equals(id))).go();
  }
}
