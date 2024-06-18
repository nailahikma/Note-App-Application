import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:possapp/data/datasource/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDataSource _authRemoteDataSource;
  LogoutBloc(
    this._authRemoteDataSource,
  ) : super(const _Initial()) {
    on<LogoutEvent>((event, emit) async {
      emit(const LogoutState.loading());
      final result = await _authRemoteDataSource.logout();
      result.fold(
        (l) => emit(LogoutState.error(l)),
        (r) => emit(const LogoutState.success()),
      );
    });
  }
}
