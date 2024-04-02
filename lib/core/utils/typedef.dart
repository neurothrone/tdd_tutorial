import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultFutureVoid = ResultFuture<void>;