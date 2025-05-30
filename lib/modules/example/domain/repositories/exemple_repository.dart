import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';

abstract class ExampleRepository {
  Future<Example?> get(String id);
}
