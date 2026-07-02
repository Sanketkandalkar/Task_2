import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String fullName;
  final int age;
  final String city;
  final String state;
  final String country;
  final String profileImageUrl;
  final String largeImageUrl;
  
  // Mocked fields for UI
  final int matchPercentage;
  final int trustPercentage;
  final String replyTime;
  final String jobTitle;
  final String height;
  final String relationshipGoal;
  final String about;
  final String loveLanguage;
  final String religion;
  final String interestedIn;
  final String zodiac;
  final String motherTongue;
  final String communicationStyle;
  final String videoIntroUrl;

  // New fields for extended profile
  final String simplePleasures;
  final List<String> interests;
  final Map<String, String> lifestyle;
  final String datingGoalTitle;
  final String datingGoalDescription;
  final String promptTwoTitle;
  final String promptTwoDescription;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.age,
    required this.city,
    required this.state,
    required this.country,
    required this.profileImageUrl,
    required this.largeImageUrl,
    required this.matchPercentage,
    required this.trustPercentage,
    required this.replyTime,
    required this.jobTitle,
    required this.height,
    required this.relationshipGoal,
    required this.about,
    required this.loveLanguage,
    required this.religion,
    required this.interestedIn,
    required this.zodiac,
    required this.motherTongue,
    required this.communicationStyle,
    required this.videoIntroUrl,
    required this.simplePleasures,
    required this.interests,
    required this.lifestyle,
    required this.datingGoalTitle,
    required this.datingGoalDescription,
    required this.promptTwoTitle,
    required this.promptTwoDescription,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        fullName,
        age,
        city,
        state,
        country,
        profileImageUrl,
        largeImageUrl,
        matchPercentage,
        trustPercentage,
        replyTime,
        jobTitle,
        height,
        relationshipGoal,
        about,
        loveLanguage,
        religion,
        interestedIn,
        zodiac,
        motherTongue,
        communicationStyle,
        videoIntroUrl,
        simplePleasures,
        interests,
        lifestyle,
        datingGoalTitle,
        datingGoalDescription,
        promptTwoTitle,
        promptTwoDescription,
      ];
}
