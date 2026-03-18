// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

// ==========================================
// State Demo Page
// ==========================================
class StateDemoPage extends StatelessWidget {
  const StateDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          'Stateless vs Stateful',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Color(0xFFE5E7EB)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Intro ──
          const _SectionHeader(
            icon: Icons.info_outline,
            title: 'What\'s the difference?',
          ),
          const SizedBox(height: 8),
       const   _ExplanationCard(
            children: [
              _ConceptRow(
                color: const Color(0xFF155DFC),
                label: 'StatelessWidget',
                description:
                    'Cannot change once built. Think of it like a printed poster — the content is fixed.',
              ),
               SizedBox(height: 12),
              _ConceptRow(
                color: const Color(0xFF00C950),
                label: 'StatefulWidget',
                description:
                    'Can change over time using setState(). Think of it like a scoreboard — the numbers update live.',
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ── Stateless Demo ──
          const _SectionHeader(
            icon: Icons.lock_outline,
            title: 'Stateless Widget Demo',
            badge: 'STATELESS',
            badgeColor: Color(0xFF155DFC),
          ),
          const SizedBox(height: 8),
          const _StaticProfileCard(),

          const SizedBox(height: 8),
          const _HintCard(
            text:
                '☝️ This card is a StatelessWidget. The name, role, and avatar never change no matter what you do. It receives data once and displays it.',
          ),

          const SizedBox(height: 16),

          // ── Stateless Demo: Unresponsive Tap Counter ──
          const _UnresponsiveTapCard(),

          const SizedBox(height: 8),
          const _HintCard(
            text:
                '☝️ Go ahead, tap the button! Nothing happens because a StatelessWidget has no setState(). The count variable is local — it resets every build and can never be stored.',
          ),

          const SizedBox(height: 16),

          // ── Stateless Demo: Frozen Timestamp ──
          const _FrozenTimestampCard(),

          const SizedBox(height: 8),
          const _HintCard(
            text:
                '☝️ This shows the time the widget was first built. Scroll away and come back — the time is frozen because StatelessWidget only builds once and never updates itself.',
          ),

          const SizedBox(height: 16),



          // ── Stateless Demo: Static Info Card ──
          const _StaticInfoCard(),

          const SizedBox(height: 8),
          const _HintCard(
            text:
                '☝️ Pure display — no interactivity at all. A StatelessWidget is perfect for showing fixed content like labels, icons, and info rows.',
          ),

          const SizedBox(height: 24),


            // ── Stateful Demo: Live Timestamp (contrast to Frozen) ──
          const _SectionHeader(
            icon: Icons.update,
            title: 'Stateful Widget Demo — Live Clock',
            badge: 'STATEFUL',
            badgeColor: Color(0xFF00C950),
          ),
          const SizedBox(height: 8),
          const _LiveTimestampCard(),

          const SizedBox(height: 8),
          const _HintCard(
            text:
                '☝️ Compare this to the frozen clock above! Same layout, but this one uses a StatefulWidget with a Timer. Every second, setState() is called and Flutter rebuilds the widget with the new time.',
          ),
          const SizedBox(height: 24),

          // ── Stateful Demo: Counter ──
          const _SectionHeader(
            icon: Icons.touch_app,
            title: 'Stateful Widget Demo — Counter',
            badge: 'STATEFUL',
            badgeColor: Color(0xFF00C950),
          ),
          const SizedBox(height: 8),
          const _InteractiveCounter(),

          const SizedBox(height: 8),
          const _HintCard(
            text:
                '☝️ This is a StatefulWidget. Pressing the buttons calls setState(), which tells Flutter to rebuild the widget with the new count value.',
          ),

          const SizedBox(height: 24),

      
          // ── Stateful Demo: Theme Switcher ──
          const _SectionHeader(
            icon: Icons.palette_outlined,
            title: 'Stateful Widget Demo — Toggles',
            badge: 'STATEFUL',
            badgeColor: Color(0xFF00C950),
          ),
          const SizedBox(height: 8),
          const _ToggleDemo(),

          const SizedBox(height: 8),
          const _HintCard(
            text:
                '☝️ Multiple pieces of state in one widget! Each toggle calls setState() independently, and Flutter only rebuilds what changed.',
          ),

          const SizedBox(height: 24),

          // ── Stateful Demo: Follow Button ──
          const _SectionHeader(
            icon: Icons.person_add_alt_1,
            title: 'Stateful Widget Demo — Follow',
            badge: 'STATEFUL',
            badgeColor: Color(0xFF00C950),
          ),
          const SizedBox(height: 8),
          const _FollowButtonDemo(),

          const SizedBox(height: 8),
          const _HintCard(
            text:
                '☝️ The button toggles between two visual states. The boolean isFollowing flips on tap and setState() triggers a rebuild with the new style.',
          ),

          const SizedBox(height: 24),

          // ── Key Takeaway ──
          const _KeyTakeawayCard(),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ==========================================
// Section Header
// ==========================================
class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? badge;
  final Color? badgeColor;

  const _SectionHeader({
    required this.icon,
    required this.title,
    this.badge,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF364153)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF101828),
            ),
          ),
        ),
        if (badge != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: badgeColor?.withOpacity(0.12) ?? Colors.grey.shade100,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              badge!,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: badgeColor ?? Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
          ),
      ],
    );
  }
}

// ==========================================
// Explanation Card
// ==========================================
class _ExplanationCard extends StatelessWidget {
  final List<Widget> children;
  const _ExplanationCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _ConceptRow extends StatelessWidget {
  final Color color;
  final String label;
  final String description;

  const _ConceptRow({
    required this.color,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4A5565),
                  height: 20 / 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ==========================================
// Hint Card
// ==========================================
class _HintCard extends StatelessWidget {
  final String text;
  const _HintCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFDE68A)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF92400E),
          height: 18 / 13,
        ),
      ),
    );
  }
}

// ==========================================
// Stateless: Static Profile Card
// ==========================================
class _StaticProfileCard extends StatelessWidget {
  const _StaticProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://ui-avatars.com/api/?name=Tyler&background=155DFC&color=fff&rounded=true&size=120',
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tyler',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF101828),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5565),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF155DFC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    '3 YOE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF155DFC),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // A lock icon to reinforce "static"
          Icon(Icons.lock_outline, color: Colors.grey.shade400, size: 20),
        ],
      ),
    );
  }
}

// ==========================================
// Stateless: Unresponsive Tap Card
// ==========================================
class _UnresponsiveTapCard extends StatelessWidget {
  const _UnresponsiveTapCard();

  @override
  Widget build(BuildContext context) {
    // This variable is LOCAL — it's created fresh every build
    // and there's no way to change it, because there's no setState().
    int tapCount = 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          // "No state" indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFD4183D),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'no state — tapCount is always $tapCount',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Icon(Icons.touch_app, size: 40, color: Color(0xFFD4183D)),
          const SizedBox(height: 8),
          Text(
            'Tapped $tapCount times',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF101828),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // This does NOTHING visible!
                // We can increment the local variable, but there's
                // no setState() to trigger a rebuild.
                tapCount++;
                debugPrint('tapCount = $tapCount (but UI won\'t update!)');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4183D),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Tap me! (nothing will happen)'),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Stateless: Frozen Timestamp Card
// ==========================================
class _FrozenTimestampCard extends StatelessWidget {
  const _FrozenTimestampCard();

  @override
  Widget build(BuildContext context) {
    // This timestamp is captured when the widget builds.
    // A StatelessWidget cannot trigger its own rebuild,
    // so this time stays "frozen" on screen.
    final now = DateTime.now();
    final timeString =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFD4183D),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'no state — time frozen at build',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Icon(Icons.access_time, size: 40, color: Color(0xFF155DFC)),
          const SizedBox(height: 8),
          Text(
            timeString,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              fontFamily: 'monospace',
              color: Color(0xFF101828),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Built once. Never updates.',
            style: TextStyle(fontSize: 14, color: Color(0xFF4A5565)),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                // This doesn't refresh the time because
                // a StatelessWidget can't call setState().
                debugPrint('Button pressed, but widget cannot rebuild itself!');
              },
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Try to refresh (won\'t work)'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF155DFC),
                side: const BorderSide(color: Color(0xFFE5E7EB)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Stateless: Static Info Card
// ==========================================
class _StaticInfoCard extends StatelessWidget {
  const _StaticInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFD4183D),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'no state — pure display only',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _staticInfoRow(Icons.event, 'Event', 'Flutter Workshop'),
          const Divider(height: 20, thickness: 1, color: Color(0x1A000000)),
          _staticInfoRow(Icons.calendar_today, 'Date', 'March 25, 2026'),
          const Divider(height: 20, thickness: 1, color: Color(0x1A000000)),
          _staticInfoRow(Icons.access_time, 'Time', '2:00 PM – 5:00 PM'),
          const Divider(height: 20, thickness: 1, color: Color(0x1A000000)),
          _staticInfoRow(Icons.location_on_outlined, 'Location', 'Room 3.12'),
        ],
      ),
    );
  }

  Widget _staticInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF155DFC)),
        const SizedBox(width: 10),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4A5565),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF101828),
            ),
          ),
        ),
        Icon(Icons.lock_outline, size: 14, color: Colors.grey.shade400),
      ],
    );
  }
}

// ==========================================
// Stateful: Live Timestamp Card
// ==========================================
class _LiveTimestampCard extends StatefulWidget {
  const _LiveTimestampCard();

  @override
  State<_LiveTimestampCard> createState() => _LiveTimestampCardState();
}

class _LiveTimestampCardState extends State<_LiveTimestampCard> {
  late DateTime _now;
  Timer? _timer;
  bool _isRunning = true;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_isRunning) {
        setState(() {
          _now = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _timeString =>
      '${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}:${_now.second.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          // Live state indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF00C950),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'state: time = $_timeString (updates every 1s)',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Icon(
            _isRunning ? Icons.access_time_filled : Icons.pause_circle_outline,
            size: 40,
            color: const Color(0xFF00C950),
          ),
          const SizedBox(height: 8),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: Text(
              _timeString,
              key: ValueKey<String>(_timeString),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                fontFamily: 'monospace',
                color: Color(0xFF101828),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _isRunning ? 'Updating every second via setState()' : 'Paused — no setState() calls',
            style: const TextStyle(fontSize: 14, color: Color(0xFF4A5565)),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isRunning = !_isRunning;
                });
              },
              icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow, size: 18),
              label: Text(_isRunning ? 'Pause' : 'Resume'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C950),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Stateful: Interactive Counter
// ==========================================
class _InteractiveCounter extends StatefulWidget {
  const _InteractiveCounter();

  @override
  State<_InteractiveCounter> createState() => _InteractiveCounterState();
}

class _InteractiveCounterState extends State<_InteractiveCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          // Live state indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF00C950),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'state: count = $_count',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Big counter display
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
              style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w800,
                color: Color(0xFF101828),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => setState(() => _count--),
                  icon: const Icon(Icons.remove, size: 18),
                  label: const Text('Decrement'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFD4183D),
                    side: const BorderSide(color: Color(0xFFE5E7EB)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => _count++),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Increment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF155DFC),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => setState(() => _count = 0),
              child: const Text(
                'Reset',
                style: TextStyle(color: Color(0xFF4A5565), fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Stateful: Toggle Demo
// ==========================================
class _ToggleDemo extends StatefulWidget {
  const _ToggleDemo();

  @override
  State<_ToggleDemo> createState() => _ToggleDemoState();
}

class _ToggleDemoState extends State<_ToggleDemo> {
  bool _darkMode = false;
  bool _notifications = true;
  double _fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _darkMode ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          // Live state indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF00C950),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'state: dark=$_darkMode, notif=$_notifications, size=${_fontSize.toInt()}',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w500,
                  color: _darkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Preview text
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: _fontSize,
              fontWeight: FontWeight.w600,
              color: _darkMode ? Colors.white : const Color(0xFF101828),
            ),
            child: const Text('Preview Text'),
          ),
          const SizedBox(height: 16),

          // Dark mode toggle
          _toggleRow(
            icon: _darkMode ? Icons.dark_mode : Icons.light_mode,
            label: 'Dark Mode',
            value: _darkMode,
            onChanged: (v) => setState(() => _darkMode = v),
            isDark: _darkMode,
          ),
          const SizedBox(height: 8),

          // Notifications toggle
          _toggleRow(
            icon: _notifications
                ? Icons.notifications_active
                : Icons.notifications_off_outlined,
            label: 'Notifications',
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
            isDark: _darkMode,
          ),
          const SizedBox(height: 12),

          // Font size slider
          Row(
            children: [
              Icon(Icons.text_fields,
                  size: 20,
                  color: _darkMode ? Colors.grey.shade400 : const Color(0xFF364153)),
              const SizedBox(width: 8),
              Text(
                'Font Size',
                style: TextStyle(
                  fontSize: 14,
                  color: _darkMode ? Colors.grey.shade300 : const Color(0xFF364153),
                ),
              ),
              Expanded(
                child: Slider(
                  value: _fontSize,
                  min: 12,
                  max: 32,
                  divisions: 10,
                  activeColor: const Color(0xFF00C950),
                  label: _fontSize.toInt().toString(),
                  onChanged: (v) => setState(() => _fontSize = v),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _toggleRow({
    required IconData icon,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool isDark,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: isDark ? Colors.grey.shade400 : const Color(0xFF364153)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey.shade300 : const Color(0xFF364153),
            ),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF00C950),
        ),
      ],
    );
  }
}

// ==========================================
// Stateful: Follow Button Demo
// ==========================================
class _FollowButtonDemo extends StatefulWidget {
  const _FollowButtonDemo();

  @override
  State<_FollowButtonDemo> createState() => _FollowButtonDemoState();
}

class _FollowButtonDemoState extends State<_FollowButtonDemo> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          // Live state indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF00C950),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'state: isFollowing = $_isFollowing',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  'https://ui-avatars.com/api/?name=Tyler&background=155DFC&color=fff&rounded=true&size=96',
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tyler',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF101828),
                      ),
                    ),
                    Text(
                      '@tyler_flutter',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4A5565),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => _isFollowing = !_isFollowing),
                  icon: Icon(
                    _isFollowing ? Icons.check : Icons.person_add,
                    size: 16,
                  ),
                  label: Text(_isFollowing ? 'Following' : 'Follow'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFollowing
                        ? const Color(0xFF00C950)
                        : const Color(0xFF155DFC),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Key Takeaway Card
// ==========================================
class _KeyTakeawayCard extends StatelessWidget {
  const _KeyTakeawayCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBEDBFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.lightbulb_outline, size: 20, color: Color(0xFF155DFC)),
              SizedBox(width: 8),
              Text(
                'Key Takeaway',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF155DFC),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _takeawayItem('Use StatelessWidget when data never changes after build.'),
          const SizedBox(height: 8),
          _takeawayItem('Use StatefulWidget when the UI needs to react to user interaction.'),
          const SizedBox(height: 8),
          _takeawayItem('Always call setState() to tell Flutter to rebuild.'),
        ],
      ),
    );
  }

  Widget _takeawayItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('•  ',
            style: TextStyle(color: Color(0xFF155DFC), fontSize: 14)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF364153),
              height: 20 / 14,
            ),
          ),
        ),
      ],
    );
  }
}
