part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

final class AppStarted extends AppEvent {}

final class Login extends AppEvent {}

final class Register extends AppEvent {}

final class Logout extends AppEvent {}

final class CompleteOnboarding extends AppEvent{}

