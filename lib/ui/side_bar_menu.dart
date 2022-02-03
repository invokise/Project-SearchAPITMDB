
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemons/constants/text_styles.dart';
import 'package:pokemons/main.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('xxx'), 
            accountEmail: const Text('xxx@gmail.com'),
            currentAccountPicture: Observer(builder: (context) {
              return !search.logout
                  ? ClipOval(
                      child: Container(
                        color: Colors.white,
                        child: TextButton(
                            onPressed: () {
                              search.login();
                            },
                            child: const Text(
                              'Login',
                              style: AppTextStyles.blueBold16,
                            ),),
                      ),
                    )
                  : ClipOval(
                      child: Image.asset(
                      'assets/prof.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),);
            }),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/sidebar.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              color: Colors.orange,
              size: 30,
            ),
            title: const Text("Account"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.add,
              color: Colors.orange,
              size: 30,
            ),
            title: const Text("Add Films"),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.red,
                size: 30,
              ),
              title: const Text("Logout"),
              onTap: () {
                search.showAlertDialog(context);
              },),
        ],
      ),
    );
  }
}
