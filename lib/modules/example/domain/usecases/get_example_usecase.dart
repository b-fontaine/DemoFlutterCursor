import 'package:demo_flutter_cursor/modules/example/domain/di/repository_providers.dart';
import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/repositories/exemple_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getExampleUseCaseProvider = Provider<GetExampleUseCase>((ref) {
  return GetExampleUseCase(
    exampleRepository: ref.read(exampleRepositoryProvider),
  );
});

class GetExampleUseCase {
  final ExampleRepository _exampleRepository;

  GetExampleUseCase({required ExampleRepository exampleRepository})
    : _exampleRepository = exampleRepository;

  Future<Example?> call(String id) async {
    return await _exampleRepository.get(id);
  }
}
