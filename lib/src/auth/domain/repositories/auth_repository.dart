import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';

abstract interface class AuthRepository {
  ResultFutureVoid createUser({
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}
