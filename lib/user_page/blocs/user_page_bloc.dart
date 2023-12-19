import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/user_page/blocs/user_page_event.dart';
import 'package:myapp/user_page/blocs/user_page_state.dart';

class UserPageBloc extends Bloc<UserPageEvent, UserPageState> {
  UserPageBloc() : super(UserPageInitialState()) {
    on<UserPageTextChangedEvent>((event, emit) {
      if (event.phoneValue.length < 10) {
        emit(UserPageErrorState("please enter valid phone number"));
      } else if (EmailValidator.validate(event.emailValue) == false) {
        emit(UserPageErrorState("please enter the valid email adress"));
      } else {
        emit(UserPageValidState());
      }
    });

    on<UserPageSubmittedEvent>((event, emit) {
      emit(UserPageLoadingState());
    });
  }
}
