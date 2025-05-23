import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/usecases/get_examples_usecase.dart';

class GetExamplesUseCaseFake implements GetExamplesUseCase {
  // In-memory storage
  final List<Example> _examples = [];

  // For controlling test scenarios
  bool simulateError = false;
  Exception errorToThrow = Exception('Fake use case error');

  @override
  Future<List<Example>> call({bool? onlyActive}) async {
    if (simulateError) {
      throw errorToThrow;
    }

    if (onlyActive != null && onlyActive) {
      return _examples.where((example) => example.isActive == true).toList();
    }

    return _examples;
  }

  // Helper methods for testing
  void addFakeExamples(List<Example> examples) {
    _examples.addAll(examples);
  }

  void clear() {
    _examples.clear();
  }
}
