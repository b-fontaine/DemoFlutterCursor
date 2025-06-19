import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';

abstract class PlantRepository {
  Future<List<Plant>> getAll();
  Future<Plant?> get(String id);
  Future<Plant> add(Plant plant);
  Future<Plant> update(Plant plant);
  Future<void> delete(String id);
}
