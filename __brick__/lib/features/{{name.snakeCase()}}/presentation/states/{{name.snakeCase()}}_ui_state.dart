import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_ui_state.freezed.dart';

/// Represents the UI state for the {{name.camelCase()}}
@freezed
abstract class {{name.pascalCase()}}UIState with _${{name.pascalCase()}}UIState {
  const factory {{name.pascalCase()}}UIState({
    @Default(false) bool isSubmitting,

    /// Error message to display (null if no error)
    @Default(null) String? errorMessage,

    /// Scroll position preservation key
    @Default(null) String? scrollKey,

    /// Whether comments are currently being refreshed
    @Default(false) bool isRefreshing,
  }) = _{{name.pascalCase()}}UIState;

  // Convenience getters
  const {{name.pascalCase()}}UIState._();

  /// Check if any interaction is in progress
  bool get isInteracting => isSubmitting || isRefreshing;

  /// Check if there's an error to display
  bool get hasError => errorMessage != null;
}
