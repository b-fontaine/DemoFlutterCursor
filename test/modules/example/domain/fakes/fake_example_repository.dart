import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/repositories/exemple_repository.dart';

class FakeExampleRepository implements ExampleRepository {
  final Map<String, Example> _examples = {};

  void addExample(Example example) {
    _examples[example.id] = example;
  }

  void clear() {
    _examples.clear();
  }

  @override
  Future<Example?> get(String id) async {
    return _examples[id];
  }
}
