import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:album_demo/presentation/base/bloc/base_event.dart';
import 'package:album_demo/domain/core/result.dart';

import 'base_state.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  BaseBloc(S state) : super(state) {
    on<E>(handleEvent);
  }

  Future<void> handleEvent(E event, Emitter<S> emit);

  Future<void> makeApiRequest<T>(
    Emitter<S> emit, {
    required Future<Result<T>?> callToHost,
    required Function(Emitter<S> emit, T? data) success,
    required Function(Emitter<S> emit, String message) error,
    Function(Emitter<S> emit)? loading,
  }) async {
    if (loading != null) {
      loading.call(emit);
    }

    (await callToHost)?.when(
      success: (data) async {
        await success.call(emit, data);
      },
      error: (type, message) async {
        await error.call(emit, message);
      },
    );
  }
}
