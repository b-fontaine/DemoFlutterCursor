import 'package:demo_flutter_cursor/modules/plants/data/api/dto/plant_dto.dart';

abstract class PlantApi {
  Future<List<PlantDto>> getAll();
  Future<PlantDto?> get(String id);
  Future<PlantDto> add(PlantDto plant);
  Future<PlantDto> update(PlantDto plant);
  Future<void> delete(String id);
}

class PlantApiImpl implements PlantApi {
  @override
  Future<List<PlantDto>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [];
  }

  @override
  Future<PlantDto?> get(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return null;
  }

  @override
  Future<PlantDto> add(PlantDto plant) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return plant;
  }

  @override
  Future<PlantDto> update(PlantDto plant) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return plant;
  }

  @override
  Future<void> delete(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
