import 'package:drift/drift.dart';

@DataClassName('{{name.pascalCase()}}Data')
class T{{name.pascalCase()}} extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('pick_name')();
  // Metadata
  TextColumn get idempotencyKey => text().named('idempotency_key')();
  TextColumn get etag => text().named('etag')();
  DateTimeColumn? get nextRefreshAt => dateTime().named('next_refresh_at').nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn? get updatedAt => dateTime().nullable()();
}