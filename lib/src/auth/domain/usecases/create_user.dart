import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/auth_repository.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams> {
  CreateUser({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  ResultFutureVoid call(CreateUserParams params) async =>
      _repository.createUser(
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.name,
    required this.avatar,
  });

  factory CreateUserParams.empty() => const CreateUserParams(
        name: "",
        avatar: "",
      );

  final String name;
  final String avatar;

  @override
  List<Object?> get props => [name, avatar];
}
