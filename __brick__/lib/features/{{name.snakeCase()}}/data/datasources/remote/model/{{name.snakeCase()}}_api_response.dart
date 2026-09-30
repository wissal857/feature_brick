import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_api_response.freezed.dart';
part '{{name.snakeCase()}}_api_response.g.dart';

@freezed
abstract class {{name.pascalCase()}}ApiResponse with _${{name.pascalCase()}}ApiResponse {
  const factory {{name.pascalCase()}}ApiResponse({
    required int id,
    required String name,
    @JsonKey(name: 'createdAt') required DateTime timestamp,
  }) = _{{name.pascalCase()}}ApiResponse;

  factory {{name.pascalCase()}}ApiResponse.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ApiResponseFromJson(json);

  factory {{name.pascalCase()}}ApiResponse.fromEntity({{name.pascalCase()}} entity) {
    return {{name.pascalCase()}}ApiResponse(
      id: entity.id,
      name: entity.name,
      timestamp: DateTime.now(),
    );
  }
}

extension {{name.pascalCase()}}ApiResponseExt on {{name.pascalCase()}}ApiResponse {
  {{name.pascalCase()}} toEntity() {
    return {{name.pascalCase()}}(id: id, name: name);
  }
}
