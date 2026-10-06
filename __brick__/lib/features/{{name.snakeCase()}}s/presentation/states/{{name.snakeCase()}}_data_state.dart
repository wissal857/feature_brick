import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/entities/{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_data_state.freezed.dart';

/// Represents the UI state for the {{name.camelCase()}}
@freezed
abstract class {{name.pascalCase()}}DataState with _${{name.pascalCase()}}DataState {
  const factory {{name.pascalCase()}}DataState({@Default([]) List<{{name.pascalCase()}}> {{name.camelCase()}}}) =
      _{{name.pascalCase()}}DataState;

  // Convenience getters
  const {{name.pascalCase()}}DataState._();
}
