import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/ui/providers/example_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

// Import du fake
import '../fakes/fake_get_example_usecase.dart';

void main() {
  late FakeGetExampleUseCase mockGetExampleUseCase;
  late ExampleStateNotifier notifier;

  setUp(() {
    mockGetExampleUseCase = FakeGetExampleUseCase();
    notifier = ExampleStateNotifier(getExampleUseCase: mockGetExampleUseCase);
  });

  group('ExampleStateNotifier', () {
    const String testId = 'test-id';
    final DateTime now = DateTime.now();
    final Example testExample = Example(
      id: testId,
      name: 'Test Example',
      description: 'Test Description',
      creationDate: now.subtract(const Duration(days: 1)),
      lastUpdateDate: now,
    );

    test('initial state should have null example', () {
      // Assert
      expect(notifier.state.example, isNull);
    });

    group('init', () {
      test('should load state with example when successful', () async {
        // Arrange
        mockGetExampleUseCase.addExample(testExample);

        // Act
        await notifier.init(testId);

        // Assert
        expect(notifier.state.example, equals(testExample));
        expect(mockGetExampleUseCase.wasCalled(testId), isTrue);
        expect(mockGetExampleUseCase.timesCalled(testId), equals(1));
      });

      test('should keep example as null when loading fails', () async {
        // Arrange
        mockGetExampleUseCase.exceptionToThrow = Exception('Failed to load');

        // Act
        await notifier.init(testId);

        // Assert
        expect(notifier.state.example, isNull);
        expect(mockGetExampleUseCase.wasCalled(testId), isTrue);
      });
    });

    group('refresh', () {
      test('should do nothing when example is null', () async {
        // Act
        await notifier.refresh();

        // Assert
        expect(notifier.state.example, isNull);
        expect(mockGetExampleUseCase.calledIds.isEmpty, isTrue);
      });

      test('should reload state when example exists', () async {
        // Arrange
        mockGetExampleUseCase.addExample(testExample);
        await notifier.init(testId);
        mockGetExampleUseCase.reset();

        // Act
        await notifier.refresh();

        // Assert
        expect(mockGetExampleUseCase.wasCalled(testId), isTrue);
      });
    });

    group('updateExample', () {
      test('should do nothing when example is null', () async {
        // Act
        await notifier.updateExample('New Name', 'New Description');

        // Assert
        expect(notifier.state.example, isNull);
      });

      test('should update example with new values', () async {
        // Arrange
        mockGetExampleUseCase.addExample(testExample);
        await notifier.init(testId);

        // Act
        await notifier.updateExample('Updated Name', 'Updated Description');

        // Assert
        final updatedExample = notifier.state.example;
        expect(updatedExample, isNotNull);
        expect(updatedExample!.id, equals(testId));
        expect(updatedExample.name, equals('Updated Name'));
        expect(updatedExample.description, equals('Updated Description'));
        expect(updatedExample.creationDate, equals(testExample.creationDate));
        expect(
          updatedExample.lastUpdateDate,
          isNot(equals(testExample.lastUpdateDate)),
        );
      });
    });

    group('onAction', () {
      test('should call refresh', () async {
        // Arrange
        mockGetExampleUseCase.addExample(testExample);
        await notifier.init(testId);
        mockGetExampleUseCase.reset();

        // Act
        await notifier.onAction();

        // Assert
        expect(mockGetExampleUseCase.wasCalled(testId), isTrue);
      });
    });
  });
}
