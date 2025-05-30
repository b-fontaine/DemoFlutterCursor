import 'package:demo_flutter_cursor/modules/example/data/api/example_api.dart';
import 'package:demo_flutter_cursor/modules/example/data/repositories/example_repository.dart';
import 'package:demo_flutter_cursor/modules/example/data/storage/example_dao.dart';
import 'package:demo_flutter_cursor/modules/example/domain/repositories/exemple_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exampleRepositoryProvider = Provider<ExampleRepository>((ref) {
  return ExampleRepositoryImpl(
    api: ref.read(exampleApiProvider),
    dao: ref.read(exampleDaoProvider),
  );
});
