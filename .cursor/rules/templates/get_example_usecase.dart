import 'package:flutter_ddd_template/domain/example/example.dart';
import 'package:flutter_ddd_template/domain/example/example_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getExampleUsecaseProvider = Provider<GetExampleUsecase>((ref) {
  return GetExampleUsecase(
    exampleRepository: ref.read(exampleRepositoryProvider),
  );
});

class GetExampleUsecase {
  final ExampleRepository _exampleRepository;

  GetExampleUsecase({required ExampleRepository exampleRepository})
    : _exampleRepository = exampleRepository;

  Future<Example> call() async {
    return _exampleRepository.getExample();
  }
}
