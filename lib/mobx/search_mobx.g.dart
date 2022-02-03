// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Search on _SearchBase, Store {
  final _$valAtom = Atom(name: '_SearchBase.val');

  @override
  bool get val {
    _$valAtom.reportRead();
    return super.val;
  }

  @override
  set val(bool value) {
    _$valAtom.reportWrite(value, super.val, () {
      super.val = value;
    });
  }

  final _$tokenAtom = Atom(name: '_SearchBase.token');

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$keywordAtom = Atom(name: '_SearchBase.keyword');

  @override
  String get keyword {
    _$keywordAtom.reportRead();
    return super.keyword;
  }

  @override
  set keyword(String value) {
    _$keywordAtom.reportWrite(value, super.keyword, () {
      super.keyword = value;
    });
  }

  final _$onTapedAtom = Atom(name: '_SearchBase.onTaped');

  @override
  bool get onTaped {
    _$onTapedAtom.reportRead();
    return super.onTaped;
  }

  @override
  set onTaped(bool value) {
    _$onTapedAtom.reportWrite(value, super.onTaped, () {
      super.onTaped = value;
    });
  }

  final _$logoutAtom = Atom(name: '_SearchBase.logout');

  @override
  bool get logout {
    _$logoutAtom.reportRead();
    return super.logout;
  }

  @override
  set logout(bool value) {
    _$logoutAtom.reportWrite(value, super.logout, () {
      super.logout = value;
    });
  }

  final _$_SearchBaseActionController = ActionController(name: '_SearchBase');

  @override
  String setText(String text) {
    final _$actionInfo =
        _$_SearchBaseActionController.startAction(name: '_SearchBase.setText');
    try {
      return super.setText(text);
    } finally {
      _$_SearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validate(TextEditingController textEditingController) {
    final _$actionInfo =
        _$_SearchBaseActionController.startAction(name: '_SearchBase.validate');
    try {
      return super.validate(textEditingController);
    } finally {
      _$_SearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchFunc(
      TextEditingController textEditingController, BuildContext context) {
    final _$actionInfo = _$_SearchBaseActionController.startAction(
        name: '_SearchBase.searchFunc');
    try {
      return super.searchFunc(textEditingController, context);
    } finally {
      _$_SearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancel(BuildContext context) {
    final _$actionInfo =
        _$_SearchBaseActionController.startAction(name: '_SearchBase.cancel');
    try {
      return super.cancel(context);
    } finally {
      _$_SearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void contine(BuildContext context) {
    final _$actionInfo =
        _$_SearchBaseActionController.startAction(name: '_SearchBase.contine');
    try {
      return super.contine(context);
    } finally {
      _$_SearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login() {
    final _$actionInfo =
        _$_SearchBaseActionController.startAction(name: '_SearchBase.login');
    try {
      return super.login();
    } finally {
      _$_SearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showAlertDialog(BuildContext context) {
    final _$actionInfo = _$_SearchBaseActionController.startAction(
        name: '_SearchBase.showAlertDialog');
    try {
      return super.showAlertDialog(context);
    } finally {
      _$_SearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
val: ${val},
token: ${token},
keyword: ${keyword},
onTaped: ${onTaped},
logout: ${logout}
    ''';
  }
}
