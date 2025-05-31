import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/usecases/get_example_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_example_repository.dart';

void main() {
  late GetExampleUseCase getExampleUseCase;
  late FakeExampleRepository fakeExampleRepository;

  setUp(() {
    fakeExampleRepository = FakeExampleRepository();
    getExampleUseCase = GetExampleUseCase(
      exampleRepository: fakeExampleRepository,
    );
  });

  group('GetExampleUseCase', () {
    test(
      'should return Example when repository has the example with given id',
      () async {
        // Arrange
        const example = Example(id: '1', name: 'Test Example');
        fakeExampleRepository.addExample(example);

        // Act
        final result = await getExampleUseCase('1');

        // Assert
        expect(result, example);
      },
    );

    test(
      'should return null when repository does not have the example with given id',
      () async {
        // Arrange
        fakeExampleRepository.clear();

        // Act
        final result = await getExampleUseCase('non_existent_id');

        // Assert
        expect(result, null);
      },
    );
  });
}
