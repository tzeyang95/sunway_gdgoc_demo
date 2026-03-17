import 'package:flutter/material.dart';
import 'ui_showcase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDGoC Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const UiShowcasePage(), // The new beautiful UI page
    const StateDemoPage(),  // The previous State explanation page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.auto_awesome),
            label: 'Flexible UI',
          ),
          NavigationDestination(
            icon: Icon(Icons.memory),
            label: 'State Demo',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// THE PREVIOUS STATE DEMO (Moved here)
// ==========================================
class StateDemoPage extends StatefulWidget {
  const StateDemoPage({super.key});

  @override
  State<StateDemoPage> createState() => _StateDemoPageState();
}

class _StateDemoPageState extends State<StateDemoPage> {
  int yearsOfExperience = 1;

  void levelUp() {
    setState(() {
      yearsOfExperience++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless vs Stateful'),
        backgroundColor: Colors.blue.shade50,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UserProfileHeader(
              name: 'Tyler',
              role: 'Flutter Developer',
              experience: yearsOfExperience,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: levelUp,
              icon: const Icon(Icons.upgrade),
              label: const Text('Level Up Experience'),
            ),
            const SizedBox(height: 40),
            const Divider(endIndent: 50, indent: 50),
            const SizedBox(height: 40),
            const FollowButton(),
          ],
        ),
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final int experience;

  const UserProfileHeader({
    super.key,
    required this.name,
    required this.role,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://ui-avatars.com/api/?name=Tyler&background=02569B&color=fff&rounded=true&size=100'),
        ),
        const SizedBox(height: 20),
        Text(
          'Welcome back, $name!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        Text(
          '$role • $experience YOE',
          style: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: toggleFollow,
      icon: Icon(isFollowing ? Icons.check : Icons.person_add),
      label: Text(isFollowing ? 'Following' : 'Follow Tyler'),
      style: ElevatedButton.styleFrom(
        backgroundColor: isFollowing ? Colors.green : Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}