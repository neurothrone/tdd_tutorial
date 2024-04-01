import '../entities/user.dart';

abstract interface class AuthRepository {
  Future<void> createUser({
    required String name,
    required String avatar,
  });

  Future<List<User>> fetchUsers();
}
