import 'exemple_api.dart';
import 'exemple_entity.dart';

class ExampleApiFake implements ExampleApi {
  ExampleEntity? currentFake;

  @override
  Future<ExampleEntity?> get(String userId) {
    return Future(() => currentFake);
  }
}
