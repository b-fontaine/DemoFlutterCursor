import 'package:demo_flutter_cursor/modules/plants/data/repositories/plant_repository.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plantRepositoryProvider = Provider<PlantRepository>((ref) {
  return PlantRepositoryImpl(
    api: ref.read(plantApiProvider),
    dao: ref.read(plantDaoProvider),
  );
});
