// import 'package:drift/drift.dart';
// import 'package:{{project_name}}/core/database/app_db.dart';
// import 'package:{{project_name}}/core/caching/sync_engine/mutations/mutation_status.dart';
// import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
// import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

// extension TDataMapper on {{name.pascalCase()}}sData {
//   {{name.pascalCase()}} to{{name.pascalCase()}}() => {{name.pascalCase()}}(id: id, name: name);
// }

// // TODO: add partial update

// /// Converts an orders instance to a drift companion instance
// /// suited for insert operations.
// extension Add{{name.pascalCase()}}CompanionMapper on Add{{name.pascalCase()}} {
//   T{{name.pascalCase()}}sCompanion toInsertCompanion(String idempotencyKey) {
//     return T{{name.pascalCase()}}sCompanion.insert(
//       name: name,
//       createdAt: DateTime.now(),
//       idempotencyKey: idempotencyKey,
//       syncStatus: MutationStatus.pending.label,);
//   }
// }

// extension {{name.pascalCase()}}sCompanionMapper on {{name.pascalCase()}} {
//   T{{name.pascalCase()}}sCompanion toUpdateCompanion() {
//     return T{{name.pascalCase()}}sCompanion(
//       id: Value(id),
//       name: Value(name),
//       updatedAt: Value(DateTime.now()),);
//   }
// }
