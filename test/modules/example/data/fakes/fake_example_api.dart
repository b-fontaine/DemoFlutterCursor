import 'package:demo_flutter_cursor/modules/example/data/api/dto/example_dto.dart';
import 'package:demo_flutter_cursor/modules/example/data/api/example_api.dart';

class FakeExampleApi implements ExampleApi {
  final Map<String, ExampleDTO> _data = {};

  void addExample(String id, ExampleDTO dto) {
    _data[id] = dto;
  }

  @override
  Future<ExampleDTO?> get(String id) async {
    return _data[id];
  }
}
