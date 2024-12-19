import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/storage/hive_storage.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckLoginEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 3500));
      bool isLoggedIn = HiveStorage.getBoolValue('userBox', 'user_data');
      if (isLoggedIn) {
        emit(SplashAuthenticated());
      } else {
        emit(SplashUnauthenticated());
      }
    });
  }
}
