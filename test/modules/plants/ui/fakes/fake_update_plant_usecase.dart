import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/update_plant_usecase.dart';

class FakeUpdatePlantUseCase implements UpdatePlantUseCase {
  bool shouldThrowError = false;

  @override
  Future<Plant> call(Plant plant) async {
    if (shouldThrowError) {
      throw Exception('Test error');
    }
    
    return plant.copyWith(lastUpdateDate: DateTime.now());
  }
}
