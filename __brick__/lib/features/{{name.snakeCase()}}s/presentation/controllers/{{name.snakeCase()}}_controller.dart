import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/domain/entities/{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/presentation/notifiers/{{name.snakeCase()}}_data_notifier.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/presentation/notifiers/{{name.snakeCase()}}_ui_notifier.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/presentation/states/{{name.snakeCase()}}_data_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}s/presentation/states/{{name.snakeCase()}}_ui_state.dart';

/// Coordinates between data and UI notifiers for the
/// Internal controller used only within the  feature
class {{name.pascalCase()}}Controller {
  final Ref _ref;

  {{name.pascalCase()}}Controller(this._ref);

  /// Current async data state
  AsyncValue<{{name.pascalCase()}}DataState> get _dataState =>
      _ref.watch({{name.camelCase()}}DataNotifierProvider);

  /// Current UI state
  {{name.pascalCase()}}UIState get _uiState => _ref.watch({{name.camelCase()}}UINotifierProvider);

  /// Get the list of {{name.camelCase()}}
  List<{{name.pascalCase()}}> get {{name.camelCase()}} => _dataState.value?.{{name.camelCase()}} ?? [];

  /// Get whether a comment is being submitted
  bool get isSubmitting => _uiState.isSubmitting;

  /// Get whether comments are being refreshed
  bool get isRefreshing => _uiState.isRefreshing;

  /// Get error message if any
  String? get errorMessage => _uiState.errorMessage;

  /// Get scroll key for position preservation
  String? get scrollKey => _uiState.scrollKey;

  /// Check if any interaction is in progress
  bool get isInteracting => _uiState.isInteracting;

  /// Check if there's an error to display
  bool get hasError => _uiState.hasError;

  /// Converts AsyncValue to the format expected by UI components
  AsyncValue<List<{{name.pascalCase()}}>> get {{name.camelCase()}}AsyncValue {
    return _dataState.when(
      data: (data) => AsyncValue.data(data.{{name.camelCase()}}),
      loading: () => const AsyncValue.loading(),
      error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    );
  }

  // Data actions

  /// Adds a new {{name.camelCase()}} with coordinated UI state
  Future<void> add{{name.pascalCase()}}(String name) async {
    if (name.trim().isEmpty) return;

    _ref.read({{name.camelCase()}}UINotifierProvider.notifier).startSubmitting();
    _ref.read({{name.camelCase()}}UINotifierProvider.notifier).clearError();

    try {
      await _ref
          .read({{name.camelCase()}}DataNotifierProvider.notifier)
          .add{{name.pascalCase()}}(name.trim());
    } catch (error) {
      _ref
          .read({{name.camelCase()}}UINotifierProvider.notifier)
          .setError('Failed to add {{name.pascalCase()}}: $error');
      rethrow;
    } finally {
      _ref.read({{name.camelCase()}}UINotifierProvider.notifier).stopSubmitting();
    }
  }

  /// Refreshes the {{name.camelCase()}} with coordinated UI state
  Future<void> refreshComments() async {
    _ref.read({{name.camelCase()}}UINotifierProvider.notifier).startRefreshing();
    _ref.read({{name.camelCase()}}UINotifierProvider.notifier).clearError();

    try {
      await _ref.read({{name.camelCase()}}DataNotifierProvider.notifier).refresh{{name.pascalCase()}}();
    } catch (error) {
      _ref
          .read({{name.camelCase()}}UINotifierProvider.notifier)
          .setError('Failed to refresh {{name.camelCase()}}: $error');
      rethrow;
    } finally {
      _ref.read({{name.camelCase()}}UINotifierProvider.notifier).stopRefreshing();
    }
  }

  // UI actions

  /// Clears any error message
  void clearError() {
    _ref.read({{name.camelCase()}}UINotifierProvider.notifier).clearError();
  }

  /// Updates scroll position for preservation
  void updateScrollKey(String scrollKey) {
    _ref.read({{name.camelCase()}}UINotifierProvider.notifier).updateScrollKey(scrollKey);
  }

  // Convenience methods for widgets

  /// Get total {{name.camelCase()}} count
  int get {{name.camelCase()}}Count => {{name.camelCase()}}.length;

  /// Check if {{name.camelCase()}} are empty
  bool get has{{name.pascalCase()}} => {{name.camelCase()}}.isNotEmpty;

  /// Check if {{name.camelCase()}} are loading for the first time
  bool get isLoadingFirstTime => _dataState.isLoading && {{name.camelCase()}}.isEmpty;

  /// Check if {{name.camelCase()}} failed to load for the first time
  bool get hasInitialError => _dataState.hasError && {{name.camelCase()}}.isEmpty;
}

/// Internal provider for the {{name.camelCase()}} controller
final {{name.camelCase()}}ControllerProvider = Provider.autoDispose<{{name.pascalCase()}}Controller>((ref) {
  return {{name.pascalCase()}}Controller(ref);
});
