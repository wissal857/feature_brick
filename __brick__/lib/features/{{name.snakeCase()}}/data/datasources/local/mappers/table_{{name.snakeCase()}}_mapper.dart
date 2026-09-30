import 'package:drift/drift.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

extension TDataMapper on {{name.pascalCase()}}Data {
  {{name.pascalCase()}} to{{name.pascalCase()}}() => {{name.pascalCase()}}(id: id, name: name);
}

// TODO: add partial update

/// Converts an orders instance to a drift companion instance
/// suited for insert operations.
extension Add{{name.pascalCase()}}CompanionMapper on Add{{name.pascalCase()}} {
  T{{name.pascalCase()}}Companion toInsertCompanion() {
    return T{{name.pascalCase()}}Companion.insert(name: name);
  }
}

extension {{name.pascalCase()}}CompanionMapper on {{name.pascalCase()}} {
  T{{name.pascalCase()}}Companion toUpdateCompanion({required int id}) {
    return T{{name.pascalCase()}}Companion(id: Value(id), name: Value(name));
  }
}
