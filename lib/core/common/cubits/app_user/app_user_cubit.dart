import 'package:first_pj/core/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(User? user) {
    if (user != null) {
      emit(AppUserLoggedIn(user: user));
    } else {
      emit(AppUserInitial());
    }
  }
}
