import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/usecases/get_example_usecase.dart';

/// Mock implementation of GetExampleUseCase for testing purposes
class FakeGetExampleUseCase implements GetExampleUseCase {
  final Map<String, Example> examples = {};
  final Set<String> calledIds = {};
  Exception? exceptionToThrow;

  @override
  Future<Example> call(String id) async {
    calledIds.add(id);
    if (exceptionToThrow != null) {
      throw exceptionToThrow!;
    }
    return examples[id]!;
  }

  void addExample(Example example) {
    examples[example.id] = example;
  }

  void reset() {
    calledIds.clear();
    exceptionToThrow = null;
  }

  bool wasCalled(String id) {
    return calledIds.contains(id);
  }

  int timesCalled(String id) {
    return calledIds.where((calledId) => calledId == id).length;
  }
}
