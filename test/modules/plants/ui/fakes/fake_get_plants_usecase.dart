import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/get_plants_usecase.dart';

class FakeGetPlantsUseCase implements GetPlantsUseCase {
  final List<Plant> _plants = [];
  bool shouldThrowError = false;

  void addPlant(Plant plant) {
    _plants.add(plant);
  }

  void clear() {
    _plants.clear();
  }

  @override
  Future<List<Plant>> call() async {
    if (shouldThrowError) {
      throw Exception('Test error');
    }
    return List.from(_plants);
  }
}
