import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'search_mobx.g.dart';

class Search = _SearchBase with _$Search;

abstract class _SearchBase with Store {
  @observable
  bool val = false;
  @observable
  String? token = '';
  @observable
  String keyword = "";
  @observable
  bool onTaped = false;
  @observable
  bool logout = false;
  @action
  String setText(String text) {
    return keyword = text;
  }

  @action
  String validate(TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty) {
      val = true;
      return "Пустое поле";
    } else {
      val = false;
      return null.toString();
    }
  }

  @action
  void searchFunc(
      TextEditingController textEditingController, BuildContext context) {
    setText(textEditingController.text);
    Navigator.pushNamed(context, '/second');
  }

  @action
  void cancel(BuildContext context) {
    Navigator.pop(context);
    onTaped = false;
    return;
  }

  @action
  void contine(BuildContext context) {
    Navigator.pop(context);
    logout = false;
    return;
  }

  @action
  void login() {
    logout = true;
    return;
  }

  // @action
  // Future createNewToken(BuildContext context) async {
  //   var result = await MovieApiProvider().getToken();
  //   token = result.requestToken;
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) =>const MainScreen(
  //       ),
  //     ),
  //   );
  // }

  @action
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Center(child: Text("Logout")),
      content: const Text("Are you sure you want to log out of your account?"),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: () {
            cancel(context);
          },
          child: const Text(
            'Cancel',
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        ElevatedButton(
            onPressed: () {
              contine(context);
            },
            child: const Text('Continue')),
      ],
    );
    if (!onTaped) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
