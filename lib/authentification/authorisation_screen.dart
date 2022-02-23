import 'package:flutter/material.dart';
import 'package:pokemons/authentification/registration_screen.dart';
import 'package:pokemons/ui/main_screen.dart';

class Authorisation extends StatelessWidget {
  const Authorisation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder textFieldBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
        title: const Text('Авторизация'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: SizedBox(
              //       height: 100,
              //       width: 100,
              //       child: Image.asset(
              //         'assets/kino.jpg',
              //       )),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              TextField(
                decoration: InputDecoration(
                  border: textFieldBorder,
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: textFieldBorder,
                  hintText: 'Пароль',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(3, 37, 65, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: 350,
                  child: const Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registration(),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    'Регистрация',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
