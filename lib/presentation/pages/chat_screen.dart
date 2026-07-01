import 'package:flutter/material.dart';
import 'package:dating_app/presentation/pages/chat_detail_screen.dart';

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
              children: [
                _buildNewMatchItem('Sarah', 'https://randomuser.me/api/portraits/women/68.jpg', badgeText: 'NEW'),
                _buildNewMatchItem('Ariya', 'https://randomuser.me/api/portraits/women/79.jpg', badgeIcon: Icons.card_giftcard),
                _buildNewMatchItem('Liam', 'https://randomuser.me/api/portraits/men/32.jpg'),
                _buildNewMatchItem('Chloe', 'https://randomuser.me/api/portraits/women/44.jpg', badgeIcon: Icons.favorite, isStory: true),
                _buildNewMatchItem('Dev', 'https://randomuser.me/api/portraits/men/44.jpg'),
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
              children: [
                _buildChatListItem(
                  context: context,
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
                _buildChatListItem(
                  context: context,
                  name: 'Jordan',
                  age: '27',
                  matchPercent: '88%',
                  message: 'Typing...',
                  messageColor: const Color(0xFFE84C66),
                  time: 'Now',
                  imageUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
                  isOnline: true,
                  progressVal: 0.5,
                  progressColor: const Color(0xFFE84C66),
                  progressLabel: '18/25 for Premium Rose 🌹',
                ),
                _buildChatListItem(
                  context: context,
                  name: 'Marcus',
                  age: '29',
                  matchPercent: '75%',
                  message: 'That sounds like an amazing hobby! Ho...',
                  time: '1h',
                  imageUrl: 'https://randomuser.me/api/portraits/men/78.jpg',
                  progressVal: 0.2,
                  progressColor: const Color(0xFFE84C66),
                  progressLabel: '5/25 - Deadline 14h ⏰',
                ),
                _buildChatListItem(
                  context: context,
                  name: 'Elena',
                  age: '23',
                  matchPercent: '95%',
                  message: 'You: Hey! I\'m heading over now.',
                  time: '3h',
                  imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
                  isOnline: true,
                  progressVal: 0.6,
                  progressColor: const Color(0xFFE84C66),
                  progressLabel: '22/25 for Silver Ring 💍',
                ),
                _buildChatListItem(
                  context: context,
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

  Widget _buildNewMatchItem(String name, String imageUrl, {String? badgeText, IconData? badgeIcon, bool isStory = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: isStory ? Border.all(color: const Color(0xFFE84C66), width: 2) : null,
                  gradient: !isStory && badgeText == 'NEW'
                      ? const LinearGradient(colors: [Colors.blue, Colors.pink])
                      : null,
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              if (badgeText != null)
                Positioned(
                  top: -5,
                  right: -10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE84C66),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Text(
                      badgeText,
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              if (badgeIcon != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE84C66),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(badgeIcon, color: Colors.white, size: 12),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
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

  Widget _buildChatListItem({
    required BuildContext context,
    required String name,
    required String age,
    required String matchPercent,
    required String message,
    Color? messageColor,
    required String time,
    required String imageUrl,
    int unreadCount = 0,
    bool isOnline = false,
    double? progressVal,
    Color? progressColor,
    String? progressLabel,
    Color? progressLabelColor,
  }) {
    return GestureDetector(
      onTap: () {
        if (name == 'Aanya') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatDetailScreen()));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                if (isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '$name, $age',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE84C66).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              matchPercent + ' Match',
                              style: const TextStyle(color: Color(0xFFE84C66), fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          message,
                          style: TextStyle(
                            color: messageColor ?? Colors.black54,
                            fontSize: 14,
                            fontWeight: unreadCount > 0 ? FontWeight.bold : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE84C66),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            unreadCount.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                  if (progressVal != null) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: progressVal,
                              backgroundColor: Colors.grey.withValues(alpha: 0.2),
                              valueColor: AlwaysStoppedAnimation<Color>(progressColor ?? const Color(0xFFE84C66)),
                              minHeight: 4,
                            ),
                          ),
                        ),
                        if (progressLabel != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            progressLabel,
                            style: TextStyle(
                              color: progressLabelColor ?? Colors.grey.shade600,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
