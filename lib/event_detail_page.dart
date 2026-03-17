import 'package:flutter/material.dart';

// ─── Event Data Model ────────────────────────────────────────────────────────

class EventData {
  final String imageUrl;
  final String category;
  final int? spotsLeft;
  final String title;
  final String shortDescription;
  final String longDescription;
  final String date;
  final String time;
  final String location;
  final int attendees;
  final int maxAttendees;
  final List<Speaker> speakers;
  final List<AgendaItem> agenda;
  final List<String> whatToBring;

  const EventData({
    required this.imageUrl,
    required this.category,
    this.spotsLeft,
    required this.title,
    required this.shortDescription,
    required this.longDescription,
    required this.date,
    required this.time,
    required this.location,
    required this.attendees,
    required this.maxAttendees,
    required this.speakers,
    required this.agenda,
    required this.whatToBring,
  });
}

class Speaker {
  final String name;
  final String role;
  final String bio;
  final String avatarUrl;

  const Speaker({
    required this.name,
    required this.role,
    required this.bio,
    required this.avatarUrl,
  });
}

class AgendaItem {
  final String time;
  final String title;

  const AgendaItem({
    required this.time,
    required this.title,
  });
}

// ─── Event Detail Page ───────────────────────────────────────────────────────

class EventDetailPage extends StatelessWidget {
  final EventData event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ─── Top App Bar ───────────────────────────────────────────
            Container(
              height: 68,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE5E7EB)),
                ),
              ),
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back, size: 18),
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
                    ),
                  ),
                ],
              ),
            ),

            // ─── Scrollable Content ────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero image with badges
                    SizedBox(
                      height: 256,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            event.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.image,
                                  size: 48, color: Colors.grey),
                            ),
                          ),
                          // Category badge
                          Positioned(
                            left: 16,
                            top: 19,
                            child: _Badge(
                              label: event.category,
                              backgroundColor: Colors.white,
                              textColor: const Color(0xFF101828),
                            ),
                          ),
                          // Spots left badge
                          if (event.spotsLeft != null)
                            Positioned(
                              right: 16,
                              top: 19,
                              child: _Badge(
                                label: '${event.spotsLeft} spots left',
                                backgroundColor: const Color(0xFFD4183D),
                                textColor: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),

                    // Content area
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
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Long description
                          Text(
                            event.longDescription,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4A5565),
                              height: 26 / 16,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // ─── Info Card ───────────────────────────────
                          _InfoCard(event: event),
                          const SizedBox(height: 24),

                          // ─── Speakers Section ────────────────────────
                          ..._buildSpeakersSection(),

                          // ─── Agenda Section ──────────────────────────
                          ..._buildAgendaSection(),

                          // ─── What to Bring Section ───────────────────
                          ..._buildWhatToBringSection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ─── Bottom Register Button ────────────────────────────────
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFE5E7EB)),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 17, 16, 17),
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
                      elevation: 0,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text('Register Interest'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSpeakersSection() {
    if (event.speakers.isEmpty) return [];
    return [
      const Text(
        'Speakers',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF101828),
          height: 28 / 20,
        ),
      ),
      const SizedBox(height: 16),
      ...event.speakers.map((s) => _SpeakerCard(speaker: s)),
      const SizedBox(height: 24),
    ];
  }

  List<Widget> _buildAgendaSection() {
    if (event.agenda.isEmpty) return [];
    return [
      const Text(
        'Agenda',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF101828),
          height: 28 / 20,
        ),
      ),
      const SizedBox(height: 16),
      _AgendaCard(items: event.agenda),
      const SizedBox(height: 24),
    ];
  }

  List<Widget> _buildWhatToBringSection() {
    if (event.whatToBring.isEmpty) return [];
    return [
      const Text(
        'What to Bring',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF101828),
          height: 28 / 20,
        ),
      ),
      const SizedBox(height: 16),
      _WhatToBringCard(items: event.whatToBring),
    ];
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

// ─── Info Card ───────────────────────────────────────────────────────────────

class _InfoCard extends StatelessWidget {
  final EventData event;

  const _InfoCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      padding: const EdgeInsets.all(17),
      child: Column(
        children: [
          // Date & Time
          _InfoRow(
            icon: Icons.calendar_today_outlined,
            title: event.date,
            subtitle: event.time,
          ),
          const _Divider(),
          // Location
          _InfoRow(
            icon: Icons.location_on_outlined,
            title: 'Location',
            subtitle: event.location,
          ),
          const _Divider(),
          // Attendees
          _InfoRow(
            icon: Icons.people_outline,
            title: 'Attendees',
            subtitle: '${event.attendees} / ${event.maxAttendees} registered',
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 20, color: const Color(0xFF364153)),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF101828),
                height: 24 / 16,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4A5565),
                height: 20 / 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 1,
      color: Colors.black.withOpacity(0.1),
    );
  }
}

// ─── Speaker Card ────────────────────────────────────────────────────────────

class _SpeakerCard extends StatelessWidget {
  final Speaker speaker;

  const _SpeakerCard({required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      padding: const EdgeInsets.all(17),
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
          // Speaker info
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
                  ),
                ),
                Text(
                  speaker.role,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF155DFC),
                    height: 20 / 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  speaker.bio,
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
      ),
    );
  }
}

// ─── Agenda Card ─────────────────────────────────────────────────────────────

class _AgendaCard extends StatelessWidget {
  final List<AgendaItem> items;

  const _AgendaCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          return Container(
            decoration: i < items.length - 1
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                  )
                : null,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                // Clock icon + time
                const Icon(
                  Icons.access_time_outlined,
                  size: 16,
                  color: Color(0xFF155DFC),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 56,
                  child: Text(
                    item.time,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF155DFC),
                      height: 20 / 14,
                    ),
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
}

// ─── What to Bring Card ──────────────────────────────────────────────────────

class _WhatToBringCard extends StatelessWidget {
  final List<String> items;

  const _WhatToBringCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFBEDBFF)),
      ),
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return Padding(
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
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
