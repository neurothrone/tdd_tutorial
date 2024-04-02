import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetUsers extends UseCaseWithoutParams<List<User>> {
  GetUsers({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
