abstract class UserPageEvent {}

class UserPageTextChangedEvent extends UserPageEvent {
  final String phoneValue;
  final String emailValue;

  UserPageTextChangedEvent(this.phoneValue, this.emailValue);
}

class UserPageSubmittedEvent extends UserPageEvent {
  final String phone;
  final String email;

  UserPageSubmittedEvent(this.phone, this.email);
}
