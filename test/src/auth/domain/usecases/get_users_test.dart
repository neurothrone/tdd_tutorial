import 'package:flutter_test/flutter_test.dart';

import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:tdd_tutorial/src/auth/domain/entities/user.dart';
import 'package:tdd_tutorial/src/auth/domain/repositories/auth_repository.dart';
import 'package:tdd_tutorial/src/auth/domain/usecases/get_users.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthRepository repository;
  late GetUsers useCase;

  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUsers(repository: repository);
  });

  final testResponse = [User.empty()];

  test(
    "should call [AuthRepository.getUsers] and return [List<User>]",
    () async {
      // Arrange
      when(() => repository.getUsers()).thenAnswer(
        (_) async => Right(testResponse),
      );
      // Act
      final result = await useCase();
      // Assert
      expect(result, equals(Right<dynamic, List<User>>(testResponse)));
      verify(() => repository.getUsers()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
