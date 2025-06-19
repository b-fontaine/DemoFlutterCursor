import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';

class FakeAddPlantUseCase implements AddPlantUseCase {
  bool shouldThrowError = false;

  @override
  Future<Plant> call({
    required String name,
    required String type,
    String? description,
  }) async {
    if (shouldThrowError) {
      throw Exception('Test error');
    }
    
    return Plant(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      type: type,
      description: description,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
    );
  }
}
