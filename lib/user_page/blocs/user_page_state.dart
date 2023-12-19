abstract class UserPageState {}

class UserPageInitialState extends UserPageState {}

class UserPageInvalidState extends UserPageState {}

class UserPageValidState extends UserPageState {}

class UserPageErrorState extends UserPageState {
  final String errorMessage;

  UserPageErrorState(this.errorMessage);
}

class UserPageLoadingState extends UserPageState {}
