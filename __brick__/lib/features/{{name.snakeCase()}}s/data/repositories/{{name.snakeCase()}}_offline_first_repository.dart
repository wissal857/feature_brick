import 'package:{{project_name}}/app/utils/entity_type.dart';
import 'package:{{project_name}}/core/caching/models/sync_mutation_request.dart';
import 'package:{{project_name}}/core/caching/persistence/state_stores/i_local_state_store.dart';
import 'package:{{project_name}}/core/caching/sync_engine/i_sync_engine.dart';
import 'package:{{project_name}}/core/utils/idempotency_key.dart';
import 'package:{{project_name}}/core/utils/result.dart';
import 'package:{{project_name}}/features/comments/data/repositories/i_comment_repository.dart';
import 'package:{{project_name}}/features/comments/domain/entities/add_comment.dart';
import 'package:{{project_name}}/features/comments/domain/entities/comment.dart';

class {{name.pascalCase()}}OfflineFirstRepository implements I{{name.pascalCase()}}Repository {

   {{name.pascalCase()}}OfflineFirstRepository({
    required ILocalStateStore localStateStore,
    required ISyncEngine syncEngine,
  }) : _localStateStore = localStateStore,
       _syncEngine = syncEngine;

  final ILocalStateStore _localStateStore;
  final ISyncEngine _syncEngine;

  @override
  Future<Result<{{name.pascalCase()}}>> save{{name.pascalCase()}}(Add{{name.pascalCase()}} {{name.camelCase()}}) async {
    try {
      // generate the idempotency key
      String idempotencyKey = IdempotencyKey.generate({{name.camelCase()}}.toJson());
      // save the entity with local state store
      final mutation = await _localStateStore.save(
        syncRequest:
            SyncMutationRequest.create(
                  entityType: EntityType.{{name.camelCase()}}s,
                  idempotencyKey: idempotencyKey,
                  payload: {{name.camelCase()}}.toJson(),
                  timestamp: DateTime.now(),
                )
                as SyncCreateRequest,
      );
      // add the mutation in the queue
      _syncEngine.enqueueMutation(mutation);
      return Result.success(
        value: {{name.pascalCase()}}(id: mutation.entityLocalId, name: {{name.camelCase()}}.name),
      );
    } catch (e) {
      // TODO map exception to failure
      rethrow;
    }
  }

  @override
  Future<Result<{{name.pascalCase()}}>> find{{name.pascalCase()}}ById(int id) {
    // TODO: implement find{{name.pascalCase()}}ById
    throw UnimplementedError();
  }
}
