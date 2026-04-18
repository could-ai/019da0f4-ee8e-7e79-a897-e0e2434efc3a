import 'package:flutter/material.dart';

void main() {
  runApp(const PamphletApp());
}

class PamphletApp extends StatelessWidget {
  const PamphletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oasis Retreat Pamphlet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C5E50),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Serif', fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontFamily: 'Serif', fontWeight: FontWeight.bold),
        ),
      ),
      home: const PamphletHomePage(),
    );
  }
}

class PamphletHomePage extends StatefulWidget {
  const PamphletHomePage({super.key});

  @override
  State<PamphletHomePage> createState() => _PamphletHomePageState();
}

class _PamphletHomePageState extends State<PamphletHomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              CoverPage(),
              AboutPage(),
              HighlightsPage(),
              ContactPage(),
            ],
          ),
          // Page Indicator
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Navigation Arrows
          if (_currentPage < 3)
            Positioned(
              right: 16,
              bottom: 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ),
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          if (_currentPage > 0)
            Positioned(
              left: 16,
              bottom: 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1540541338287-41700207dee6?q=80&w=2000&auto=format&fit=crop',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'OASIS\nRETREAT',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      letterSpacing: 8,
                      height: 1.2,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'Discover your perfect escape in the heart of nature.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SWIPE TO OPEN',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      letterSpacing: 2,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white.withOpacity(0.8),
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F7F1),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Welcome to',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 2,
                    ),
              ),
              Text(
                'Paradise',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: const Color(0xFF2C5E50),
                    ),
              ),
              const SizedBox(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=1200&auto=format&fit=crop',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Nestled away from the noise of the city, Oasis Retreat offers an unparalleled experience of tranquility and luxury. Our sanctuary is designed to help you reconnect with nature and rejuvenate your spirit.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'From world-class dining to bespoke wellness programs, every detail is crafted to ensure your stay is nothing short of magical.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 80), // Space for bottom indicators
            ],
          ),
        ),
      ),
    );
  }
}

class HighlightsPage extends StatelessWidget {
  const HighlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 48, 32, 24),
              child: Text(
                'Experiences',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF2C5E50),
                    ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildHighlightCard(
                    context,
                    'Tranquil Spa',
                    'Holistic treatments to restore your balance.',
                    'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?q=80&w=800&auto=format&fit=crop',
                  ),
                  _buildHighlightCard(
                    context,
                    'Fine Dining',
                    'Locally sourced ingredients, crafted by master chefs.',
                    'https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c?q=80&w=800&auto=format&fit=crop',
                  ),
                  _buildHighlightCard(
                    context,
                    'Nature Trails',
                    'Explore miles of pristine wilderness.',
                    'https://images.unsplash.com/photo-1473448912268-2022ce9509d8?q=80&w=800&auto=format&fit=crop',
                  ),
                  const SizedBox(height: 80), // Space for bottom indicators
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightCard(BuildContext context, String title, String subtitle, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2C5E50),
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black54,
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

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2C5E50),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Icon(
                Icons.wb_sunny_outlined,
                size: 64,
                color: Colors.white.withOpacity(0.9),
              ),
              const SizedBox(height: 32),
              Text(
                'Plan Your\nVisit',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      height: 1.2,
                    ),
              ),
              const SizedBox(height: 48),
              _buildContactRow(Icons.location_on, '123 Serenity Lane, Mountain View'),
              const SizedBox(height: 16),
              _buildContactRow(Icons.phone, '+1 (555) 123-4567'),
              const SizedBox(height: 16),
              _buildContactRow(Icons.email, 'reservations@oasisretreat.example.com'),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF2C5E50),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'BOOK YOUR STAY',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
