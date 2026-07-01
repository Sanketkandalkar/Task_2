import 'package:flutter/material.dart';

class DateNowScreen extends StatelessWidget {
  const DateNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: 'Date ', style: TextStyle(color: Colors.black87)),
              TextSpan(text: 'Now', style: TextStyle(color: Color(0xFFE84C66))),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE84C66),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white, size: 14),
                  const SizedBox(width: 6),
                  const Text('My Plans', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Text('2', style: TextStyle(color: Color(0xFFE84C66), fontSize: 10, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(child: _buildTab('Today', isSelected: true)),
                const SizedBox(width: 8),
                Expanded(child: _buildTab('Tomorrow')),
                const SizedBox(width: 8),
                Expanded(child: _buildTab('Weekend')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Main Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c?q=80&w=2940&auto=format&fit=crop'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.1),
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.8),
                            Colors.black.withValues(alpha: 0.95),
                          ],
                          stops: const [0.0, 0.3, 0.7, 1.0],
                        ),
                      ),
                    ),
                    // Top badges
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              children: [
                                CircleAvatar(radius: 3, backgroundColor: Colors.white),
                                SizedBox(width: 6),
                                Text(
                                  'Live · Olive Bar, Mahalaxmi',
                                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.push_pin, color: Colors.red, size: 12),
                                const SizedBox(width: 6),
                                const Text(
                                  '3.4 km away',
                                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bottom Content
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _buildInfoPill(Icons.calendar_today, 'TODAY', isPink: true),
                                const SizedBox(width: 8),
                                _buildInfoPill(Icons.access_time, '8:30 PM'),
                                const SizedBox(width: 8),
                                _buildInfoPill(Icons.restaurant, 'Dinner'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Pasta & Honest Chats',
                              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Foodie looking for a dinner buddy 🍝',
                                  style: TextStyle(color: Colors.white70, fontSize: 14),
                                ),
                                Icon(Icons.flag_outlined, color: Colors.white.withValues(alpha: 0.5), size: 20),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _buildMatchPill('💜', '88% match'),
                                const SizedBox(width: 8),
                                _buildMatchPill('👥', 'Just 1'),
                                const SizedBox(width: 8),
                                _buildMatchPill('🤝', 'I\'ll pay'),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Profile Card
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                              ),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 24,
                                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Ananya, 25', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                            const SizedBox(width: 4),
                                            const Icon(Icons.check, color: Colors.white, size: 16),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        const Text('she/her · Foodie', style: TextStyle(color: Colors.white70, fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                  const Text('Profile →', style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold, fontSize: 14)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 24),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.close, color: Color(0xFFE84C66), size: 18),
                          SizedBox(width: 8),
                          Text('Skip', style: TextStyle(color: Color(0xFFE84C66), fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE84C66),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_today, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text('Request Date', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE84C66).withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? const Color(0xFFE84C66) : Colors.grey.withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFE84C66) : Colors.grey.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoPill(IconData icon, String text, {bool isPink = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isPink ? const Color(0xFFE84C66) : Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildMatchPill(String emoji, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
