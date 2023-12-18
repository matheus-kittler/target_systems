import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  String email = '';
  @observable
  String password = '';

  LoginControllerBase() {
    autorun((_) {
      print(isValid);
    });
  }

  @action
  void setEmail(String value) => email = value;
  @action
  void setPassword(String value) => password = value;

  @computed
  bool get checkEmail => RegExp(
          r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$')
      .hasMatch(email);

  @computed
  bool get checkPassword =>
      RegExp(r'/^(?=.*\d)(?=.*[a-zA-Z])[\d\w]{2,20}$/').hasMatch(password);

  @computed
  bool get checkCaractersLenght => password.length >= 2;

  @computed
  bool get passwordIsValid => checkPassword && checkCaractersLenght;

  @computed
  bool get isValid => passwordIsValid && checkEmail;
}
