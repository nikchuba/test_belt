import 'package:dartz/dartz.dart';

import 'errors/error.dart';

typedef ErrorOr<T extends Object?> = Either<IError, T>;
