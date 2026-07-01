import 'dart:math';

import 'package:dating_app/data/datasources/user_remote_data_source.dart';
import 'package:dating_app/domain/entities/user_entity.dart';
import 'package:dating_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<UserEntity>> getUsers() async {
    final models = await remoteDataSource.getUsers();
    final random = Random();
    
    return models.map((model) {
      return UserEntity(
        id: model.id,
        firstName: model.firstName,
        lastName: model.lastName,
        fullName: '${model.firstName} ${model.lastName}',
        age: model.age,
        city: model.city,
        country: model.country,
        profileImageUrl: model.profileImageUrl,
        largeImageUrl: model.largeImageUrl,
        // Generate mock data for the rest
        matchPercentage: 70 + random.nextInt(29), // 70 to 98
        trustPercentage: 80 + random.nextInt(20), // 80 to 99
        replyTime: '~5m Reply',
        jobTitle: 'Content Creator', // Just mocking a static for now
        height: "5'5\\\" (165 cm)",
        relationshipGoal: 'Serious relationship',
        about: 'Building products by day, planning my next trek by night. Looking for someone equally driven and equally curious.',
        loveLanguage: 'Words of affirmation',
        religion: 'Hindu-Marathi',
        interestedIn: 'Women - Dating',
        zodiac: 'Scorpio',
        motherTongue: 'Marathi',
        communicationStyle: 'Phone calls over texts',
        videoIntroUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      );
    }).toList();
  }
}
