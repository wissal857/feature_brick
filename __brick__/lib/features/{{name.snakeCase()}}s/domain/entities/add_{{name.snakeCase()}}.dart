import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_{{name.snakeCase()}}.freezed.dart';
part 'add_{{name.snakeCase()}}.g.dart';

@freezed
@JsonSerializable(createFactory: false)
class Add{{name.pascalCase()}} with _$Add{{name.pascalCase()}} {
  const Add{{name.pascalCase()}}({@JsonKey(name: 'name') required this.name});

  Map<String, dynamic> toJson() => _$Add{{name.pascalCase()}}ToJson(this);

  @override
  final String name;
}
