import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/presentation/states/{{name.snakeCase()}}_data_state.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/providers/{{name.snakeCase()}}_usecases_providers.dart';

final {{name.camelCase()}}DataNotifierProvider =
    AsyncNotifierProvider.autoDispose<{{name.pascalCase()}}DataNotifier, {{name.pascalCase()}}DataState>(
      {{name.pascalCase()}}DataNotifier.new,
    );

/// Manages business data state for th{{name.camelCase()}} using AsyncNotifier
class {{name.pascalCase()}}DataNotifier extends AsyncNotifier<{{name.pascalCase()}}DataState> {
  @override
  Future<{{name.pascalCase()}}DataState> build() {
    return _fetch{{name.pascalCase()}}();
  }

  Future<void> add{{name.pascalCase()}}(String name) async {
    final add{{name.pascalCase()}}UseCase = ref.read(add{{name.pascalCase()}}UseCaseProvider);

    //final {{name.camelCase()}} = add{{name.pascalCase()}}(name);

    final result = await add{{name.pascalCase()}}UseCase.call(Add{{name.pascalCase()}}(name: name));
    switch (result) {
      case Success s:
        state = AsyncValue.data(
          {{name.pascalCase()}}DataState({{name.camelCase()}}: [...state.value!.{{name.camelCase()}}, s.value]),
        );
        break;
      case Error e:
        state = AsyncValue.error(e.err, StackTrace.current);
    }
  }

  /// Refreshes the {{name.camelCase()}} list
  Future<void> refresh{{name.pascalCase()}}() async {
    state = const AsyncValue.loading();
    try {
      final {{name.camelCase()}} = await _fetch{{name.pascalCase()}}();
      state = AsyncValue.data({{name.camelCase()}});
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Private method to fetch {{name.camelCase()}}
  Future<{{name.pascalCase()}}DataState> _fetch{{name.pascalCase()}}() async {
    final result = await ref.read(getAll{{name.pascalCase()}}UseCaseProvider).call();
    switch (result) {
      case Success s:
        return {{name.pascalCase()}}DataState({{name.camelCase()}}: s.value);
      case Error e:
        throw e;
    }
  }
}
