import 'package:flutter/material.dart';
import 'event_detail_page.dart';

// ==========================================
// Event Data Model
// ==========================================
class EventData {
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final String date;
  final String time;
  final String location;
  final int currentAttendees;
  final int maxAttendees;
  final int? spotsLeft;
  final String? fullDescription;
  final List<SpeakerData> speakers;
  final List<AgendaItem> agenda;
  final List<String> whatToBring;

  const EventData({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
    required this.currentAttendees,
    required this.maxAttendees,
    this.spotsLeft,
    this.fullDescription,
    this.speakers = const [],
    this.agenda = const [],
    this.whatToBring = const [],
  });
}

// ==========================================
// Sample Events
// ==========================================
const _sampleEvents = [
  EventData(
    title: 'Introduction to Flutter Development',
    description:
        'Learn the basics of Flutter and build your first cross-platform mobile app. Perfect for beginners!',
    imageUrl:
        'https://www.figma.com/api/mcp/asset/1886c4ec-f573-4450-8959-1a3d55e9a805',
    category: 'Workshop',
    date: 'March 25, 2026',
    time: '2:00 PM - 5:00 PM',
    location: 'Sunway University, Room 3.12',
    currentAttendees: 42,
    maxAttendees: 50,
    spotsLeft: 8,
    fullDescription:
        'Join us for a comprehensive introduction to Flutter development! This hands-on workshop is designed for beginners who want to learn how to build beautiful, high-performance mobile applications for both iOS and Android using a single codebase. Our expert instructors will guide you through the fundamentals of Flutter, from setting up your development environment to building your first app.',
    speakers: [
      SpeakerData(
        name: 'Sarah Chen',
        role: 'Senior Flutter Developer at Google',
        bio:
            'Sarah has over 8 years of experience in mobile development and has been working with Flutter since its early days. She has built numerous production apps and loves teaching others.',
        avatarUrl: 'https://ui-avatars.com/api/?name=Sarah+Chen&background=4285F4&color=fff&rounded=true&size=96',
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
    title: 'GDGoC Sunway Hackathon 2026',
    description:
        '24-hour hackathon focused on building solutions for sustainable development. Form teams and compete for prizes!',
    imageUrl:
        'https://www.figma.com/api/mcp/asset/cb0eefdf-290e-4bd4-adaa-6fdc52136f1a',
    category: 'Hackathon',
    date: 'April 5-6, 2026',
    time: '9:00 AM - 9:00 AM',
    location: 'Sunway Innovation Labs',
    currentAttendees: 78,
    maxAttendees: 80,
    spotsLeft: 2,
  ),
  EventData(
    title: 'Cloud Computing with Google Cloud Platform',
    description:
        'Dive into GCP services and learn how to deploy scalable applications. Get hands-on experience with real projects.',
    imageUrl:
        'https://www.figma.com/api/mcp/asset/5812ee28-ee9f-45b0-b3c8-4825b05230b1',
    category: 'Workshop',
    date: 'March 30, 2026',
    time: '3:00 PM - 6:00 PM',
    location: 'Sunway University, Tech Hub',
    currentAttendees: 28,
    maxAttendees: 60,
  ),
  EventData(
    title: 'AI/ML Study Jam - TensorFlow Basics',
    description:
        'Join our study group to explore machine learning fundamentals using TensorFlow. Collaborative learning environment.',
    imageUrl:
        'https://www.figma.com/api/mcp/asset/1886c4ec-f573-4450-8959-1a3d55e9a805',
    category: 'Study Jam',
    date: 'March 28, 2026',
    time: '5:00 PM - 7:00 PM',
    location: 'Sunway Library, Study Room B',
    currentAttendees: 35,
    maxAttendees: 40,
    spotsLeft: 5,
  ),
];

// ==========================================
// Event Listing Page
// ==========================================
class EventListingPage extends StatefulWidget {
  const EventListingPage({super.key});

  @override
  State<EventListingPage> createState() => _EventListingPageState();
}

class _EventListingPageState extends State<EventListingPage> {
  int _selectedTab = 0;
  final List<String> _tabs = ['All Events', 'Upcoming', 'My Events'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          // ── Header ──
          _buildHeader(context),

          // ── Body ──
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              children: [
                // Section title
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

                // Event cards
                ..._sampleEvents.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _EventCard(event: e),
                    )),

                // Footer
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Header ──────────────────────────────────────────────
  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE5E7EB)),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              // Top row: menu – title – notification
              Row(
                children: [
                  _buildIconButton(Icons.menu),
                  const Expanded(
                    child: Text(
                      'GDGoC Sunway',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF101828),
                      ),
                    ),
                  ),
                  _buildIconButton(Icons.notifications_none),
                ],
              ),
              const SizedBox(height: 16),

              // Google colored dots + subtitle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGoogleDots(),
                  const SizedBox(width: 8),
                  const Text(
                    'Google Developer Groups on Campus',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A5565),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Filter tabs
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final isSelected = index == _selectedTab;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedTab = index),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? const Color(0xFF155DFC) : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: isSelected
                              ? null
                              : Border.all(
                                  color: Colors.black.withOpacity(0.1)),
                        ),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF0A0A0A),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 20, color: const Color(0xFF101828)),
        onPressed: () {},
      ),
    );
  }

  Widget _buildGoogleDots() {
    const colors = [
      Color(0xFF2B7FFF), // blue
      Color(0xFFFB2C36), // red
      Color(0xFFF0B100), // yellow
      Color(0xFF00C950), // green
    ];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: colors
          .map((c) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(shape: BoxShape.circle, color: c),
              ))
          .toList(),
    );
  }

  // ── Footer ──────────────────────────────────────────────
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: const Column(
        children: [
          Text(
            '© 2026 GDGoC Sunway University',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xFF4A5565)),
          ),
          SizedBox(height: 8),
          Text(
            'Join our community and grow your developer skills',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xFF4A5565)),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ==========================================
// Event Card Widget
// ==========================================
class _EventCard extends StatelessWidget {
  final EventData event;
  const _EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => EventDetailPage(
              event: event,
              fullDescription: event.fullDescription ?? event.description,
              speakers: event.speakers,
              agenda: event.agenda,
              whatToBring: event.whatToBring,
            ),
          ),
        );
      },
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
          // ── Image section ──
          _buildImageSection(),

          // ── Content section ──
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
                  event.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5565),
                    height: 20 / 14,
                  ),
                ),
                const SizedBox(height: 16),

                // Info rows
                _infoRow(Icons.calendar_today, event.date),
                const SizedBox(height: 8),
                _infoRow(Icons.access_time, event.time),
                const SizedBox(height: 8),
                _infoRow(Icons.location_on_outlined, event.location),
                const SizedBox(height: 8),
                _infoRow(Icons.people_outline,
                    '${event.currentAttendees} / ${event.maxAttendees} attendees'),
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
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 0,
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

  // ── Image with badges ──
  Widget _buildImageSection() {
    return SizedBox(
      height: 192,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            event.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey.shade300,
              child:
                  const Icon(Icons.image, size: 48, color: Colors.grey),
            ),
          ),

          // Category badge (top-left)
          Positioned(
            top: 15,
            left: 12,
            child: _badge(
              text: event.category,
              bgColor: Colors.white,
              textColor: const Color(0xFF101828),
            ),
          ),

          // Spots-left badge (top-right)
          if (event.spotsLeft != null)
            Positioned(
              top: 15,
              right: 12,
              child: _badge(
                text: '${event.spotsLeft} spots left',
                bgColor: const Color(0xFFD4183D),
                textColor: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  Widget _badge({
    required String text,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
          height: 16 / 12,
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF364153)),
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
