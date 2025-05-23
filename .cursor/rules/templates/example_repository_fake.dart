import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/repositories/example_repository.dart';

class ExampleRepositoryFake implements ExampleRepository {
  // In-memory storage
  final List<Example> _examples = [];

  // For controlling test scenarios
  bool simulateError = false;
  Exception errorToThrow = Exception('Fake repository error');

  @override
  Future<List<Example>> getExamples() async {
    if (simulateError) {
      throw errorToThrow;
    }
    return _examples;
  }

  @override
  Future<Example> createExample(Example example) async {
    if (simulateError) {
      throw errorToThrow;
    }

    // Generate a fake ID if none exists
    final id = example.id.isEmpty ? '${_examples.length + 1}' : example.id;

    // Create a new domain model with the ID
    final createdExample = Example(
      id: id,
      name: example.name,
      // Include other fields as needed
    );

    _examples.add(createdExample);
    return createdExample;
  }

  @override
  Future<Example> updateExample(Example example) async {
    if (simulateError) {
      throw errorToThrow;
    }

    final index = _examples.indexWhere((e) => e.id == example.id);
    if (index == -1) {
      throw Exception('Example not found with id: ${example.id}');
    }

    _examples[index] = example;
    return example;
  }

  @override
  Future<void> deleteExample(String id) async {
    if (simulateError) {
      throw errorToThrow;
    }

    final index = _examples.indexWhere((e) => e.id == id);
    if (index == -1) {
      throw Exception('Example not found with id: $id');
    }

    _examples.removeAt(index);
  }

  // Helper methods for testing
  void addFakeExamples(List<Example> examples) {
    _examples.addAll(examples);
  }

  void clear() {
    _examples.clear();
  }
}
