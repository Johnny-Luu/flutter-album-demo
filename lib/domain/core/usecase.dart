import 'package:equatable/equatable.dart';
import 'package:album_demo/domain/core/result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type>?> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
