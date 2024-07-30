import 'package:first_pj/core/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/user.dart';
import '../../domain/usecases/current_user.dart';
import '../../domain/usecases/user_login.dart';
import '../../domain/usecases/user_sign_up.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;

  AuthBloc({
    required UserSignUp userSignup,
    required UserLogin userLogin,
    required CurrentUser currentUser,
  })  : _userSignUp = userSignup,
        _userLogin = userLogin,
        _currentUser = currentUser,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthCheckCurrentUser>(_onAuthCheckCurrentUser);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await _userSignUp(UserSignUpParams(
      name: event.name,
      email: event.email,
      password: event.password,
    ));
    response.fold(
      (failure) {
        emit(AuthFailure(message: failure.message));
      },
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await _userLogin(UserLoginParams(
      email: event.email,
      password: event.password,
    ));
    response.fold(
      (failure) {
        emit(AuthFailure(message: failure.message));
      },
      (user) {
        emit(AuthSuccess(user: user));
      },
    );
  }

  void _onAuthCheckCurrentUser(
      AuthCheckCurrentUser event, Emitter<AuthState> emit) async {
    final response = await _currentUser(NoParams());
    response.fold(
      (failure) {
        print('Failure');
        emit(AuthFailure(message: failure.message));
      },
      (user) {
        print('Success ${user.email}');
        emit(AuthSuccess(user: user));
      },
    );
  }
}
