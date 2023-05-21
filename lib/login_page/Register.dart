import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_akhir_tpm_teori/HomePage.dart';
// import 'package:project_akhir_tpm_teori/login_page/hiveType.dart';
import 'package:project_akhir_tpm_teori/login_page/list_login.dart';
import 'hiveType.dart';
import 'package:hive/hive.dart';

TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late Box<User> userBox; // Declare the userBox variable

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    openHiveBox(); // Call the method to open the box
  }

  Future<void> openHiveBox() async {
    await Hive.openBox<User>("users"); // Open the box
    userBox = Hive.box<User>("users"); // Assign the box to the variable
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      final userBox = Hive.box<User>('users');
      final existingUser = userBox.values.any(
            (user) => user.username == username,
      );

      if (existingUser == true) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Username Already Exists'),
            content: Text('Please choose a different username.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }

      final newUser = User(username, password);

      await userBox.add(newUser);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registration Successful'),
          content: Text('You have been successfully registered.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return HalamanUtama();
                }));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await _registerUser(); // Pass the context to the method
                },
                child: Text('Register'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                        return LoginList();
                      }));
                },
                child: Text('back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}