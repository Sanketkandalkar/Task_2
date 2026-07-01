import 'package:flutter/material.dart';

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
                _buildNotificationCard(
                  context: context,
                  imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
                  icon: Icons.favorite,
                  iconColor: Colors.white,
                  iconBgColor: const Color(0xFFE84C66),
                  titleText: 'Dev, 27 ',
                  titleSuffix: 'sent you a Rose',
                  message: '"Your trekking photos sold me — let\'s swap trail stories."',
                  time: '12 min ago',
                  actionText: 'View profile',
                  isUnread: true,
                ),
                _buildNotificationCard(
                  context: context,
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
                _buildNotificationCard(
                  context: context,
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
                _buildNotificationCard(
                  context: context,
                  imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
                  icon: Icons.chat_bubble_outline,
                  iconColor: Colors.white,
                  iconBgColor: const Color(0xFFE84C66),
                  titleText: 'Elena, 23 ',
                  titleSuffix: 'sent you a message',
                  message: '"Haha okay that café pick was elite. When are you free?"',
                  time: '1 h ago',
                  isUnread: true,
                ),
                _buildNotificationCard(
                  context: context,
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

  Widget _buildNotificationCard({
    required BuildContext context,
    String? imageUrl,
    IconData? icon,
    Color? iconColor,
    Color? iconBgColor,
    bool isCalendarEvent = false,
    required String titleText,
    String? titleBoldText,
    String? titleSuffix,
    required String message,
    bool messageItalic = true,
    required String time,
    String? actionText,
    bool isUnread = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar or Event Icon
              Stack(
                clipBehavior: Clip.none,
                children: [
                  if (isCalendarEvent)
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.calendar_today, color: Colors.orange),
                    )
                  else
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(imageUrl!),
                    ),
                  if (!isCalendarEvent && icon != null)
                    Positioned(
                      bottom: -4,
                      right: -4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: iconBgColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(icon, size: 12, color: iconColor),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black87, fontSize: 14, height: 1.3),
                        children: [
                          if (titleBoldText != null) ...[
                            TextSpan(text: titleText),
                            TextSpan(text: titleBoldText, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ] else ...[
                            TextSpan(text: titleText, style: const TextStyle(fontWeight: FontWeight.bold)),
                            if (titleSuffix != null) TextSpan(text: titleSuffix),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontStyle: messageItalic ? FontStyle.italic : FontStyle.normal,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (actionText != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE84C66),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          actionText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
          if (isUnread)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFE84C66),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
