import 'package:flutter/material.dart';
import 'package:dating_app/domain/entities/user_entity.dart';

class UserProfileDetail extends StatelessWidget {
  final UserEntity user;

  const UserProfileDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: Color(0xFFF8F5F2), // Light beige background
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Extra tags section if needed (like the white pills in screenshot 4)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildWhiteTag('${user.matchPercentage}% Match', Colors.blueAccent),
              _buildWhiteTag('${user.trustPercentage}% Trust', Colors.greenAccent),
              _buildWhiteTag(user.replyTime, Colors.orangeAccent),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'ABOUT',
            style: TextStyle(
              color: Color(0xFFE84C66),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            user.about,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'THE BASICS',
            style: TextStyle(
              color: Color(0xFFE84C66),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildBasicRow(Icons.cake_outlined, 'Age', '${user.age} years old', subtext: 'Date of birth hidden'),
                _buildDivider(),
                _buildBasicRow(Icons.height, 'Height', user.height),
                _buildDivider(),
                _buildBasicRow(Icons.location_on_outlined, 'Lives in', user.city),
                _buildDivider(),
                _buildBasicRow(Icons.favorite_outline, 'Love language', 'Compliment', subtext: user.loveLanguage),
                _buildDivider(),
                _buildBasicRow(Icons.brightness_7_outlined, 'Religion', user.religion),
                _buildDivider(),
                _buildBasicRow(Icons.interests_outlined, 'Interested in', user.interestedIn),
                _buildDivider(),
                _buildBasicRow(Icons.wb_sunny_outlined, 'Zodiac', user.zodiac),
                _buildDivider(),
                _buildBasicRow(Icons.language_outlined, 'Mother tongue', user.motherTongue),
                _buildDivider(),
                _buildBasicRow(Icons.phone_in_talk_outlined, 'Communication style', user.communicationStyle, isLast: true),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Video Intro
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(user.largeImageUrl), // Using large image as placeholder for video thumbnail
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black26,
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow, size: 30, color: Colors.black),
                  ),
                ),
                const Positioned(
                  bottom: 12,
                  left: 12,
                  child: Text(
                    'Video intro • 0:28',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80), // Space for bottom button
        ],
      ),
    );
  }

  Widget _buildWhiteTag(String text, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 8, color: iconColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicRow(IconData icon, String label, String value, {String? subtext, bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: subtext != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFE84C66), size: 20),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),
          const Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subtext != null)
                Text(
                  subtext,
                  style: const TextStyle(
                    color: Colors.black38,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.withOpacity(0.2),
      height: 16,
    );
  }
}
