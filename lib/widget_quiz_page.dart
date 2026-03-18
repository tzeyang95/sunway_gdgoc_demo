// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

// ==========================================
// Widget Quiz Page
// ==========================================
class WidgetQuizPage extends StatefulWidget {
  const WidgetQuizPage({super.key});

  @override
  State<WidgetQuizPage> createState() => _WidgetQuizPageState();
}

class _WidgetQuizPageState extends State<WidgetQuizPage> {
  int _revealedCount = 0;
  int _correctGuesses = 0;
  final int _totalQuestions = 10;

  void _onRevealed({required bool guessedCorrectly}) {
    setState(() {
      _revealedCount++;
      if (guessedCorrectly) _correctGuesses++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _revealedCount = 0;
      _correctGuesses = 0;
      // Force rebuild of all quiz cards by changing the key
      _quizKey = UniqueKey();
    });
  }

  Key _quizKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final allRevealed = _revealedCount >= _totalQuestions;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          'Widget Quiz 🧩',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          if (_revealedCount > 0)
            TextButton.icon(
              onPressed: _resetQuiz,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Reset'),
            ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Color(0xFFE5E7EB)),
        ),
      ),
      body: ListView(
        key: _quizKey,
        padding: const EdgeInsets.all(16),
        children: [
          // ── Score Banner ──
          _ScoreBanner(
            revealed: _revealedCount,
            correct: _correctGuesses,
            total: _totalQuestions,
          ),
          const SizedBox(height: 16),

          // ── Instructions ──
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFBEDBFF)),
            ),
            child: const Row(
              children: [
                Icon(Icons.school, size: 20, color: Color(0xFF155DFC)),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Look at each widget carefully. Decide if it should be Stateless or Stateful, then tap to reveal the answer!',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF364153),
                      height: 18 / 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Q1: Static Greeting Banner ──
          _QuizCard(
            questionNumber: 1,
            title: 'Greeting Banner',
            answer: WidgetType.stateless,
            explanation:
                'This widget only displays a fixed greeting message. It takes in data via the constructor and never changes — a textbook StatelessWidget.',
            caveat: null,
            onRevealed: _onRevealed,
            child: const _GreetingBanner(),
          ),
          const SizedBox(height: 16),

          // ── Q2: Like Button ──
          _QuizCard(
            questionNumber: 2,
            title: 'Like Button',
            answer: WidgetType.stateful,
            explanation:
                'The heart icon toggles between filled and outlined, and the like count changes. This requires setState() to update the UI — StatefulWidget.',
            caveat: null,
            onRevealed: _onRevealed,
            child: const _LikeButton(),
          ),
          const SizedBox(height: 16),

          // ── Q3: Temperature Display ──
          _QuizCard(
            questionNumber: 3,
            title: 'Temperature Display',
            answer: WidgetType.either,
            explanation:
                'It depends! If the temperature is passed in from a parent and never changes internally, it\'s Stateless. But if it fetches live data or updates on its own, it needs to be Stateful.',
            caveat:
                '🤔 This is a trick question. The answer depends on WHERE the data comes from. In this example, the value is hardcoded — so Stateless is fine. But in a real weather app, you\'d need Stateful (or a state management solution).',
            onRevealed: _onRevealed,
            child: const _TemperatureDisplay(),
          ),
          const SizedBox(height: 16),

          // ── Q4: Expandable FAQ ──
          _QuizCard(
            questionNumber: 4,
            title: 'Expandable FAQ Item',
            answer: WidgetType.stateful,
            explanation:
                'The card expands/collapses when tapped, toggling _isExpanded. This internal state change requires setState() — StatefulWidget.',
            caveat: null,
            onRevealed: _onRevealed,
            child: const _ExpandableFaq(),
          ),
          const SizedBox(height: 16),

          // ── Q5: Divider with Label ──
          _QuizCard(
            questionNumber: 5,
            title: 'Labeled Divider',
            answer: WidgetType.stateless,
            explanation:
                'This is purely decorative — a horizontal line with a label in the middle. No interaction, no changing data. Perfect StatelessWidget.',
            caveat: null,
            onRevealed: _onRevealed,
            child: const _LabeledDivider(label: 'OR'),
          ),
          const SizedBox(height: 16),

          // ── Q6: Countdown Timer ──
          _QuizCard(
            questionNumber: 6,
            title: 'Countdown Timer',
            answer: WidgetType.stateful,
            explanation:
                'The timer ticks down every second using Timer.periodic and calls setState() to update the display. It also needs dispose() to cancel the timer — StatefulWidget.',
            caveat:
                '⚡ Any widget that uses Timer, AnimationController, or StreamSubscription typically needs to be Stateful so it can clean up resources in dispose().',
            onRevealed: _onRevealed,
            child: const _CountdownTimer(),
          ),
          const SizedBox(height: 16),

          // ── Q7: Avatar with Status Dot ──
          _QuizCard(
            questionNumber: 7,
            title: 'Avatar with Online Status',
            answer: WidgetType.either,
            explanation:
                'If the online status is passed in as a parameter and managed by a parent — Stateless. If the widget itself polls a server or listens to a stream to update the dot — Stateful.',
            caveat:
                '🤔 In real apps, the "online" status often comes from a stream/provider. The avatar widget itself can remain Stateless if a parent manages the state. This is a common architecture pattern!',
            onRevealed: _onRevealed,
            child: const _AvatarWithStatus(isOnline: true, name: 'Sarah'),
          ),
          const SizedBox(height: 16),

          // ── Q8: Password Field with Visibility Toggle ──
          _QuizCard(
            questionNumber: 8,
            title: 'Password Field',
            answer: WidgetType.stateful,
            explanation:
                'The "show/hide password" eye icon toggles _obscureText. The TextField also holds its own internal state via TextEditingController — StatefulWidget.',
            caveat:
                '📝 Even though Flutter\'s TextField is already stateful internally, the visibility toggle is YOUR state that YOU manage. So the wrapper widget must also be Stateful.',
            onRevealed: _onRevealed,
            child: const _PasswordField(),
          ),
          const SizedBox(height: 16),

          // ── Q9: Product Price Tag ──
          _QuizCard(
            questionNumber: 9,
            title: 'Product Price Tag',
            answer: WidgetType.stateless,
            explanation:
                'It just shows a product name, price, and a discount badge. All values are passed in and never change — StatelessWidget.',
            caveat:
                '💡 Even though it looks "complex" with multiple styled elements, complexity ≠ statefulness. If data doesn\'t change, it\'s still Stateless!',
            onRevealed: _onRevealed,
            child: const _ProductPriceTag(),
          ),
          const SizedBox(height: 16),

          // ── Q10: Form Validator ──
          _QuizCard(
            questionNumber: 10,
            title: 'Email Validator Field',
            answer: WidgetType.stateful,
            explanation:
                'The field shows real-time validation feedback (valid/invalid icon, error text) as the user types. This requires listening to input changes with setState() — StatefulWidget.',
            caveat:
                '✅ Real-time validation is a classic use case for StatefulWidget. The error message changes on every keystroke, which means constant rebuilds.',
            onRevealed: _onRevealed,
            child: const _EmailValidatorField(),
          ),
          const SizedBox(height: 24),

          // ── Results ──
          if (allRevealed) ...[
            _ResultsCard(
              correct: _correctGuesses,
              total: _totalQuestions,
              onReset: _resetQuiz,
            ),
            const SizedBox(height: 32),
          ],
        ],
      ),
    );
  }
}

// ==========================================
// Enums & Models
// ==========================================
enum WidgetType { stateless, stateful, either }

extension WidgetTypeLabel on WidgetType {
  String get label {
    switch (this) {
      case WidgetType.stateless:
        return 'STATELESS';
      case WidgetType.stateful:
        return 'STATEFUL';
      case WidgetType.either:
        return 'EITHER (depends on context)';
    }
  }

  Color get color {
    switch (this) {
      case WidgetType.stateless:
        return const Color(0xFF155DFC);
      case WidgetType.stateful:
        return const Color(0xFF00C950);
      case WidgetType.either:
        return const Color(0xFFE88C0C);
    }
  }

  IconData get icon {
    switch (this) {
      case WidgetType.stateless:
        return Icons.lock_outline;
      case WidgetType.stateful:
        return Icons.sync;
      case WidgetType.either:
        return Icons.help_outline;
    }
  }
}

// ==========================================
// Score Banner
// ==========================================
class _ScoreBanner extends StatelessWidget {
  final int revealed;
  final int correct;
  final int total;

  const _ScoreBanner({
    required this.revealed,
    required this.correct,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          const Icon(Icons.quiz_outlined, color: Color(0xFF155DFC), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progress: $revealed / $total revealed',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF101828),
                  ),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: revealed / total,
                    minHeight: 6,
                    backgroundColor: const Color(0xFFE5E7EB),
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF155DFC)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00C950).withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$correct ✓',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF00C950),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Quiz Card (wrapper with reveal mechanic)
// ==========================================
class _QuizCard extends StatefulWidget {
  final int questionNumber;
  final String title;
  final WidgetType answer;
  final String explanation;
  final String? caveat;
  final Widget child;
  final void Function({required bool guessedCorrectly}) onRevealed;

  const _QuizCard({
    required this.questionNumber,
    required this.title,
    required this.answer,
    required this.explanation,
    this.caveat,
    required this.onRevealed,
    required this.child,
  });

  @override
  State<_QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<_QuizCard>
    with SingleTickerProviderStateMixin {
  bool _revealed = false;
  WidgetType? _guess;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _makeGuess(WidgetType guess) {
    if (_revealed) return;
    setState(() {
      _guess = guess;
    });
  }

  void _reveal() {
    if (_revealed || _guess == null) return;

    final isCorrect = _guess == widget.answer ||
        (widget.answer == WidgetType.either); // "either" accepts both guesses

    setState(() {
      _revealed = true;
    });
    _animController.forward();
    widget.onRevealed(guessedCorrectly: isCorrect);
  }

  @override
  Widget build(BuildContext context) {
    final isCorrect = _guess == widget.answer ||
        (widget.answer == WidgetType.either && _guess != null);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _revealed
              ? (isCorrect
                  ? const Color(0xFF00C950)
                  : const Color(0xFFD4183D))
              : const Color(0xFFE5E7EB),
          width: _revealed ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFFF9FAFB),
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFF155DFC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.questionNumber}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF155DFC),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF101828),
                    ),
                  ),
                ),
                if (_revealed)
                  Icon(
                    widget.answer.icon,
                    color: widget.answer.color,
                    size: 20,
                  )
                else
                  const Icon(Icons.visibility_off, color: Color(0xFFCBD5E1), size: 20),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFE5E7EB)),

          // ── Widget Preview ──
          Padding(
            padding: const EdgeInsets.all(16),
            child: widget.child,
          ),

          // ── Guess Buttons ──
          if (!_revealed) ...[
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What type of widget is this?',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4A5565),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _guessChip(WidgetType.stateless),
                      const SizedBox(width: 8),
                      _guessChip(WidgetType.stateful),
                      const SizedBox(width: 8),
                      _guessChip(WidgetType.either),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _guess != null ? _reveal : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF155DFC),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: const Color(0xFFE5E7EB),
                        disabledForegroundColor: const Color(0xFF9CA3AF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Reveal Answer'),
                    ),
                  ),
                ],
              ),
            ),
          ],

          // ── Answer Reveal ──
          if (_revealed)
            FadeTransition(
              opacity: _fadeAnim,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isCorrect
                      ? const Color(0xFF00C950).withOpacity(0.06)
                      : const Color(0xFFD4183D).withOpacity(0.06),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(13)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Result row
                    Row(
                      children: [
                        Icon(
                          isCorrect ? Icons.check_circle : Icons.cancel,
                          color: isCorrect
                              ? const Color(0xFF00C950)
                              : const Color(0xFFD4183D),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isCorrect ? 'Correct!' : 'Not quite!',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: isCorrect
                                ? const Color(0xFF00C950)
                                : const Color(0xFFD4183D),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: widget.answer.color.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            widget.answer.label,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: widget.answer.color,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.explanation,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF364153),
                        height: 19 / 13,
                      ),
                    ),
                    if (widget.caveat != null) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFBEB),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFFDE68A)),
                        ),
                        child: Text(
                          widget.caveat!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF92400E),
                            height: 17 / 12,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _guessChip(WidgetType type) {
    final isSelected = _guess == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => _makeGuess(type),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? type.color.withOpacity(0.12) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? type.color : const Color(0xFFE5E7EB),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Icon(type.icon, size: 18, color: isSelected ? type.color : const Color(0xFF9CA3AF)),
              const SizedBox(height: 4),
              Text(
                type == WidgetType.either ? 'Either' : type.label[0] + type.label.substring(1).toLowerCase(),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? type.color : const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// Results Card
// ==========================================
class _ResultsCard extends StatelessWidget {
  final int correct;
  final int total;
  final VoidCallback onReset;

  const _ResultsCard({
    required this.correct,
    required this.total,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (correct / total * 100).round();
    final emoji = percentage >= 80
        ? '🎉'
        : percentage >= 50
            ? '👍'
            : '📚';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF155DFC), Color(0xFF3B82F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF155DFC).withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 12),
          Text(
            '$correct / $total Correct',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            percentage >= 80
                ? 'Excellent! You really understand widget types!'
                : percentage >= 50
                    ? 'Good effort! Review the explanations above.'
                    : 'Keep learning! Check the State Demo page for more.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 20 / 14,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onReset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF155DFC),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Try Again',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Q1: Greeting Banner (Stateless)
// ==========================================
class _GreetingBanner extends StatelessWidget {
  const _GreetingBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF155DFC), Color(0xFF7C3AED)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.waving_hand, color: Colors.amber, size: 32),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello, Developer!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Welcome to GDGoC Sunway',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Q2: Like Button (Stateful)
// ==========================================
class _LikeButton extends StatefulWidget {
  const _LikeButton();

  @override
  State<_LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<_LikeButton> {
  bool _isLiked = false;
  int _likeCount = 42;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isLiked = !_isLiked;
              _likeCount += _isLiked ? 1 : -1;
            });
          },
          child: AnimatedScale(
            scale: _isLiked ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? const Color(0xFFD4183D) : const Color(0xFF9CA3AF),
              size: 36,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '$_likeCount likes',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF101828),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// Q3: Temperature Display (Either)
// ==========================================
class _TemperatureDisplay extends StatelessWidget {
  const _TemperatureDisplay();

  @override
  Widget build(BuildContext context) {
    // Hardcoded value — stateless is fine here.
    // But in a real app fetching from an API, this would need state.
    const temp = 32;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.wb_sunny, color: Color(0xFFF59E0B), size: 40),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '$temp°C',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Color(0xFF101828),
              ),
            ),
            Text(
              'Kuala Lumpur',
              style: TextStyle(fontSize: 14, color: Color(0xFF4A5565)),
            ),
          ],
        ),
      ],
    );
  }
}

// ==========================================
// Q4: Expandable FAQ (Stateful)
// ==========================================
class _ExpandableFaq extends StatefulWidget {
  const _ExpandableFaq();

  @override
  State<_ExpandableFaq> createState() => _ExpandableFaqState();
}

class _ExpandableFaqState extends State<_ExpandableFaq> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'What is Flutter?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF101828),
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF4A5565),
                  ),
                ),
              ],
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5565),
                    height: 20 / 14,
                  ),
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// Q5: Labeled Divider (Stateless)
// ==========================================
class _LabeledDivider extends StatelessWidget {
  final String label;
  const _LabeledDivider({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF9CA3AF),
              letterSpacing: 1,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
      ],
    );
  }
}

// ==========================================
// Q6: Countdown Timer (Stateful)
// ==========================================
class _CountdownTimer extends StatefulWidget {
  const _CountdownTimer();

  @override
  State<_CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<_CountdownTimer> {
  int _secondsLeft = 30;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_secondsLeft > 0) {
          setState(() => _secondsLeft--);
        } else {
          _timer?.cancel();
          setState(() => _isRunning = false);
        }
      });
      setState(() => _isRunning = true);
    }
  }

  void _reset() {
    _timer?.cancel();
    setState(() {
      _secondsLeft = 30;
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');

    return Column(
      children: [
        Text(
          '$minutes:$seconds',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            fontFamily: 'monospace',
            color: _secondsLeft <= 5 && _secondsLeft > 0
                ? const Color(0xFFD4183D)
                : const Color(0xFF101828),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _toggleTimer,
              icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow, size: 18),
              label: Text(_isRunning ? 'Pause' : 'Start'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF155DFC),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: _reset,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF4A5565),
                side: const BorderSide(color: Color(0xFFE5E7EB)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}

// ==========================================
// Q7: Avatar with Status Dot (Either)
// ==========================================
class _AvatarWithStatus extends StatelessWidget {
  final bool isOnline;
  final String name;

  const _AvatarWithStatus({required this.isOnline, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                'https://ui-avatars.com/api/?name=$name&background=155DFC&color=fff&rounded=true&size=112',
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isOnline
                      ? const Color(0xFF00C950)
                      : const Color(0xFF9CA3AF),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF101828),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: isOnline
                        ? const Color(0xFF00C950)
                        : const Color(0xFF9CA3AF),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  isOnline ? 'Online' : 'Offline',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF4A5565),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// ==========================================
// Q8: Password Field (Stateful)
// ==========================================
class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;
  final _controller = TextEditingController(text: 'mysecretpass');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: _obscure,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock_outline, size: 20),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            size: 20,
          ),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF155DFC), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),
    );
  }
}

// ==========================================
// Q9: Product Price Tag (Stateless)
// ==========================================
class _ProductPriceTag extends StatelessWidget {
  const _ProductPriceTag();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Product image placeholder
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.laptop_mac, size: 32, color: Color(0xFF4A5565)),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MacBook Air M3',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF101828),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    'RM 4,999',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF155DFC),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'RM 5,399',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF9CA3AF),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFD4183D).withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            '-7%',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFFD4183D),
            ),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// Q10: Email Validator Field (Stateful)
// ==========================================
class _EmailValidatorField extends StatefulWidget {
  const _EmailValidatorField();

  @override
  State<_EmailValidatorField> createState() => _EmailValidatorFieldState();
}

class _EmailValidatorFieldState extends State<_EmailValidatorField> {
  final _controller = TextEditingController();
  String? _errorText;
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_validate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _validate() {
    final value = _controller.text;
    setState(() {
      if (value.isEmpty) {
        _errorText = null;
        _isValid = false;
      } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        _errorText = 'Please enter a valid email address';
        _isValid = false;
      } else {
        _errorText = null;
        _isValid = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email address',
            hintText: 'you@example.com',
            prefixIcon: const Icon(Icons.email_outlined, size: 20),
            suffixIcon: _controller.text.isNotEmpty
                ? Icon(
                    _isValid ? Icons.check_circle : Icons.error_outline,
                    color: _isValid
                        ? const Color(0xFF00C950)
                        : const Color(0xFFD4183D),
                    size: 20,
                  )
                : null,
            errorText: _errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _isValid
                    ? const Color(0xFF00C950)
                    : const Color(0xFFE5E7EB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _isValid
                    ? const Color(0xFF00C950)
                    : const Color(0xFF155DFC),
                width: 2,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          ),
        ),
        if (_isValid)
          const Padding(
            padding: EdgeInsets.only(top: 6, left: 4),
            child: Text(
              '✓ Looks good!',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF00C950),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
