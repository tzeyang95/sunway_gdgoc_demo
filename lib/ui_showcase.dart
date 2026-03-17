import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UiShowcasePage extends StatelessWidget {
  const UiShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // 1. Flexible App Bar with smooth shrinking title
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Expressive UI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              titlePadding: EdgeInsetsDirectional.only(start: 16, bottom: 16),
              expandedTitleScale: 1.6,
            ),
          ),
          
          // 2. The Content
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  'Hot Reload Demo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Try changing the colors, border radius, or text in the code and hitting save. Watch it update instantly!',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 24),

                // Beautiful Card Widget
                _buildGlassCard(context),
                
                const SizedBox(height: 24),
                
                // Animated Widget
                // const Text(
                //   'Built-in Animations',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
                // const SizedBox(height: 16),
                // const AnimatedInteractiveBox(),
                
                const SizedBox(height: 24),
                
                // Complex Layout (Row/Column mix)
                const Text(
                  'Complex Layouts Made Easy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildStatsGrid(),
                
                const SizedBox(height: 32),
                
                // --- NEW UI/UX WIDGETS ADDED BELOW ---

                const Text(
                  'Material 3 & Interactive Components',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                
                // 4. Modern Filter Chips (Horizontal Scroll)
                const SizedBox(
                  height: 40,
                  child: ModernFilterChips(),
                ),
                
                const SizedBox(height: 24),
                
                // 5. Neumorphic Style Floating Action Button replacement
                Center(child: _buildNeumorphicButton()),

                const SizedBox(height: 24),

                // 6. Expandable Accordion (ExpansionTile)
                _buildAccordionDemo(),

                const SizedBox(height: 32),

                // --- LIQUID GLASS SHOWCASE ---

                const Text(
                  'Liquid Glass (iOS 26 Style)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Recreating Apple\'s Liquid Glass design language with Flutter\'s BackdropFilter and blur effects.',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),

                // Liquid Glass Cards
                _buildLiquidGlassShowcase(),

                const SizedBox(height: 32),

                // --- NATIVE LOOK: MATERIAL 3 VS CUPERTINO ---

                const Text(
                  'Native Feel: Android vs iOS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Flutter provides pixel-perfect native widgets for both ecosystems out of the box.',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                
                // 7. Material vs Cupertino Toggles side-by-side
                _buildNativeToggles(),

                const SizedBox(height: 24),

                // 8. Material vs Cupertino Sliders side-by-side
                _buildNativeSliders(),

                const SizedBox(height: 24),

                // 9. iOS Segmented Control
                _buildCupertinoSegmentedControl(),

                const SizedBox(height: 32),

                // --- MORE NATIVE WIDGETS ---

                const Text(
                  'Native Dialogs & Pickers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Flutter ships with full Cupertino widget libraries — no plugins needed.',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),

                // 10. Cupertino Action Sheet & Alert Demo
                _buildNativeDialogButtons(),

                const SizedBox(height: 24),

                // 11. Cupertino Date Picker
                _buildCupertinoDatePicker(),

                const SizedBox(height: 24),

                // 12. Cupertino Search Bar
                const CupertinoSearchBarDemo(),

                const SizedBox(height: 24),

                // 13. Cupertino Context Menu
                const CupertinoContextMenuDemo(),

                const SizedBox(height: 32),

                // --- MATERIAL 3 ANDROID SHOWCASE ---

                const Text(
                  'Material 3 (Android Style)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Material 3 brings dynamic color, new components, and updated motion to Android.',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),

                // 14. Segmented Button
                const MaterialSegmentedButtonDemo(),

                const SizedBox(height: 24),

                // 15. Material 3 Card Variants
                _buildMaterial3Cards(),

                const SizedBox(height: 24),

                // 16. FAB Variants
                _buildFabVariants(),

                const SizedBox(height: 24),

                // 17. Material 3 Badges
                _buildBadgeDemo(),

                const SizedBox(height: 24),

                // 18. Bottom Sheet & Snackbar
                const MaterialDialogDemos(),

                const SizedBox(height: 24),

                // 19. Material 3 Text Fields
                const MaterialTextFieldDemo(),

                const SizedBox(height: 24),

                // 20. Material 3 Progress Indicators
                const MaterialProgressDemo(),

                const SizedBox(height: 100), // padding for scrolling
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // --- NEW UI METHODS ---

  // Neumorphic Button (Soft UI)
  Widget _buildNeumorphicButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
        boxShadow: [
          // Bottom right dark shadow
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(5, 5),
            blurRadius: 10,
          ),
          // Top left light shadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: const Icon(
        Icons.fingerprint,
        size: 40,
        color: Colors.deepPurpleAccent,
      ),
    );
  }

  // Beautiful Material 3 Accordion
  Widget _buildAccordionDemo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.white,
        child: Theme(
          // Removing the ugly default divider lines from ExpansionTile
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.rocket_launch, color: Colors.blue),
            ),
            title: const Text(
              'Why Developers Love Flutter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Tap to expand'),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade50,
                child: const Text(
                  'Because you can build beautifully complex, animated, and responsive UIs with just a few lines of Dart code, all while maintaining native 60fps performance.',
                  style: TextStyle(height: 1.5, color: Colors.black87),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // --- NATIVE LOOK DEMO WIDGETS ---

  Widget _buildNativeToggles() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('Material 3 (Android)', style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: 8),
              NativeSwitchDemo(isCupertino: false),
            ],
          ),
          Column(
            children: [
              Text('Cupertino (iOS)', style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: 8),
              NativeSwitchDemo(isCupertino: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNativeSliders() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Material 3 Slider', style: TextStyle(color: Colors.grey, fontSize: 12)),
          NativeSliderDemo(isCupertino: false),
          SizedBox(height: 16),
          Text('Cupertino Slider', style: TextStyle(color: Colors.grey, fontSize: 12)),
          NativeSliderDemo(isCupertino: true),
        ],
      ),
    );
  }

  Widget _buildCupertinoSegmentedControl() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('iOS Segmented Control', style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 12),
          NativeSegmentedControlDemo(),
        ],
      ),
    );
  }

  // --- LIQUID GLASS SHOWCASE ---
  Widget _buildLiquidGlassShowcase() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
      height: 420,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF667eea),
            Color(0xFF764ba2),
            Color(0xFFf093fb),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Background decorative circles for refraction effect
          Positioned(
            top: 20,
            left: 30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.15),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 20,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pinkAccent.withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 60,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withOpacity(0.2),
              ),
            ),
          ),

          // Liquid Glass Card
          Positioned(
            left: 16,
            right: 16,
            top: 24,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.25),
                        Colors.white.withOpacity(0.05),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.wb_sunny, color: Colors.white, size: 24),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weather',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Kuala Lumpur',
                                style: TextStyle(color: Colors.white70, fontSize: 13),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            '32°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Liquid Glass Pill Buttons
          Positioned(
            left: 16,
            right: 16,
            bottom: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLiquidGlassPill(Icons.home, 'Home'),
                _buildLiquidGlassPill(Icons.search, 'Search'),
                _buildLiquidGlassPill(Icons.person, 'Profile'),
              ],
            ),
          ),

          // Liquid Glass Tab Bar
          Positioned(
            left: 24,
            right: 24,
            bottom: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withOpacity(0.12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.apps, color: Colors.white, size: 22),
                      Icon(Icons.favorite_border, color: Colors.white70, size: 22),
                      Icon(Icons.camera_alt_outlined, color: Colors.white70, size: 22),
                      Icon(Icons.chat_bubble_outline, color: Colors.white70, size: 22),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildLiquidGlassPill(IconData icon, String label) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(0.15),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- MORE NATIVE WIDGETS ---

  Widget _buildNativeDialogButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          NativeActionSheetButton(),
          SizedBox(height: 12),
          NativeAlertDialogButton(),
        ],
      ),
    );
  }

  Widget _buildCupertinoDatePicker() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cupertino Date Picker', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (_) {},
            ),
          ),
        ],
      ),
    );
  }

  // --- MATERIAL 3 WIDGETS ---

  Widget _buildMaterial3Cards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Card Variants', style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 12),
        // Elevated Card
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const ListTile(
            leading: Icon(Icons.layers, color: Colors.deepPurple),
            title: Text('Elevated Card', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Default shadow elevation'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
        const SizedBox(height: 8),
        // Filled Card
        Card(
          elevation: 0,
          color: Colors.deepPurple.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const ListTile(
            leading: Icon(Icons.format_paint, color: Colors.deepPurple),
            title: Text('Filled Card', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Tonal surface color fill'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
        const SizedBox(height: 8),
        // Outlined Card
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: const ListTile(
            leading: Icon(Icons.crop_square, color: Colors.deepPurple),
            title: Text('Outlined Card', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Border outline, no shadow'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildFabVariants() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('FAB Variants', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              FloatingActionButton.small(
                heroTag: 'fab_small',
                onPressed: () {},
                backgroundColor: Colors.deepPurple,
                child: const Icon(Icons.add, color: Colors.white),
              ),
              FloatingActionButton(
                heroTag: 'fab_regular',
                onPressed: () {},
                backgroundColor: Colors.deepPurple.shade100,
                child: Icon(Icons.edit, color: Colors.deepPurple.shade700),
              ),
              FloatingActionButton.large(
                heroTag: 'fab_large',
                onPressed: () {},
                backgroundColor: Colors.deepPurple.shade50,
                child: Icon(Icons.navigation, color: Colors.deepPurple.shade700),
              ),
              FloatingActionButton.extended(
                heroTag: 'fab_extended',
                onPressed: () {},
                backgroundColor: Colors.deepPurple,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Create', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Badges & Icons', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Badge(
                    label: const Text('3'),
                    child: Icon(Icons.mail_outline, size: 32, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  const Text('Mail', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Badge(
                    label: const Text('99+'),
                    child: Icon(Icons.notifications_outlined, size: 32, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  const Text('Alerts', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Badge(
                    backgroundColor: Colors.green,
                    smallSize: 12,
                    child: Icon(Icons.chat_bubble_outline, size: 32, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  const Text('Online', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Badge(
                    label: const Text('!'),
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.system_update, size: 32, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  const Text('Update', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // A visually appealing card showing off shadows, gradients, and border radius
  Widget _buildGlassCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.credit_card, color: Colors.white, size: 32),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/1280px-Mastercard-logo.svg.png',
                height: 30,
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            '**** **** **** 1234',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Holder', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Text('TYLER TEH', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expires', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Text('12/28', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  // A grid showing how easy it is to do complex flexible layouts
  Widget _buildStatsGrid() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard('Active Users', '12.4K', Icons.people, Colors.orange),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard('Revenue', '\$45K', Icons.attach_money, Colors.green),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 16),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

// A widget to demonstrate implicit animations and Hot Reload
class AnimatedInteractiveBox extends StatefulWidget {
  const AnimatedInteractiveBox({super.key});

  @override
  State<AnimatedInteractiveBox> createState() => _AnimatedInteractiveBoxState();
}

class _AnimatedInteractiveBoxState extends State<AnimatedInteractiveBox> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutBack,
        height: _isExpanded ? 150 : 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _isExpanded ? Colors.pinkAccent : Colors.white,
          borderRadius: BorderRadius.circular(_isExpanded ? 30 : 12),
          border: Border.all(
            color: _isExpanded ? Colors.transparent : Colors.grey.shade300,
          ),
          boxShadow: _isExpanded
              ? [BoxShadow(color: Colors.pink.withOpacity(0.4), blurRadius: 20)]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          _isExpanded ? 'Tap to Shrink' : 'Tap to Expand (Built-in Animations!)',
          style: TextStyle(
            color: _isExpanded ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// --- NEW STATEFUL UI COMPONENT ---

class ModernFilterChips extends StatefulWidget {
  const ModernFilterChips({super.key});

  @override
  State<ModernFilterChips> createState() => _ModernFilterChipsState();
}

class _ModernFilterChipsState extends State<ModernFilterChips> {
  int _selectedIndex = 0;
  final List<String> _options = ['All', 'Mobile', 'Web', 'Desktop', 'Embedded'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _options.length,
      itemBuilder: (context, index) {
        final isSelected = _selectedIndex == index;
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ChoiceChip(
            label: Text(
              _options[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedColor: Colors.deepPurpleAccent,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            showCheckmark: false,
          ),
        );
      },
    );
  }
}

// --- NATIVE STATEFUL DEMOS (Material vs Cupertino) ---

class NativeSwitchDemo extends StatefulWidget {
  final bool isCupertino;
  const NativeSwitchDemo({super.key, required this.isCupertino});

  @override
  State<NativeSwitchDemo> createState() => _NativeSwitchDemoState();
}

class _NativeSwitchDemoState extends State<NativeSwitchDemo> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    if (widget.isCupertino) {
      return CupertinoSwitch(
        value: _value,
        activeColor: Colors.green, // Standard iOS green
        onChanged: (val) => setState(() => _value = val),
      );
    }
    return Switch(
      value: _value,
      onChanged: (val) => setState(() => _value = val),
    );
  }
}

class NativeSliderDemo extends StatefulWidget {
  final bool isCupertino;
  const NativeSliderDemo({super.key, required this.isCupertino});

  @override
  State<NativeSliderDemo> createState() => _NativeSliderDemoState();
}

class _NativeSliderDemoState extends State<NativeSliderDemo> {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    if (widget.isCupertino) {
      return CupertinoSlider(
        value: _value,
        min: 0,
        max: 100,
        onChanged: (val) => setState(() => _value = val),
      );
    }
    return Slider(
      value: _value,
      min: 0,
      max: 100,
      onChanged: (val) => setState(() => _value = val),
    );
  }
}

class CupertinoSearchBarDemo extends StatefulWidget {
  const CupertinoSearchBarDemo({super.key});

  @override
  State<CupertinoSearchBarDemo> createState() => _CupertinoSearchBarDemoState();
}

class _CupertinoSearchBarDemoState extends State<CupertinoSearchBarDemo> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cupertino Search Bar', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          CupertinoSearchTextField(
            controller: _controller,
            placeholder: 'Search Flutter widgets...',
            onChanged: (_) => setState(() {}),
          ),
          if (_controller.text.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...['CupertinoButton', 'CupertinoSlider', 'CupertinoSwitch', 'CupertinoDatePicker']
                .where((w) => w.toLowerCase().contains(_controller.text.toLowerCase()))
                .map((w) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.cube_box, size: 16, color: Colors.deepPurple),
                          const SizedBox(width: 8),
                          Text(w, style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    )),
          ],
        ],
      ),
    );
  }
}

class NativeActionSheetButton extends StatelessWidget {
  const NativeActionSheetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        color: CupertinoColors.activeBlue,
        borderRadius: BorderRadius.circular(12),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (ctx) => CupertinoActionSheet(
              title: const Text('Share this app'),
              message: const Text('Choose how you want to share this Flutter demo.'),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('AirDrop'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Messages'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Copy Link'),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel'),
              ),
            ),
          );
        },
        child: const Text('Show iOS Action Sheet'),
      ),
    );
  }
}

class NativeAlertDialogButton extends StatelessWidget {
  const NativeAlertDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        color: CupertinoColors.systemRed,
        borderRadius: BorderRadius.circular(12),
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
              title: const Text('Delete Item?'),
              content: const Text('This action cannot be undone. Are you sure you want to continue?'),
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel'),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Delete'),
                ),
              ],
            ),
          );
        },
        child: const Text('Show iOS Alert Dialog'),
      ),
    );
  }
}

class CupertinoContextMenuDemo extends StatelessWidget {
  const CupertinoContextMenuDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cupertino Context Menu', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          const Text(
            'Long-press the card below to see the native iOS context menu.',
            style: TextStyle(color: Colors.black54, fontSize: 13),
          ),
          const SizedBox(height: 12),
          Center(
            child: CupertinoContextMenu.builder(

              builder: (context, animation,) {
                return SizedBox(
                  height: 250,
                  width: 280,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                        ),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.touch_app, color: Colors.white, size: 32),
                          SizedBox(height: 8),
                          Text(
                            'Long Press Me',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              actions: [
                CupertinoContextMenuAction(
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                  isDefaultAction: true,
                  trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                  child: const Text('Copy'),
                ),
                CupertinoContextMenuAction(
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                  trailingIcon: CupertinoIcons.share,
                  child: const Text('Share'),
                ),
                CupertinoContextMenuAction(
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                  trailingIcon: CupertinoIcons.heart,
                  child: const Text('Favorite'),
                ),
                CupertinoContextMenuAction(
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                  isDestructiveAction: true,
                  trailingIcon: CupertinoIcons.delete,
                  child: const Text('Delete'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NativeSegmentedControlDemo extends StatefulWidget {
  const NativeSegmentedControlDemo({super.key});

  @override
  State<NativeSegmentedControlDemo> createState() => _NativeSegmentedControlDemoState();
}

class _NativeSegmentedControlDemoState extends State<NativeSegmentedControlDemo> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<int>(
      groupValue: _selectedValue,
      children: const {
        0: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Day')),
        1: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Week')),
        2: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Month')),
      },
      onValueChanged: (val) {
        if (val != null) {
          setState(() => _selectedValue = val);
        }
      },
    );
  }
}

// --- MATERIAL 3 STATEFUL WIDGETS ---

class MaterialSegmentedButtonDemo extends StatefulWidget {
  const MaterialSegmentedButtonDemo({super.key});

  @override
  State<MaterialSegmentedButtonDemo> createState() => _MaterialSegmentedButtonDemoState();
}

class _MaterialSegmentedButtonDemoState extends State<MaterialSegmentedButtonDemo> {
  Set<String> _selected = {'day'};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Segmented Button', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'day', label: Text('Day'), icon: Icon(Icons.calendar_view_day)),
                ButtonSegment(value: 'week', label: Text('Week'), icon: Icon(Icons.calendar_view_week)),
                ButtonSegment(value: 'month', label: Text('Month'), icon: Icon(Icons.calendar_view_month)),
              ],
              selected: _selected,
              onSelectionChanged: (val) => setState(() => _selected = val),
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Multi-Select', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: SegmentedButton<String>(
              multiSelectionEnabled: true,
              segments: const [
                ButtonSegment(value: 'shirt', label: Text('S'), icon: Icon(Icons.checkroom)),
                ButtonSegment(value: 'pants', label: Text('M')),
                ButtonSegment(value: 'shoes', label: Text('L')),
                ButtonSegment(value: 'hat', label: Text('XL')),
              ],
              selected: const {'shirt', 'pants'},
              onSelectionChanged: (_) {},
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialDialogDemos extends StatelessWidget {
  const MaterialDialogDemos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  builder: (ctx) => Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Share', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildShareOption(Icons.link, 'Link'),
                            _buildShareOption(Icons.email, 'Email'),
                            _buildShareOption(Icons.message, 'SMS'),
                            _buildShareOption(Icons.qr_code, 'QR'),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Done'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.vertical_align_bottom),
              label: const Text('Show Material Bottom Sheet'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('This is a Material 3 Snackbar'),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  ),
                );
              },
              child: const Text('Show Snackbar'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text('Material Date Picker'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              icon: const Icon(Icons.access_time),
              label: const Text('Material Time Picker'),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildShareOption(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.deepPurple.shade50,
          child: Icon(icon, color: Colors.deepPurple),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class MaterialTextFieldDemo extends StatefulWidget {
  const MaterialTextFieldDemo({super.key});

  @override
  State<MaterialTextFieldDemo> createState() => _MaterialTextFieldDemoState();
}

class _MaterialTextFieldDemoState extends State<MaterialTextFieldDemo> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Text Fields', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'hello@flutter.dev',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            obscureText: _obscure,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MaterialProgressDemo extends StatefulWidget {
  const MaterialProgressDemo({super.key});

  @override
  State<MaterialProgressDemo> createState() => _MaterialProgressDemoState();
}

class _MaterialProgressDemoState extends State<MaterialProgressDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Progress Indicators', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 16),
          const Text('Linear (Indeterminate)', style: TextStyle(fontSize: 13)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const LinearProgressIndicator(minHeight: 8),
          ),
          const SizedBox(height: 20),
          const Text('Linear (Determinate)', style: TextStyle(fontSize: 13)),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _controller.value,
                minHeight: 8,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(strokeWidth: 4),
                  ),
                  const SizedBox(height: 8),
                  Text('Loading', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                ],
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => Column(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator(
                        value: _controller.value,
                        strokeWidth: 4,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${(_controller.value * 100).toInt()}%',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
