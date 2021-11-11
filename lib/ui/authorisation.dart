import 'package:flutter/material.dart';



class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Click to go in account'),
            ElevatedButton(
                onPressed: () {
                  // search.createNewToken(context);
                },
                child: const Text('Create')),
          ],
        ),
      ),
    );
  }
}
