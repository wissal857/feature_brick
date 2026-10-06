import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';
part '{{name.snakeCase()}}.g.dart';

@freezed
@JsonSerializable(createFactory: false)
class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  const {{name.pascalCase()}}({required this.id, required this.name});

  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ToJson(this);

  @override
  final int id;
  @override
  final String name;
}
