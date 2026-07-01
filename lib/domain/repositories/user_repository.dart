import 'package:dating_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
