import 'package:flutter/material.dart';
import 'package:dating_app/presentation/widgets/chat/new_match_item.dart';
import 'package:dating_app/presentation/widgets/chat/chat_list_item.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.settings_outlined, color: Colors.black87),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search matches or messages',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // New Matches Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'NEW MATCHES',
                  style: TextStyle(
                    color: Color(0xFFE84C66),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  'See all →',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                NewMatchItem(name: 'Sarah', imageUrl: 'https://randomuser.me/api/portraits/women/68.jpg', badgeText: 'NEW'),
                NewMatchItem(name: 'Ariya', imageUrl: 'https://randomuser.me/api/portraits/women/79.jpg', badgeIcon: Icons.card_giftcard),
                NewMatchItem(name: 'Liam', imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg'),
                NewMatchItem(name: 'Chloe', imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg', badgeIcon: Icons.favorite, isStory: true),
                NewMatchItem(name: 'Dev', imageUrl: 'https://randomuser.me/api/portraits/men/44.jpg'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip('All', isSelected: true),
                _buildFilterChip('Unread'),
                _buildFilterChip('Online'),
                _buildFilterChip('Nearby'),
                _buildFilterChip('Date'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Chat List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
              children: const [
                ChatListItem(
                  name: 'Aanya',
                  age: '25',
                  matchPercent: '92%',
                  message: 'Can\'t wait to see you tonight at the...',
                  time: '2m',
                  imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
                  unreadCount: 2,
                  isOnline: true,
                  progressVal: 0.7,
                  progressColor: Colors.green,
                  progressLabel: '🎁 Gift unlocked!',
                  progressLabelColor: Colors.green,
                ),
                ChatListItem(
                  name: 'Jordan',
                  age: '27',
                  matchPercent: '88%',
                  message: 'Typing...',
                  messageColor: Color(0xFFE84C66),
                  time: 'Now',
                  imageUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
                  isOnline: true,
                  progressVal: 0.5,
                  progressColor: Color(0xFFE84C66),
                  progressLabel: '18/25 for Premium Rose 🌹',
                ),
                ChatListItem(
                  name: 'Marcus',
                  age: '29',
                  matchPercent: '75%',
                  message: 'That sounds like an amazing hobby! Ho...',
                  time: '1h',
                  imageUrl: 'https://randomuser.me/api/portraits/men/78.jpg',
                  progressVal: 0.2,
                  progressColor: Color(0xFFE84C66),
                  progressLabel: '5/25 - Deadline 14h ⏰',
                ),
                ChatListItem(
                  name: 'Elena',
                  age: '23',
                  matchPercent: '95%',
                  message: 'You: Hey! I\'m heading over now.',
                  time: '3h',
                  imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
                  isOnline: true,
                  progressVal: 0.6,
                  progressColor: Color(0xFFE84C66),
                  progressLabel: '22/25 for Silver Ring 💍',
                ),
                ChatListItem(
                  name: 'Rohan',
                  age: '26',
                  matchPercent: '81%',
                  message: 'Sent a photo',
                  time: 'Yesterday',
                  imageUrl: 'https://randomuser.me/api/portraits/men/11.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE84C66) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? const Color(0xFFE84C66) : Colors.grey.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black54,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
