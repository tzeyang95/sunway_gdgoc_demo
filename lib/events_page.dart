import 'package:flutter/material.dart';
import 'event_detail_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All Events', 'Upcoming', 'My Events'];

  static const List<EventData> _events = [
    EventData(
      imageUrl:
          'https://www.figma.com/api/mcp/asset/7bcd5718-abc1-40a6-b9ed-9fa7f5365c0f',
      category: 'Workshop',
      spotsLeft: 8,
      title: 'Introduction to Flutter Development',
      shortDescription:
          'Learn the basics of Flutter and build your first cross-platform mobile app. Perfect for beginners!',
      longDescription:
          'Join us for a comprehensive introduction to Flutter development! This hands-on workshop is designed for beginners who want to learn how to build beautiful, high-performance mobile applications for both iOS and Android using a single codebase. Our expert instructors will guide you through the fundamentals of Flutter, from setting up your development environment to building your first app.',
      date: 'March 25, 2026',
      time: '2:00 PM - 5:00 PM',
      location: 'Sunway University, Room 3.12',
      attendees: 42,
      maxAttendees: 50,
      speakers: [
        Speaker(
          name: 'Sarah Chen',
          role: 'Senior Flutter Developer at Google',
          bio:
              'Sarah has over 8 years of experience in mobile development and has been working with Flutter since its early days. She has built numerous production apps and loves teaching others.',
          avatarUrl:
              'https://www.figma.com/api/mcp/asset/b32db506-be9c-4f42-9e2b-92886a112661',
        ),
      ],
      agenda: [
        AgendaItem(time: '2:00 PM', title: 'Welcome & Introduction to Flutter'),
        AgendaItem(time: '2:30 PM', title: 'Setting up Development Environment'),
        AgendaItem(time: '3:00 PM', title: 'Building Your First Flutter App'),
        AgendaItem(time: '3:45 PM', title: 'Break'),
        AgendaItem(time: '4:00 PM', title: 'Hands-on Project: Simple Todo App'),
        AgendaItem(time: '4:45 PM', title: 'Q&A and Next Steps'),
      ],
      whatToBring: [
        'Laptop with at least 8GB RAM',
        'Basic programming knowledge (any language)',
        'Pre-install Flutter SDK (instructions will be sent)',
        'Text editor or IDE (VS Code recommended)',
      ],
    ),
    EventData(
      imageUrl:
          'https://www.figma.com/api/mcp/asset/d90f0a79-f154-4e82-9178-64065d4c698c',
      category: 'Hackathon',
      spotsLeft: 2,
      title: 'GDGoC Sunway Hackathon 2026',
      shortDescription:
          '24-hour hackathon focused on building solutions for sustainable development. Form teams and compete for prizes!',
      longDescription:
          'Get ready for the biggest hackathon of the year! The GDGoC Sunway Hackathon 2026 is a 24-hour coding marathon where teams of 3-5 will build innovative solutions for sustainable development. Whether you\'re a seasoned developer or just starting out, this is your chance to collaborate, learn, and compete for exciting prizes including Google hardware and cloud credits.',
      date: 'April 5-6, 2026',
      time: '9:00 AM - 9:00 AM',
      location: 'Sunway Innovation Labs',
      attendees: 78,
      maxAttendees: 80,
      speakers: [
        Speaker(
          name: 'Dr. Ahmad Rizal',
          role: 'Director of Innovation at Sunway',
          bio:
              'Dr. Ahmad leads the innovation initiatives at Sunway University and has mentored over 200 hackathon teams.',
          avatarUrl:
              'https://www.figma.com/api/mcp/asset/b32db506-be9c-4f42-9e2b-92886a112661',
        ),
      ],
      agenda: [
        AgendaItem(time: '9:00 AM', title: 'Registration & Team Formation'),
        AgendaItem(time: '10:00 AM', title: 'Opening Ceremony & Theme Reveal'),
        AgendaItem(time: '11:00 AM', title: 'Hacking Begins!'),
        AgendaItem(time: '1:00 PM', title: 'Lunch Break & Mentor Sessions'),
        AgendaItem(time: '6:00 PM', title: 'Dinner & Progress Check-in'),
        AgendaItem(time: '9:00 AM', title: 'Final Submissions & Judging'),
      ],
      whatToBring: [
        'Laptop and charger',
        'Sleeping bag (optional)',
        'Identification card',
        'Ideas and enthusiasm!',
      ],
    ),
    EventData(
      imageUrl:
          'https://www.figma.com/api/mcp/asset/fb757c5e-efb6-429e-97c6-9ac4f130d7e1',
      category: 'Workshop',
      title: 'Cloud Computing with Google Cloud Platform',
      shortDescription:
          'Dive into GCP services and learn how to deploy scalable applications. Get hands-on experience with real projects.',
      longDescription:
          'This workshop covers the essential Google Cloud Platform services you need to know. Learn about Compute Engine, Cloud Functions, Cloud Storage, and BigQuery. You\'ll deploy a real application to GCP and understand the fundamentals of cloud architecture, scaling, and monitoring.',
      date: 'March 30, 2026',
      time: '3:00 PM - 6:00 PM',
      location: 'Sunway University, Tech Hub',
      attendees: 28,
      maxAttendees: 60,
      speakers: [
        Speaker(
          name: 'Wei Lin Tan',
          role: 'Cloud Solutions Architect at Google',
          bio:
              'Wei Lin is a Google Cloud certified architect with experience helping startups and enterprises migrate to the cloud.',
          avatarUrl:
              'https://www.figma.com/api/mcp/asset/b32db506-be9c-4f42-9e2b-92886a112661',
        ),
      ],
      agenda: [
        AgendaItem(time: '3:00 PM', title: 'Introduction to Google Cloud'),
        AgendaItem(time: '3:30 PM', title: 'Core GCP Services Overview'),
        AgendaItem(time: '4:15 PM', title: 'Hands-on: Deploy Your First App'),
        AgendaItem(time: '5:00 PM', title: 'Break'),
        AgendaItem(time: '5:15 PM', title: 'Scaling & Monitoring'),
        AgendaItem(time: '5:45 PM', title: 'Q&A and Resources'),
      ],
      whatToBring: [
        'Laptop with Chrome browser',
        'Google account (Gmail)',
        'Basic understanding of web development',
      ],
    ),
    EventData(
      imageUrl:
          'https://www.figma.com/api/mcp/asset/7bcd5718-abc1-40a6-b9ed-9fa7f5365c0f',
      category: 'Study Jam',
      spotsLeft: 5,
      title: 'AI/ML Study Jam - TensorFlow Basics',
      shortDescription:
          'Join our study group to explore machine learning fundamentals using TensorFlow. Collaborative learning environment.',
      longDescription:
          'Explore the exciting world of machine learning in this collaborative study jam! We\'ll work through TensorFlow basics together, covering neural networks, data preprocessing, model training, and evaluation. No prior ML experience needed — just bring your curiosity and willingness to learn.',
      date: 'March 28, 2026',
      time: '5:00 PM - 7:00 PM',
      location: 'Sunway Library, Study Room B',
      attendees: 35,
      maxAttendees: 40,
      speakers: [
        Speaker(
          name: 'Priya Sharma',
          role: 'ML Engineer at DeepMind',
          bio:
              'Priya specializes in computer vision and NLP. She leads the AI/ML study group at GDGoC Sunway.',
          avatarUrl:
              'https://www.figma.com/api/mcp/asset/b32db506-be9c-4f42-9e2b-92886a112661',
        ),
      ],
      agenda: [
        AgendaItem(time: '5:00 PM', title: 'Intro to Machine Learning Concepts'),
        AgendaItem(time: '5:30 PM', title: 'TensorFlow Setup & Basics'),
        AgendaItem(time: '6:00 PM', title: 'Hands-on: Build a Simple Model'),
        AgendaItem(time: '6:45 PM', title: 'Discussion & Next Steps'),
      ],
      whatToBring: [
        'Laptop with Python installed',
        'Google Colab account (free)',
        'Curiosity and willingness to learn',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ─── Sticky Header ─────────────────────────────────────────
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE5E7EB)),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  // Top bar: hamburger – title – bell
                  Row(
                    children: [
                      SizedBox(
                        width: 36,
                        height: 36,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.menu, size: 20),
                          onPressed: () {},
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'GDGoC Sunway',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF101828),
                            height: 28 / 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 36,
                        height: 36,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.notifications_outlined, size: 20),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Google-colored dots + subtitle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google dots
                      Row(
                        children: [
                          _dot(const Color(0xFF2B7FFF)),
                          const SizedBox(width: 4),
                          _dot(const Color(0xFFFB2C36)),
                          const SizedBox(width: 4),
                          _dot(const Color(0xFFF0B100)),
                          const SizedBox(width: 4),
                          _dot(const Color(0xFF00C950)),
                        ],
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Google Developer Groups on Campus',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4A5565),
                          height: 20 / 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Filter tabs
                  SizedBox(
                    height: 36,
                    child: Row(
                      children: List.generate(_filters.length, (i) {
                        final isSelected = _selectedFilter == i;
                        return Padding(
                          padding: EdgeInsets.only(right: i < _filters.length - 1 ? 8 : 0),
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedFilter = i),
                            child: Container(
                              height: 32,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF155DFC)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: isSelected
                                    ? null
                                    : Border.all(color: Colors.black.withOpacity(0.1)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _filters[i],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF0A0A0A),
                                  height: 20 / 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // ─── Main scrollable content ───────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                children: [
                  // Section heading
                  const Text(
                    'Latest Events',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF101828),
                      height: 32 / 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Join us for exciting tech events and workshops',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4A5565),
                      height: 24 / 16,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Event Cards
                  ...List.generate(_events.length, (i) {
                    final event = _events[i];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: i < _events.length - 1 ? 24 : 0,
                      ),
                      child: _EventCard(
                        event: event,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => EventDetailPage(event: event),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFE5E7EB)),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
              child: const Column(
                children: [
                  Text(
                    '© 2026 GDGoC Sunway University',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A5565),
                      height: 20 / 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Join our community and grow your developer skills',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A5565),
                      height: 20 / 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

// ─── Event Card Widget ───────────────────────────────────────────────────────

class _EventCard extends StatelessWidget {
  final EventData event;
  final VoidCallback? onTap;

  const _EventCard({
    required this.event,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: -1,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with badges
          SizedBox(
            height: 192,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  event.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image, size: 48, color: Colors.grey),
                  ),
                ),
                // Category badge (top-left)
                Positioned(
                  left: 12,
                  top: 15,
                  child: _Badge(
                    label: event.category,
                    backgroundColor: Colors.white,
                    textColor: const Color(0xFF101828),
                  ),
                ),
                // Spots left badge (top-right)
                if (event.spotsLeft != null)
                  Positioned(
                    right: 12,
                    top: 15,
                    child: _Badge(
                      label: '${event.spotsLeft} spots left',
                      backgroundColor: const Color(0xFFD4183D),
                      textColor: Colors.white,
                    ),
                  ),
              ],
            ),
          ),

          // Card content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF101828),
                    height: 28 / 18,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  event.shortDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5565),
                    height: 20 / 14,
                  ),
                ),
                const SizedBox(height: 16),

                // Details rows
                _DetailRow(
                  icon: Icons.calendar_today_outlined,
                  text: event.date,
                ),
                const SizedBox(height: 8),
                _DetailRow(
                  icon: Icons.access_time,
                  text: event.time,
                ),
                const SizedBox(height: 8),
                _DetailRow(
                  icon: Icons.location_on_outlined,
                  text: event.location,
                ),
                const SizedBox(height: 8),
                _DetailRow(
                  icon: Icons.people_outline,
                  text: '${event.attendees} / ${event.maxAttendees} attendees',
                ),
                const SizedBox(height: 16),

                // Register button
                SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF155DFC),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text('Register Interest'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

// ─── Badge Widget ────────────────────────────────────────────────────────────

class _Badge extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const _Badge({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
          height: 16 / 12,
        ),
      ),
    );
  }
}

// ─── Detail Row Widget ───────────────────────────────────────────────────────

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DetailRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: const Color(0xFF364153),
        ),
        const SizedBox(width: 8),
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
