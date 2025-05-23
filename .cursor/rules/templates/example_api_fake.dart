import 'package:demo_flutter_cursor/modules/example/data/api/dto/example_dto.dart';
import 'package:demo_flutter_cursor/modules/example/data/api/example_api.dart';

class ExampleApiFake implements ExampleApi {
  // In-memory storage
  final List<ExampleDTO> _examples = [];

  // For controlling test scenarios
  bool simulateError = false;
  Exception errorToThrow = Exception('Fake API error');

  @override
  Future<List<ExampleDTO>> getExamples() async {
    if (simulateError) {
      throw errorToThrow;
    }
    return _examples;
  }

  @override
  Future<ExampleDTO> createExample(ExampleDTO example) async {
    if (simulateError) {
      throw errorToThrow;
    }

    // Generate a fake ID if none exists
    final id = example.id.isEmpty ? '${_examples.length + 1}' : example.id;

    // Create a new DTO with the ID
    final createdExample = ExampleDTO(
      id: id,
      name: example.name,
      // Include other fields as needed
    );

    _examples.add(createdExample);
    return createdExample;
  }

  @override
  Future<ExampleDTO> updateExample(String id, ExampleDTO example) async {
    if (simulateError) {
      throw errorToThrow;
    }

    final index = _examples.indexWhere((e) => e.id == id);
    if (index == -1) {
      throw Exception('Example not found with id: $id');
    }

    final updatedExample = ExampleDTO(
      id: id,
      name: example.name,
      // Include other fields as needed
    );

    _examples[index] = updatedExample;
    return updatedExample;
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
  void addFakeExamples(List<ExampleDTO> examples) {
    _examples.addAll(examples);
  }

  void clear() {
    _examples.clear();
  }
}
