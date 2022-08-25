// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_authentication_flow_builder_bloc/repositories/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepository) : super(SignupState.initial());
  
  final AuthRepository _authRepository;


  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  Future<void> signup() async {
    if (state.status == SignupStatus.submitting) {
      return;
    }
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      await _authRepository.signup(email: state.email, password: state.password);
      emit(state.copyWith(status: SignupStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SignupStatus.error));
    }
  }
}
