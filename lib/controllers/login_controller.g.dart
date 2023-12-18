// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  Computed<bool>? _$checkEmailComputed;

  @override
  bool get checkEmail =>
      (_$checkEmailComputed ??= Computed<bool>(() => super.checkEmail,
              name: 'LoginControllerBase.checkEmail'))
          .value;
  Computed<bool>? _$checkPasswordComputed;

  @override
  bool get checkPassword =>
      (_$checkPasswordComputed ??= Computed<bool>(() => super.checkPassword,
              name: 'LoginControllerBase.checkPassword'))
          .value;
  Computed<bool>? _$checkCaractersLenghtComputed;

  @override
  bool get checkCaractersLenght => (_$checkCaractersLenghtComputed ??=
          Computed<bool>(() => super.checkCaractersLenght,
              name: 'LoginControllerBase.checkCaractersLenght'))
      .value;
  Computed<bool>? _$passwordIsValidComputed;

  @override
  bool get passwordIsValid =>
      (_$passwordIsValidComputed ??= Computed<bool>(() => super.passwordIsValid,
              name: 'LoginControllerBase.passwordIsValid'))
          .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: 'LoginControllerBase.isValid'))
      .value;

  late final _$emailAtom =
      Atom(name: 'LoginControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
checkEmail: ${checkEmail},
checkPassword: ${checkPassword},
checkCaractersLenght: ${checkCaractersLenght},
passwordIsValid: ${passwordIsValid},
isValid: ${isValid}
    ''';
  }
}
