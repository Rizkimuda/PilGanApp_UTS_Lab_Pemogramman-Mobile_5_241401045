import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:pilgan_app/main.dart';
import 'package:pilgan_app/providers/quiz_provider.dart';
import 'package:pilgan_app/providers/theme_provider.dart';

void main() {
  testWidgets('Quiz app smoke test loads welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => QuizProvider()),
        ],
        child: const QuizApp(),
      ),
    );

    expect(find.text('PilGan'), findsOneWidget);
    expect(find.text('Mulai Kuis'), findsOneWidget);
  });
}
