import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/domain/entities/user_entity.dart';
import 'package:dating_app/presentation/pages/compliment_ideas_screen.dart';

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
          _buildPromptCard(context, 'My simple pleasures...', user.simplePleasures),
          const SizedBox(height: 32),
          _buildSectionTitle('INTERESTS & HOBBIES'),
          const SizedBox(height: 16),
          _buildInterests(user.interests),
          const SizedBox(height: 32),
          _buildSectionTitle('LIFESTYLE'),
          const SizedBox(height: 16),
          _buildLifestyle(user.lifestyle),
          const SizedBox(height: 32),
          _buildDatingGoalCard(user.datingGoalTitle, user.datingGoalDescription),
          const SizedBox(height: 32),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: user.largeImageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey[200]),
                errorWidget: (context, url, error) => Container(color: Colors.grey[200], child: const Icon(Icons.error)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildPromptCard(context, user.promptTwoTitle, user.promptTwoDescription),
          const SizedBox(height: 32),
          // Video Intro
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: user.largeImageUrl, // Using large image as placeholder for video thumbnail
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: Colors.grey[200]),
                    errorWidget: (context, url, error) => Container(color: Colors.grey[200], child: const Icon(Icons.error)),
                  ),
                  Container(
                    color: Colors.black26,
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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
                if (subtext != null)
                  Text(
                    subtext,
                    style: const TextStyle(
                      color: Colors.black38,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                  ),
              ],
            ),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFFE84C66),
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildPromptCard(BuildContext context, String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFE84C66),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Rose icon bottom left
          GestureDetector(
            onTap: () => _showComplimentBottomSheet(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: const Text('🌹', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  void _showComplimentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ComplimentBottomSheetWidget(),
    );
  }

  Widget _buildInterests(List<String> interests) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: interests.map((interest) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_border, size: 16, color: Color(0xFFE84C66)),
              const SizedBox(width: 8),
              Text(
                interest,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLifestyle(Map<String, String> lifestyle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: lifestyle.entries.map((entry) {
          final isLast = entry.key == lifestyle.keys.last;
          return Column(
            children: [
              _buildBasicRow(
                Icons.check_circle_outline, // generic icon, can be mapped specifically
                entry.key,
                entry.value,
              ),
              if (!isLast) _buildDivider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDatingGoalCard(String title, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFEE6580),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DATING GOAL',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class ComplimentBottomSheetWidget extends StatefulWidget {
  const ComplimentBottomSheetWidget({super.key});

  @override
  State<ComplimentBottomSheetWidget> createState() => _ComplimentBottomSheetWidgetState();
}

class _ComplimentBottomSheetWidgetState extends State<ComplimentBottomSheetWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isRoseSelected = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToComplimentIdeas() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ComplimentIdeasScreen()),
    );
    if (result != null && result is String) {
      setState(() {
        _controller.text = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF8F5F2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'COMPLIMENTING',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'About',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatPill(Icons.chat_bubble_outline, '3 comments'),
                _buildStatPill(null, '🌹 2 roses'),
                _buildStatPill(Icons.monetization_on, '5,258 balance', iconColor: Colors.amber),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.pink.withOpacity(0.3)),
              ),
              child: TextField(
                controller: _controller,
                maxLines: 3,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Write a sweet compliment...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _navigateToComplimentIdeas,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.withOpacity(0.2)),
                            ),
                            child: const Text('💡 Try', style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isRoseSelected = !_isRoseSelected;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _isRoseSelected ? const Color(0xFFE84C66).withOpacity(0.05) : Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: _isRoseSelected ? const Color(0xFFE84C66).withOpacity(0.3) : Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('🌹 Rose', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.check_circle, 
                            size: 16, 
                            color: _isRoseSelected ? const Color(0xFFE84C66) : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.card_giftcard, size: 16, color: Colors.orange),
                        SizedBox(width: 8),
                        Text('Select Gift', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${_controller.text.length}/140', style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.pink),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.favorite, color: Colors.pink, size: 20),
                      Text('Like', style: TextStyle(color: Colors.pink, fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('🌹 Rose + 💬 Comment sent! ✨ Opening chat...'),
                          backgroundColor: Colors.black87,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE84C66),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          _controller.text.isEmpty
                              ? 'Send Compliment'
                              : (_isRoseSelected ? 'Send 🌹 + 💬' : 'Send 💬'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatPill(IconData? icon, String text, {Color? iconColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: iconColor ?? Colors.grey),
            const SizedBox(width: 4),
          ],
          Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
