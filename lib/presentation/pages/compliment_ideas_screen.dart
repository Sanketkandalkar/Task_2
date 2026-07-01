import 'package:flutter/material.dart';

class ComplimentIdeasScreen extends StatefulWidget {
  const ComplimentIdeasScreen({super.key});

  @override
  State<ComplimentIdeasScreen> createState() => _ComplimentIdeasScreenState();
}

class _ComplimentIdeasScreenState extends State<ComplimentIdeasScreen> {
  final List<String> _categories = ['Sweet', 'Playful', 'Admiring', 'Flirty', 'Fire'];
  String _selectedCategory = 'Flirty';
  String? _selectedCompliment;

  final Map<String, List<String>> _compliments = {
    'Sweet': [
      'Your smile is absolutely contagious 😊',
      'You have the kind of warmth that makes people feel at home.',
      'There\'s something genuinely lovely about your energy.',
      'I could probably talk to you for hours and never get bored.',
      'You seem like the kind of person who makes ordinary days better.',
      'Your kindness really comes through in your profile.',
    ],
    'Flirty': [
      'Not gonna lie, your smile stopped my scroll 😍',
      'You\'re trouble, I can already tell — the good kind.',
      'If you\'re as fun in person as your profile, I\'m in.',
      'I think we\'d make a dangerously good team ☕️➡️🍷',
      'You\'ve got a vibe I can\'t quite look away from.',
      'Coffee, you, and good conversation — when\'s good for you?',
    ],
  };

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: _categories.map((category) {
          final isSelected = category == _selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
                _selectedCompliment = null; // reset selection on tab change
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFE84C66) : const Color(0xFFF5F0EB),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildComplimentList() {
    final list = _compliments[_selectedCategory] ?? _compliments['Sweet']!;
    return ListView.builder(
      padding: const EdgeInsets.all(24).copyWith(bottom: 100),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final compliment = list[index];
        final isSelected = compliment == _selectedCompliment;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedCompliment = compliment;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Compliment added ✨', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.black87,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.only(bottom: 80, left: 24, right: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFE84C66).withValues(alpha: 0.1) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? const Color(0xFFE84C66) : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: isSelected
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    compliment,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(left: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE84C66),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 16),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              // Icon and Titles
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline, size: 64, color: Colors.black87),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(radius: 3, backgroundColor: Colors.black87),
                            SizedBox(width: 4),
                            CircleAvatar(radius: 3, backgroundColor: Colors.black87),
                            SizedBox(width: 4),
                            CircleAvatar(radius: 3, backgroundColor: Colors.black87),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Compliment Ideas',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'pick one to make a great first impression',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _buildCategoryTabs(),
              const SizedBox(height: 24),
              Expanded(
                child: _buildComplimentList(),
              ),
            ],
          ),
          if (_selectedCompliment != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFFF8F5F2),
                      const Color(0xFFF8F5F2).withValues(alpha: 0.0),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    Navigator.pop(context, _selectedCompliment);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE84C66),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Use this compliment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
