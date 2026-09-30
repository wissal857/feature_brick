import 'package:{{project_name}}/core/data/models/remote/paginated_api_response.dart';
import 'package:{{project_name}}/core/network/i_http_client.dart';
import 'package:{{project_name}}/core/network/network_paginated_query_params.dart';
import 'package:{{project_name}}/core/network/remote_datasource_mixin.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/remote/endpoints.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/remote/i_{{name.snakeCase()}}_remote_datasource.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/data/datasources/remote/model/{{name.snakeCase()}}_api_response.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/add_{{name.snakeCase()}}.dart';
import 'package:{{project_name}}/features/{{name.snakeCase()}}/domain/entities/{{name.camelCase()}}.dart';

class {{name.pascalCase()}}RemoteDatasource
    with RemoteDataSourceMixin<{{name.pascalCase()}}ApiResponse>
    implements I{{name.pascalCase()}}RemoteDatasource {
  {{name.pascalCase()}}RemoteDatasource({required this.httpClient});

  @override
  final IHttpClient httpClient;

  @override
  Future<{{name.pascalCase()}}ApiResponse> add{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}}) {
    return postItem(
      endpoint: Endpoints.{{name.camelCase()}}Root,
      data: {{name.camelCase()}}.toJson(),
      parser: (json) => {{name.pascalCase()}}ApiResponse.fromJson(json),
    );
  }

  @override
  Future<{{name.pascalCase()}}ApiResponse> fetchById(int id) {
    return fetchSingle(
      endpoint: '${Endpoints.{{name.camelCase()}}Root}/$id',
      parser: (json) => {{name.pascalCase()}}ApiResponse.fromJson(json),
    );
  }

  @override
  Future<PaginatedApiResponse<{{name.pascalCase()}}ApiResponse>> fetchAll{{name.pascalCase()}}(
    NetworkPaginatedQueryParams params,
  ) {
    return fetchPaginatedList(
      endpoint: Endpoints.{{name.camelCase()}}Root,
      paginatedParams: params,
      parser: (json) => {{name.pascalCase()}}ApiResponse.fromJson(json),
    );
  }

  @override
  Future<{{name.pascalCase()}}ApiResponse> update{{name.pascalCase()}}(int id, {{name.pascalCase()}} order) {
    return putItem(
      endpoint: '${Endpoints.{{name.camelCase()}}Root}/$id',
      data: order.toJson(),
      parser: (json) => {{name.pascalCase()}}ApiResponse.fromJson(json),
    );
  }

  @override
  Future<void> delete{{name.pascalCase()}}(int id) {
    // TODO
    throw UnimplementedError();
  }
}
