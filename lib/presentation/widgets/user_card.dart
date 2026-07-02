import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/presentation/bloc/home_bloc.dart';
import 'package:dating_app/presentation/bloc/home_event.dart';
import 'package:dating_app/domain/entities/user_entity.dart';
import 'package:dating_app/presentation/widgets/user_profile_detail.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        color: const Color(0xFFF8F5F2), // Light beige for the scrollable part
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image and overlay
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: user.largeImageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                        // Gradient from bottom
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 250,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.9),
                                  Colors.black.withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // User Info Overlay
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  _buildTag('${user.matchPercentage}% Match', Colors.blue, Icons.circle, iconColor: Colors.blueAccent),
                                  const SizedBox(width: 8),
                                  _buildTag('${user.trustPercentage}% Trust', Colors.green, Icons.circle, iconColor: Colors.greenAccent),
                                  const SizedBox(width: 8),
                                  _buildTag(user.replyTime, Colors.orange, Icons.circle, iconColor: Colors.orangeAccent),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    user.firstName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${user.age}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.verified, color: Colors.pinkAccent, size: 20),
                                ],
                              ),
                              const SizedBox(height: 8),
                              _buildInfoRow(Icons.location_on_outlined, '${user.city}, ${user.state} - 7 km away'),
                              const SizedBox(height: 4),
                              _buildInfoRow(Icons.work_outline, '${user.jobTitle} • ${user.height}'),
                              const SizedBox(height: 4),
                              _buildInfoRow(Icons.favorite_border, user.relationshipGoal),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Scrollable Details
                  UserProfileDetail(user: user),
                ],
              ),
            ),
            // Floating Rose Button
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: const Center(
                  child: Text('🌹', style: TextStyle(fontSize: 28)),
                ),
              ),
            ),
            // Top refresh/menu icons on the card
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  context.read<HomeBloc>().add(RefreshUsers());
                },
                child: _buildCardIconButton(Icons.refresh),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: _buildCardIconButton(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: Colors.black87),
    );
  }

  Widget _buildTag(String text, Color bgColor, IconData icon, {Color? iconColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: iconColor ?? Colors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
