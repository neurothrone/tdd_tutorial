import 'package:flutter_test/flutter_test.dart';

import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:tdd_tutorial/src/auth/domain/repositories/auth_repository.dart';
import 'package:tdd_tutorial/src/auth/domain/usecases/create_user.dart';
import 'auth_repository.mock.dart';

void main() {
  late AuthRepository repository;
  late CreateUser useCase;

  setUp(() {
    repository = MockAuthRepo();
    useCase = CreateUser(repository: repository);
  });

  final params = CreateUserParams.empty();

  test(
    "should call the [AuthRepository.createUser]",
    () async {
      // Arrange
      when(
        () => repository.createUser(
          name: any(named: "name"),
          avatar: any(named: "avatar"),
        ),
      ).thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => repository.createUser(
          name: params.name,
          avatar: params.avatar,
        ),
      ).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
