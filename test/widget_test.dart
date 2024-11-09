import 'package:flutter_test/flutter_test.dart';

import 'package:onboarding_pro_multi/main.dart';
import 'package:onboarding_pro_multi/widgets/illustration_part.dart';

void main() {
  testWidgets('Completes onboarding using buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Dalej'), findsOneWidget);
    expect(find.text('Spędzaj czas\nkreatywnie!'), findsOneWidget);

    final button = find.text('Dalej');

    await tester.tap(button);
    await tester.pump();

    expect(find.text('Spędzaj czas\nkreatywnie!'), findsNothing);
    expect(find.text('Bierz udział\nw wydarzeniach!'), findsOneWidget);

    await tester.tap(button);
    await tester.pump();

    expect(find.text('Bierz udział\nw wydarzeniach!'), findsNothing);
    expect(find.text('Poznawaj\nnieodkryte szlaki!'), findsOneWidget);

    await tester.tap(button);
    await tester.pump();

    expect(find.text('Poznawaj\nnieodkryte szlaki!'), findsNothing);
    expect(find.text('Ustawiaj\nprzypomnienia!'), findsOneWidget);

    await tester.tap(button);
    await tester.pump();

    expect(find.text('Ustawiaj\nprzypomnienia!'), findsNothing);
    expect(find.text('Bądź na bieżąco!'), findsOneWidget);

    await tester.tap(button);
    await tester.pump();

    expect(find.text('Bądź na bieżąco!'), findsNothing);
    expect(find.text('Dalej'), findsNothing);
    expect(find.text('Złap swój rytm!'), findsOneWidget);
    expect(find.text('Zaczynamy!'), findsOneWidget);

    await tester.tap(find.text('Zaczynamy!'));
    await tester.pumpAndSettle();

    expect(find.text('Nazwa Apki'), findsOneWidget);
  });

  testWidgets(
    'Goes directly to HomePage after clicking button "Pomiń"',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Dalej'), findsOneWidget);
      expect(find.text('Pomiń'), findsOneWidget);

      await tester.tap(find.text('Pomiń'));
      await tester.pumpAndSettle();

      expect(find.text('Nazwa Apki'), findsOneWidget);
    },
  );

  testWidgets(
    'Goes through onboarding using swipe gesture',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Dalej'), findsOneWidget);
      expect(find.text('Pomiń'), findsOneWidget);
      expect(find.text('Spędzaj czas\nkreatywnie!'), findsOneWidget);

      final draggable = find.byType(IllustrationPart);
      const dragOffset = Offset(-200, 0);

      await tester.drag(draggable, dragOffset);
      await tester.pumpAndSettle();

      expect(find.text('Spędzaj czas\nkreatywnie!'), findsNothing);
      expect(find.text('Bierz udział\nw wydarzeniach!'), findsOneWidget);

      await tester.drag(draggable, dragOffset);
      await tester.pumpAndSettle();

      expect(find.text('Bierz udział\nw wydarzeniach!'), findsNothing);
      expect(find.text('Poznawaj\nnieodkryte szlaki!'), findsOneWidget);

      await tester.drag(draggable, dragOffset);
      await tester.pumpAndSettle();

      expect(find.text('Poznawaj\nnieodkryte szlaki!'), findsNothing);
      expect(find.text('Ustawiaj\nprzypomnienia!'), findsOneWidget);

      await tester.drag(draggable, dragOffset);
      await tester.pumpAndSettle();

      expect(find.text('Ustawiaj\nprzypomnienia!'), findsNothing);
      expect(find.text('Bądź na bieżąco!'), findsOneWidget);

      await tester.drag(draggable, dragOffset);
      await tester.pumpAndSettle();

      expect(find.text('Bądź na bieżąco!'), findsNothing);
      expect(find.text('Dalej'), findsNothing);
      expect(find.text('Złap swój rytm!'), findsOneWidget);
      expect(find.text('Zaczynamy!'), findsOneWidget);
    },
  );
}
