import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Home screen for user sign in
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.deepPurpleAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.deepPurpleAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
            ),
            onPressed: () {
              if (passwordController.text == "12345") {
                context.go("/signin",
                    extra: usernameController.text); //Navigate to sign in page
              } else {
                //Show error message in snackbar in case of password not matching 12345
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Invalid password")),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
