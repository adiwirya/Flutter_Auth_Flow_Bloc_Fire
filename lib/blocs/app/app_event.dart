// ignore_for_file: public_member_api_docs

part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogout extends AppEvent {}

class AppUserChanged extends AppEvent {
  const AppUserChanged({required this.user});

  final User user;
  
  @override
  List<Object> get props => [user];
}
