import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';

abstract class PlantRepository {
  Future<List<Plant>> getUserPlants(String userId);
  Future<Plant?> get(String id);
  Future<void> create(Plant plant);
  Future<void> update(Plant plant);
  Future<void> delete(String id);
}
