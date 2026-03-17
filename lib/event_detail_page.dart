import 'package:flutter/material.dart';
import 'event_listing_page.dart';

// ==========================================
// Speaker Data Model
// ==========================================
class SpeakerData {
  final String name;
  final String role;
  final String bio;
  final String avatarUrl;

  const SpeakerData({
    required this.name,
    required this.role,
    required this.bio,
    required this.avatarUrl,
  });
}

// ==========================================
// Agenda Item Data Model
// ==========================================
class AgendaItem {
  final String time;
  final String title;

  const AgendaItem({
    required this.time,
    required this.title,
  });
}

// ==========================================
// Event Detail Page
// ==========================================
class EventDetailPage extends StatelessWidget {
  final EventData event;
  final String fullDescription;
  final List<SpeakerData> speakers;
  final List<AgendaItem> agenda;
  final List<String> whatToBring;

  const EventDetailPage({
    super.key,
    required this.event,
    required this.fullDescription,
    required this.speakers,
    required this.agenda,
    required this.whatToBring,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          // ── App Bar ──
          _buildAppBar(context),

          // ── Scrollable Content ──
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero image with badges
                  _buildHeroImage(),

                  // Content body
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          event.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF101828),
                            height: 32 / 24,
                            letterSpacing: 0.07,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Description
                        Text(
                          fullDescription,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4A5565),
                            height: 26 / 16,
                            letterSpacing: -0.31,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Info card
                        _buildInfoCard(),
                        const SizedBox(height: 24),

                        // Speakers section
                        if (speakers.isNotEmpty) ...[
                          const Text(
                            'Speakers',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF101828),
                              height: 28 / 20,
                              letterSpacing: -0.45,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...speakers.map(_buildSpeakerCard),
                          const SizedBox(height: 24),
                        ],

                        // Agenda section
                        if (agenda.isNotEmpty) ...[
                          const Text(
                            'Agenda',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF101828),
                              height: 28 / 20,
                              letterSpacing: -0.45,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildAgendaCard(),
                          const SizedBox(height: 24),
                        ],

                        // What to Bring section
                        if (whatToBring.isNotEmpty) ...[
                          const Text(
                            'What to Bring',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF101828),
                              height: 28 / 20,
                              letterSpacing: -0.45,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildWhatToBringCard(),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Bottom Register Button ──
          _buildBottomBar(),
        ],
      ),
    );
  }

  // ── App Bar ──
  Widget _buildAppBar(BuildContext context) {
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
          height: 68,
          child: Row(
            children: [
              const SizedBox(width: 16),
              SizedBox(
                width: 36,
                height: 36,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: Color(0xFF101828),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Event Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF101828),
                  height: 28 / 18,
                  letterSpacing: -0.44,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Hero Image ──
  Widget _buildHeroImage() {
    return SizedBox(
      height: 256,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            event.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.image, size: 48, color: Colors.grey),
            ),
          ),
          // Category badge (top-left)
          Positioned(
            top: 19,
            left: 16,
            child: _badge(
              text: event.category,
              bgColor: Colors.white,
              textColor: const Color(0xFF101828),
            ),
          ),
          // Spots-left badge (top-right)
          if (event.spotsLeft != null)
            Positioned(
              top: 19,
              right: 16,
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

  // ── Info Card ──
  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          // Date & Time
          _buildInfoRow(
            icon: Icons.calendar_today_outlined,
            title: event.date,
            subtitle: event.time,
          ),
          const Divider(height: 24, thickness: 1, color: Color(0x1A000000)),
          // Location
          _buildInfoRow(
            icon: Icons.location_on_outlined,
            title: 'Location',
            subtitle: event.location,
          ),
          const Divider(height: 24, thickness: 1, color: Color(0x1A000000)),
          // Attendees
          _buildInfoRow(
            icon: Icons.people_outline,
            title: 'Attendees',
            subtitle:
                '${event.currentAttendees} / ${event.maxAttendees} registered',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 20, color: const Color(0xFF364153)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101828),
                  height: 24 / 16,
                  letterSpacing: -0.31,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4A5565),
                  height: 20 / 14,
                  letterSpacing: -0.15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Speaker Card ──
  Widget _buildSpeakerCard(SpeakerData speaker) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          ClipOval(
            child: Image.network(
              speaker.avatarUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 48,
                height: 48,
                color: Colors.grey.shade300,
                child: const Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  speaker.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF101828),
                    height: 27 / 18,
                    letterSpacing: -0.44,
                  ),
                ),
                Text(
                  speaker.role,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF155DFC),
                    height: 20 / 14,
                    letterSpacing: -0.15,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  speaker.bio,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5565),
                    height: 20 / 14,
                    letterSpacing: -0.15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Agenda Card ──
  Widget _buildAgendaCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.generate(agenda.length, (index) {
          final item = agenda[index];
          final isLast = index == agenda.length - 1;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: isLast
                  ? null
                  : const Border(
                      bottom: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
            ),
            child: Row(
              children: [
                // Time
                SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF155DFC),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.time,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF155DFC),
                          height: 20 / 14,
                          letterSpacing: -0.15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Title
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF101828),
                      height: 24 / 16,
                      letterSpacing: -0.31,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ── What to Bring Card ──
  Widget _buildWhatToBringCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFBEDBFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: whatToBring
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '•  ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF155DFC),
                        height: 20 / 14,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF364153),
                          height: 20 / 14,
                          letterSpacing: -0.15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // ── Bottom Bar ──
  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 17, 16, 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 40,
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
                letterSpacing: -0.15,
              ),
              elevation: 0,
            ),
            child: const Text('Register Interest'),
          ),
        ),
      ),
    );
  }
}
