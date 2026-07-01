import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:dating_app/presentation/bloc/home_bloc.dart';
import 'package:dating_app/presentation/bloc/home_event.dart';
import 'package:dating_app/presentation/bloc/home_state.dart';
import 'package:dating_app/presentation/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CardSwiperController controller = CardSwiperController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAppBar(),
        Expanded(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading || state is HomeInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.message}'),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(LoadUsers());
                        },
                        child: const Text('Retry'),
                      )
                    ],
                  ),
                );
              } else if (state is HomeLoaded) {
                if (state.users.isEmpty) {
                  return const Center(child: Text('No users found.'));
                }
                return CardSwiper(
                  controller: controller,
                  cardsCount: state.users.length,
                  onSwipe: (int previousIndex, int? currentIndex, CardSwiperDirection direction) {
                    return true;
                  },
                  numberOfCardsDisplayed: 3,
                  backCardOffset: const Offset(0, -20),
                  padding: const EdgeInsets.all(16.0),
                  cardBuilder: (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) {
                    return UserCard(user: state.users[index]);
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
            child: const Icon(Icons.menu, size: 20),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE84C66),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'Daily 25',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildAppBarIcon(Icons.bolt),
              const SizedBox(width: 8),
              _buildAppBarIcon(Icons.tune),
              const SizedBox(width: 8),
              _buildAppBarIcon(Icons.notifications_none, hasBadge: true),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAppBarIcon(IconData icon, {bool hasBadge = false}) {
    return Container(
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
      child: Stack(
        children: [
          Icon(icon, size: 20),
          if (hasBadge)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFE84C66),
                  shape: BoxShape.circle,
                ),
              ),
            )
        ],
      ),
    );
  }
}
