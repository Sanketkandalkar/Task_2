import 'package:flutter/material.dart';
import 'package:dating_app/presentation/widgets/chat/date_invite_card.dart';
import 'package:dating_app/presentation/widgets/chat/message_bubble.dart';
import 'package:dating_app/presentation/widgets/chat/sent_gift_card.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          title: Row(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Aanya',
                        style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'PLATINUM',
                          style: TextStyle(color: Colors.amber, fontSize: 8, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Text('● Online', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.phone_outlined, color: Color(0xFFE84C66), size: 20),
                onPressed: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.videocam_outlined, color: Color(0xFFE84C66), size: 20),
                onPressed: () {},
              ),
            ),
            IconButton(icon: const Icon(Icons.more_vert, color: Colors.black87), onPressed: () {}),
          ],
        ),
      ),
      body: Column(
        children: [
          // Relationship Progress
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Color(0xFFF0EAE5))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'RELATIONSHIP PROGRESS',
                      style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                    ),
                    Text(
                      'LEVEL 5',
                      style: TextStyle(color: const Color(0xFFE84C66).withValues(alpha: 0.8), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.8,
                    backgroundColor: Colors.pink.withValues(alpha: 0.1),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFE84C66)),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        children: [
                          TextSpan(text: 'Milestone reached: '),
                          TextSpan(text: 'Premium Badge unlocked', style: TextStyle(color: Color(0xFFE84C66), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Actions
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildActionChip('🎁 Gifts', count: '12', isPink: true),
                _buildActionChip('💬 Compliments'),
                _buildActionChip('📅 Date Invites', count: '3'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Chat Area
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
              children: [
                const DateInviteCard(),
                const SizedBox(height: 24),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text('TODAY', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'You reacted to Aanya\'s About',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 8),
                const MessageBubble(
                  text: 'If you\'re as fun in person as your profile, I\'m in.',
                  time: '1:04 PM',
                  isMe: true,
                ),
                const SizedBox(height: 16),
                const SentGiftCard(),
              ],
            ),
          ),
          // Input Area
          Container(
            padding: const EdgeInsets.all(16).copyWith(bottom: 32),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFF0EAE5))),
            ),
            child: Row(
              children: [
                const Icon(Icons.add, color: Colors.grey),
                const SizedBox(width: 16),
                const Icon(Icons.image_outlined, color: Colors.grey),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F5F2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text('Message Aanya...', style: TextStyle(color: Colors.grey)),
                        ),
                        Icon(Icons.mic_none, color: Colors.grey, size: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE84C66),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send, color: Colors.white, size: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActionChip(String label, {String? count, bool isPink = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isPink ? const Color(0xFFE84C66) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isPink ? Colors.transparent : Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isPink ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          if (count != null) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isPink ? Colors.white.withValues(alpha: 0.3) : Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                count,
                style: TextStyle(
                  color: isPink ? Colors.white : Colors.black54,
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
