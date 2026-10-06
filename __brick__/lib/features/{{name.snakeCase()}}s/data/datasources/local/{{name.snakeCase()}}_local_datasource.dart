import 'package:drift/drift.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/dao/i_{{name.snakeCase()}}_dao.dart';
import 'package:{{project_name}}/core/caching/persistence/state_stores/entity_local_datasource.dart';
import 'package:{{project_name}}/app/utils/entity_type.dart';

class {{name.pascalCase()}}LocalDatasource implements EntityLocalDatasource {
  const {{name.pascalCase()}}LocalDatasource({required I{{name.pascalCase()}}sDao {{name.camelCase()}}sDao})
    : _{{name.camelCase()}}sDao = {{name.camelCase()}}sDao;

  final I{{name.pascalCase()}}sDao _{{name.camelCase()}}sDao;

   @override
  EntityType get entityType => EntityType.{{name.camelCase()}}s;

  @override
  Future<void> delete(int entityId) async {
    await _{{name.camelCase()}}sDao.delete{{name.pascalCase()}}(entityId);
  }

  @override
  Future<Map<String, dynamic>?> get(int entityId) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> resetTombstone(int entityId, String syncStatus) async {
    await _{{name.camelCase()}}sDao.update{{name.pascalCase()}}(
      T{{name.pascalCase()}}sCompanion(isDeleted: Value(false), syncStatus: Value(syncStatus)),
    );
  }

  @override
  Future<void> restore(int entityId, Map<String, dynamic> snapshot) async {
    T{{name.pascalCase()}}sCompanion updated{{name.pascalCase()}} = {{name.pascalCase()}}sData.fromJson(snapshot).toCompanion(true);
    await _{{name.camelCase()}}sDao.update{{name.pascalCase()}}(updated{{name.pascalCase()}});
  }

  @override
  Future<int> save(Map<String, dynamic> state) async {
    return (await _{{name.camelCase()}}sDao.insert{{name.pascalCase()}}(
      {{name.pascalCase()}}sData.fromJson(state).toCompanion(true),
    )).id;
  }

  @override
  Future<void> update(int entityId, Map<String, dynamic> state) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
