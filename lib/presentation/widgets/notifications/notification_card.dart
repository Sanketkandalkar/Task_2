import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String? imageUrl;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBgColor;
  final bool isCalendarEvent;
  final String titleText;
  final String? titleBoldText;
  final String? titleSuffix;
  final String message;
  final bool messageItalic;
  final String time;
  final String? actionText;
  final bool isUnread;

  const NotificationCard({
    super.key,
    this.imageUrl,
    this.icon,
    this.iconColor,
    this.iconBgColor,
    this.isCalendarEvent = false,
    required this.titleText,
    this.titleBoldText,
    this.titleSuffix,
    required this.message,
    this.messageItalic = true,
    required this.time,
    this.actionText,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
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
                          actionText!,
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
