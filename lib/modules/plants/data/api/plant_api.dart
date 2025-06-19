import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter_cursor/core/data/api/base_api_exceptions.dart';
import 'package:demo_flutter_cursor/modules/plants/data/api/dto/plant_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final plantApiProvider = Provider<PlantApi>(
  (ref) => PlantApiImpl(client: FirebaseFirestore.instance),
);

abstract class PlantApi {
  Future<List<PlantDTO>> getUserPlants(String userId);
  Future<PlantDTO?> get(String id);
  Future<void> create(PlantDTO plant);
  Future<void> update(PlantDTO plant);
  Future<void> delete(String id);
}

class PlantApiImpl implements PlantApi {
  final FirebaseFirestore _client;
  final Logger _logger;

  PlantApiImpl({required FirebaseFirestore client})
    : _client = client,
      _logger = Logger();

  CollectionReference<PlantDTO?> get _collection => _client
      .collection('plants')
      .withConverter(
        fromFirestore: (snapshot, _) {
          if (snapshot.exists) {
            return PlantDTO.fromFirestore(snapshot.id, snapshot.data()!);
          }
          return null;
        },
        toFirestore: (data, _) => data!.toFirestore(),
      );

  @override
  Future<List<PlantDTO>> getUserPlants(String userId) async {
    try {
      final querySnapshot = await _collection
          .where('user_id', isEqualTo: userId)
          .get();
      return querySnapshot.docs
          .map((doc) => doc.data())
          .where((plant) => plant != null)
          .cast<PlantDTO>()
          .toList();
    } catch (e, stacktrace) {
      _logger.e("Error getting user plants: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  @override
  Future<PlantDTO?> get(String id) async {
    try {
      final docSnapshot = await _collection.doc(id).get();
      return docSnapshot.data();
    } catch (e, stacktrace) {
      _logger.e("Error getting plant: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  @override
  Future<void> create(PlantDTO plant) async {
    try {
      if (plant.id == null) {
        throw Exception('Plant id cannot be null');
      }
      await _collection.doc(plant.id).set(plant);
    } catch (e, stacktrace) {
      _logger.e("Error creating plant: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  @override
  Future<void> update(PlantDTO plant) async {
    try {
      final data = plant.toJson();
      data.removeWhere((key, value) => value == null);
      await _collection.doc(plant.id).update(data);
    } catch (e, stacktrace) {
      _logger.e("Error updating plant: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _collection.doc(id).delete();
    } catch (e, stacktrace) {
      _logger.e("Error deleting plant: $e", stackTrace: stacktrace);
      throw ApiError(code: 0, message: '$e: $stacktrace');
    }
  }
}
