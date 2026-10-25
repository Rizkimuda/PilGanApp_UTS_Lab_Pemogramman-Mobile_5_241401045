import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/option_card.dart';
import '../widgets/quiz_progress_bar.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  void _finishQuiz(BuildContext context, QuizProvider quiz) {
    quiz.submitQuiz();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final currentQ = quiz.currentQuestion;

    if (currentQ == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Tidak ada pertanyaan yang tersedia.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      );
    }

    final horizontalPadding = mediaQuery.size.width > 600 ? 32.0 : 18.0;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person_rounded, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                quiz.userName.isEmpty ? 'Peserta' : quiz.userName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: themeProvider.isDarkMode ? 'Mode Terang' : 'Mode Gelap',
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                // Progress Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 10.0,
                  ),
                  child: QuizProgressBar(
                    currentIndex: quiz.currentQuestionIndex,
                    total: quiz.totalQuestions,
                    category: currentQ.category,
                  ),
                ),

                // Question and Options
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Question Card
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: isDark
                                  ? const Color(0xFF334155)
                                  : const Color(0xFFE2E8F0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: isDark ? 0.25 : 0.05,
                                ),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Pertanyaan ${quiz.currentQuestionIndex + 1}',
                                  style: const TextStyle(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                currentQ.question,
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  height: 1.4,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Options
                        ...List.generate(currentQ.options.length, (optIndex) {
                          final optionText = currentQ.options[optIndex];
                          final isSelected =
                              quiz.selectedOptionForCurrentQuestion == optIndex;

                          return OptionCard(
                            index: optIndex,
                            text: optionText,
                            isSelected: isSelected,
                            onTap: () {
                              quiz.selectOption(currentQ.id, optIndex);
                            },
                          );
                        }),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),

                // Bottom Navigation Bar
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    border: Border(
                      top: BorderSide(
                        color: isDark
                            ? const Color(0xFF334155)
                            : const Color(0xFFE2E8F0),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (quiz.hasPreviousQuestion)
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            text: 'Sebelumnya',
                            variant: ButtonVariant.secondary,
                            icon: Icons.chevron_left_rounded,
                            onPressed: () {
                              quiz.previousQuestion();
                            },
                          ),
                        )
                      else
                        const SizedBox.shrink(),

                      if (quiz.hasPreviousQuestion) const SizedBox(width: 12),

                      Expanded(
                        flex: 1,
                        child: quiz.hasNextQuestion
                            ? CustomButton(
                                text: 'Selanjutnya',
                                variant: ButtonVariant.primary,
                                icon: Icons.chevron_right_rounded,
                                onPressed: () {
                                  quiz.nextQuestion();
                                },
                              )
                            : CustomButton(
                                text: 'Selesai',
                                variant: ButtonVariant.success,
                                icon: Icons.check_circle_rounded,
                                onPressed: () => _finishQuiz(context, quiz),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
