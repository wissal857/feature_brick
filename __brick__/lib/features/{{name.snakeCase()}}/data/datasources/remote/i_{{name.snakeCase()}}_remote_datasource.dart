import 'package:{{project_name}}/core/data/models/remote/paginated_api_response.dart';
import 'package:{{project_name}}/core/network/network_paginated_query_params.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/remote/model/{{name.snakeCase()}}_api_response.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

abstract interface class I{{name.pascalCase()}}RemoteDatasource {
  Future<{{name.pascalCase()}}ApiResponse> add{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}});
  Future<{{name.pascalCase()}}ApiResponse> fetchById(int id);
  Future<PaginatedApiResponse<{{name.pascalCase()}}ApiResponse>> fetchAll{{name.pascalCase()}}(
    NetworkPaginatedQueryParams params,
  );
  Future<{{name.pascalCase()}}ApiResponse> update{{name.pascalCase()}}(int id, {{name.pascalCase()}} {{name.camelCase()}});
  Future<void> delete{{name.pascalCase()}}(int id);
}
