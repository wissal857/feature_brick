import 'package:drift/drift.dart';
import 'package:{{project_name}}/core/database/app_db.dart';
import 'package:{{project_name}}/core/database/i_db_sort_by.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/data/datasources/local/model/{{name.snakeCase()}}_cache_model.dart';

enum Db{{name.pascalCase()}}SortBy implements IDbSortBy<T{{name.pascalCase()}}s> {
  name(isDefault: false, label: 'some name'),
  id(isDefault: true, label: 'default');

  @override
  final String label;
  @override
  final bool isDefault;

  const Db{{name.pascalCase()}}SortBy({required this.isDefault, required this.label});

  @override
  List<OrderingTerm Function(T{{name.pascalCase()}}s)> toOrderingTerms(
    AppDatabase db,
    bool ascending,
  ) {
    switch (this) {
      case name:
        return ascending
            ? [
                (e) => OrderingTerm.asc(db.t{{name.pascalCase()}}s.name),
                (e) => OrderingTerm.asc(e.id),
              ]
            : [
                (e) => OrderingTerm.desc(db.t{{name.pascalCase()}}s.name),
                (e) => OrderingTerm.desc(e.id),
              ];
      case id:
        return ascending
            ? [(e) => OrderingTerm.asc(db.t{{name.pascalCase()}}s.id)]
            : [(e) => OrderingTerm.desc(db.t{{name.pascalCase()}}s.id)];
    }
  }
}
