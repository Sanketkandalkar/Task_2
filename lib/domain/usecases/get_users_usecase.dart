import 'package:dating_app/domain/entities/user_entity.dart';
import 'package:dating_app/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<UserEntity>> call() async {
    return await repository.getUsers();
  }
}
