// import 'package:mobx/mobx.dart';

// part 'home_controller.g.dart';

// class HomeController = LoginControllerBase with _$HomeController;

// abstract class HomeControllerBase with Store {
//   // @observable
  // String email = '';
  // @observable
  // String password = '';

  // LoginControllerBase() {
  //   autorun((_) {
  //     print(isValid);
  //   });
  // }

  // @action
  // void setEmail(String value) => email = value;
  // @action
  // void setPassword(String value) => password = value;

  // @computed
  // bool get checkEmail => RegExp(
  //         r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$')
  //     .hasMatch(email);

  // @computed
  // bool get checkPassword =>
  //     RegExp(r'/^(?=.*\d)(?=.*[a-zA-Z])[\d\w]{2,20}$/').hasMatch(password);

  // @computed
  // bool get checkCaractersLenght => password.length >= 2;

  // @computed
  // bool get passwordIsValid => checkPassword && checkCaractersLenght;

  // @computed
  // bool get isValid => passwordIsValid && checkEmail;

  // @observable
  // String email = '';
  // @observable
  // String password = '';

  // @action
  // void setEmail(String value) => email = value;
  // @action
  // void setPassword(String value) => password = value;
  // @action
  // validatePassword(String text) {}

  // @action
  // validateEmail(String text) {}

  // @computed
  // bool get caractersLenght => password.length >= 2;
  // @computed
  // bool get isEmptyEmail => email.isEmpty;
// }
