// TDD Test Template for Widget Layer
// Created BEFORE implementation as part of RED phase

import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/ui/pages/example_list_page.dart';
import 'package:demo_flutter_cursor/modules/example/ui/state/example_list_state.dart';
import 'package:demo_flutter_cursor/modules/example/ui/state/example_list_state_notifier.dart';
import 'package:demo_flutter_cursor/modules/example/ui/widgets/example_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Import test helpers
import '../../../test_utils.dart';
import '../state/example_list_state_notifier_fake.dart';

void main() {
  late ExampleListStateNotifierFake fakeStateNotifier;
  late ExampleListState initialState;

  setUp(() {
    fakeStateNotifier = ExampleListStateNotifierFake();

    initialState = ExampleListState(
      examples: [],
      isLoading: false,
      errorMessage: null,
    );

    fakeStateNotifier.state = initialState;
  });

  Widget buildTestableWidget(Widget widget) {
    return pumpPage(
      overrides: [
        exampleListStateNotifierProvider.overrideWith((_) => fakeStateNotifier),
      ],
      child: widget,
    );
  }

  group('ExampleListPage', () {
    // Test: Empty state - should display empty state message when no examples exist
    testWidgets('with empty examples list, displays empty state message', (
      tester,
    ) async {
      // Given
      fakeStateNotifier.state = ExampleListState(
        examples: [],
        isLoading: false,
        errorMessage: null,
      );

      // When
      await tester.pumpWidget(buildTestableWidget(const ExampleListPage()));

      // Then
      expect(find.text(t.examples.list.empty_state), findsOneWidget);
      expect(find.byType(ExampleItem), findsNothing);
    });

    // Test: Loading state - should display progress indicator when loading
    testWidgets('when loading, displays progress indicator', (tester) async {
      // Given
      fakeStateNotifier.state = ExampleListState(
        examples: [],
        isLoading: true,
        errorMessage: null,
      );

      // When
      await tester.pumpWidget(buildTestableWidget(const ExampleListPage()));

      // Then
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ExampleItem), findsNothing);
    });

    // Test: Error state - should display error message when error occurs
    testWidgets('with error, displays error message', (tester) async {
      // Given
      fakeStateNotifier.state = ExampleListState(
        examples: [],
        isLoading: false,
        errorMessage: 'An error occurred',
      );

      // When
      await tester.pumpWidget(buildTestableWidget(const ExampleListPage()));

      // Then
      expect(find.text(t.examples.list.error_state), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget); // Retry button
    });

    // Test: List content - should display list of examples when available
    testWidgets('with examples, displays list of examples', (tester) async {
      // Given
      final examples = [
        Example(id: '1', name: 'Example 1'),
        Example(id: '2', name: 'Example 2'),
      ];

      fakeStateNotifier.state = ExampleListState(
        examples: examples,
        isLoading: false,
        errorMessage: null,
      );

      // When
      await tester.pumpWidget(buildTestableWidget(const ExampleListPage()));

      // Then
      expect(find.byType(ExampleItem), findsNWidgets(2));
      expect(find.text('Example 1'), findsOneWidget);
      expect(find.text('Example 2'), findsOneWidget);
    });

    // Test: Add example - should call createExample when add button is pressed
    testWidgets('when adding example, calls state notifier', (tester) async {
      // Given
      fakeStateNotifier.state = ExampleListState(
        examples: [],
        isLoading: false,
        errorMessage: null,
      );

      // When
      await tester.pumpWidget(buildTestableWidget(const ExampleListPage()));

      // Enter text in text field
      await tester.enterText(find.byType(TextField), 'New Example');
      await tester.pump();

      // Tap add button
      await tester.tap(find.text(t.examples.list.add_button));
      await tester.pump();

      // Then
      expect(fakeStateNotifier.createExampleCallCount, 1);
      expect(fakeStateNotifier.createdExampleNames, contains('New Example'));
    });

    // Test: Load initial data - should call getExamples when page is loaded
    testWidgets('on init, calls getExamples', (tester) async {
      // Given

      // When
      await tester.pumpWidget(buildTestableWidget(const ExampleListPage()));

      // Then
      expect(fakeStateNotifier.getExamplesCallCount, 1);
    });
  });
}
