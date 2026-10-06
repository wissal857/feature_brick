import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/presentation/states/{{name.snakeCase()}}_ui_state.dart';

/// Manages UI state for {{name.camelCase()}}
final {{name.camelCase()}}UINotifierProvider =
    NotifierProvider.autoDispose<{{name.pascalCase()}}UINotifier, {{name.pascalCase()}}UIState>(
      {{name.pascalCase()}}UINotifier.new,
    );

class {{name.pascalCase()}}UINotifier extends Notifier<{{name.pascalCase()}}UIState> {
  @override
  {{name.pascalCase()}}UIState build() {
    return const {{name.pascalCase()}}UIState();
  }

  /// Starts the comment submission process
  void startSubmitting() {
    state = state.copyWith(isSubmitting: true, errorMessage: null);
  }

  /// Stops the comment submission process
  void stopSubmitting() {
    state = state.copyWith(isSubmitting: false);
  }

  /// Starts refreshing comments
  void startRefreshing() {
    state = state.copyWith(isRefreshing: true, errorMessage: null);
  }

  /// Stops refreshing comments
  void stopRefreshing() {
    state = state.copyWith(isRefreshing: false);
  }

  /// Sets an error message to display
  void setError(String? errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }

  /// Clears any error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  /// Updates scroll position for preservation
  void updateScrollKey(String scrollKey) {
    state = state.copyWith(scrollKey: scrollKey);
  }
}
