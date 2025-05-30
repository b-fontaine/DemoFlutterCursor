import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter_cursor/core/data/api/base_api_exceptions.dart';
import 'package:demo_flutter_cursor/modules/example/data/api/dto/example_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final exampleApiProvider = Provider<ExampleApi>(
  (ref) => ExampleApiImpl(client: FirebaseFirestore.instance),
);

abstract class ExampleApi {
  Future<ExampleDTO?> get(String id);
}

class ExampleApiImpl implements ExampleApi {
  final FirebaseFirestore _client;
  final Logger _logger;

  ExampleApiImpl({required FirebaseFirestore client})
    : _client = client,
      _logger = Logger();

  CollectionReference<ExampleDTO?> get _collection => _client
      .collection('examples')
      .withConverter(
        fromFirestore: (snapshot, _) {
          if (snapshot.exists) {
            return ExampleDTO.fromJson(snapshot.id, snapshot.data()!);
          }
          return null;
        },
        toFirestore: (data, _) => data!.toJson(),
      );

  @override
  Future<ExampleDTO?> get(String id) async {
    try {
      final docSnapshot = await _collection.doc(id).get();
      return docSnapshot.data();
    } catch (e, stacktrace) {
      _logger.e("Error getting example: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  Future<void> update(ExampleDTO example) async {
    try {
      final data = example.toJson();
      data.removeWhere((key, value) => value == null);
      await _collection.doc(example.id).update(data);
    } catch (e, stacktrace) {
      _logger.e("Error updating example: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  Future<void> create(ExampleDTO example) async {
    try {
      if (example.id == null) {
        throw Exception('Example id cannot be null');
      }
      await _collection.doc(example.id).set(example);
    } catch (e, stacktrace) {
      _logger.e("Error creating example: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  Future<void> delete(String id) async {
    try {
      await _collection.doc(id).delete();
    } catch (e, stacktrace) {
      _logger.e("Error deleting example: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }
}
