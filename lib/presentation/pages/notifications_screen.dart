import 'package:flutter/material.dart';
import 'package:dating_app/presentation/widgets/notifications/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '9 new updates',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                'Mark all read',
                style: TextStyle(
                  color: const Color(0xFFE84C66).withValues(alpha: 0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Filter Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _buildFilterChip('All', isSelected: true, count: 56),
                _buildFilterChip('Likes & roses'),
                _buildFilterChip('Matches'),
                _buildFilterChip('Gifts'),
                _buildFilterChip('Dates'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'TODAY',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Notification List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 40),
              children: [
                const NotificationCard(
                  imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
                  icon: Icons.favorite,
                  iconColor: Colors.white,
                  iconBgColor: Color(0xFFE84C66),
                  titleText: 'Dev, 27 ',
                  titleSuffix: 'sent you a Rose',
                  message: '"Your trekking photos sold me — let\'s swap trail stories."',
                  time: '12 min ago',
                  actionText: 'View profile',
                  isUnread: true,
                ),
                NotificationCard(
                  imageUrl: 'https://randomuser.me/api/portraits/men/44.jpg',
                  icon: Icons.chat_bubble_outline,
                  iconColor: Colors.white,
                  iconBgColor: Colors.amber[700]!,
                  titleText: 'Arjun, 28 ',
                  titleSuffix: 'complimented your About',
                  message: '"Equally driven and equally curious — that line got me."',
                  time: '3 h ago',
                  isUnread: false,
                ),
                const NotificationCard(
                  imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
                  icon: Icons.check,
                  iconColor: Colors.white,
                  iconBgColor: Colors.green,
                  titleText: 'It\'s a match with ',
                  titleBoldText: 'Aanya, 25',
                  message: 'You both liked each other. Say hello before the spark fades.',
                  messageItalic: false,
                  time: '40 min ago',
                  actionText: 'Send a message',
                  isUnread: true,
                ),
                const NotificationCard(
                  imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
                  icon: Icons.chat_bubble_outline,
                  iconColor: Colors.white,
                  iconBgColor: Color(0xFFE84C66),
                  titleText: 'Elena, 23 ',
                  titleSuffix: 'sent you a message',
                  message: '"Haha okay that café pick was elite. When are you free?"',
                  time: '1 h ago',
                  isUnread: true,
                ),
                const NotificationCard(
                  isCalendarEvent: true,
                  titleText: 'Kabir ',
                  titleSuffix: 'approved your date request',
                  message: 'Coffee at Blue Tokai · Today, 7:00 PM · Koregaon Park',
                  messageItalic: false,
                  time: '2 h ago',
                  actionText: 'Open chat',
                  isUnread: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false, int? count}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black87 : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.black87 : Colors.grey.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          if (count != null) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
