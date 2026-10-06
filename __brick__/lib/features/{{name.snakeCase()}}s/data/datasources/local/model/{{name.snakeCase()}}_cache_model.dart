import 'package:drift/drift.dart';

@DataClassName('{{name.pascalCase()}}sData')
class T{{name.pascalCase()}}s extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('pick_name')();
  TextColumn get idempotencyKey => text().named('idempotency_key')();
  TextColumn get serverId => text().named('server_id').nullable()();
  TextColumn? get etag => text().named('etag').nullable()();
  BoolColumn get isDeleted =>
      boolean().named('is_deleted').withDefault(const Constant(false))();
  DateTimeColumn? get nextRefreshAt =>
      dateTime().named('next_refresh_at').nullable()();
  TextColumn get syncStatus => text().named('sync_status')();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn? get updatedAt => dateTime().named('updated_at').nullable()();
}