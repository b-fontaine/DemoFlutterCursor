import 'exemple_entity.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_functions/firebase_functions.dart';
import 'package:logger/logger.dart';
import 'package:demo_flutter_cursor/core/data/api/base_api_exceptions.dart';

final exampleApiProvider = Provider<ExampleApi>(
  (ref) => ExampleApiImpl(
    client: FirebaseFirestore.instance,
    firebaseFunctions: FirebaseFunctions.instance,
  ),
);

abstract class ExampleApi {
  Future<ExampleEntity?> get(String id);
}

class ExampleApiImpl implements ExampleApi {
  final FirebaseFirestore _client;
  final FirebaseFunctions _firebaseFunctions;
  final Logger _logger;

  ExampleApiImpl({
    required FirebaseFirestore client,
    required FirebaseFunctions firebaseFunctions,
  }) : _client = client,
       _firebaseFunctions = firebaseFunctions,
       _logger = Logger();

  CollectionReference<ExampleEntity?> get _collection => _client
      .collection('examples')
      .withConverter(
        fromFirestore: (snapshot, _) {
          if (snapshot.exists) {
            return ExampleEntity.fromJson(snapshot.data()!);
          }
          return null;
        },
        toFirestore: (data, _) => data!.toJson(),
      );

  @override
  Future<ExampleEntity?> get(String id) async {
    try {
      final docSnapshot = await _collection.doc(id).get();
      return docSnapshot.data();
    } catch (e, stacktrace) {
      _logger.e("Error getting example: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  Future<void> update(ExampleEntity example) async {
    try {
      final data = example.toJson();
      data.removeWhere((key, value) => value == null);
      await _collection.doc(example.id).update(data);
    } catch (e, stacktrace) {
      _logger.e("Error updating example: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  Future<void> create(ExampleEntity example) async {
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
