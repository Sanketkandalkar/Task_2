import 'package:flutter/material.dart';

class NewMatchItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String? badgeText;
  final IconData? badgeIcon;
  final bool isStory;

  const NewMatchItem({
    super.key,
    required this.name,
    required this.imageUrl,
    this.badgeText,
    this.badgeIcon,
    this.isStory = false,
  });

  @override
  Widget build(BuildContext context) {
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
                      color: badgeText == 'NEW' ? const Color(0xFFE84C66) : const Color(0xFFD6A054),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Text(
                      badgeText!,
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
}
