// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:user_session_manager_example/services/auth_service.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AuthService authService;
  AppBloc({required this.authService}) : super(AppInitial()) {
    on<AppStarted>((event, emit) async {
      if (authService.isCompleteOnboarding()) {
        if (await authService.isAuthenticated()) {
          emit(Authenticated());
        } else {
          emit(UnAuthenticated());
        }
      } else {
        emit(ShowOnboarding());
      }
    });
  }
}
