// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_authentication_flow_builder_bloc/models/user_model.dart';
import 'package:flutter_authentication_flow_builder_bloc/repositories/repositories.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {

  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(authRepository.currentUser.isNotEmpty
            ? AppState.authenticated(authRepository.currentUser)
            : const AppState.unauthenticated(),) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogout>(_onLogout);
  }
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  FutureOr<void> _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated(),);
  }

  FutureOr<void> _onLogout(AppLogout event, Emitter<AppState> emit) {
    unawaited(_authRepository.logout());
  }
}
