import 'package:flutter/material.dart';
import 'package:pokemons/authentification/authorisation_screen.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
        title: const Text(
          'Профиль',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const AccountWidget(),
    );
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: AvatarWidget(),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InformationAboutAccountWidget(
                information: 'Имя',
                data: 'Dio',
              ),
              SizedBox(
                height: 30,
              ),
              InformationAboutAccountWidget(
                information: 'E-mail',
                data: 'xxx@mail.ru',
              ),
              SizedBox(
                height: 30,
              ),
              InformationAboutAccountWidget(
                information: 'Пароль',
                data: '1234567',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Authorisation(),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.exit_to_app,
                  size: 27,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.5),
                  child: Text(
                    'Выйти',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: Image.asset('assets/main.jpg').image,
                radius: 34,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Аватар',
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Нажмите на картинку, чтобы сменить',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class InformationAboutAccountWidget extends StatelessWidget {
  final String information;
  final String data;

  const InformationAboutAccountWidget({
    required this.information,
    Key? key,
    this.data = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          information,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data,
        ),
      ],
    );
  }
}
