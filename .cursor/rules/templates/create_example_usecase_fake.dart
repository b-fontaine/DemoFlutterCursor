import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/usecases/create_example_usecase.dart';

class CreateExampleUseCaseFake implements CreateExampleUseCase {
  // For controlling test scenarios
  bool simulateError = false;
  Exception errorToThrow = Exception('Fake create example use case error');
  Example? exampleToReturn;

  // Track method calls for verification
  int callCount = 0;
  List<String> capturedNames = [];

  @override
  Future<Example> call(String name) async {
    callCount++;
    capturedNames.add(name);

    if (simulateError) {
      throw errorToThrow;
    }

    // Return predefined example or create one with an ID based on call count
    return exampleToReturn ?? Example(id: callCount.toString(), name: name);
  }
}
