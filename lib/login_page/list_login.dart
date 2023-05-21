import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_akhir_tpm_teori/HomePage.dart';
import 'package:project_akhir_tpm_teori/login_page/Login.dart';
import 'package:project_akhir_tpm_teori/login_page/hiveType.dart';

class LoginList extends StatefulWidget {
  const LoginList({Key? key}) : super(key: key);

  @override
  State<LoginList> createState() => _LoginListState();
}

class _LoginListState extends State<LoginList> {
    @override
    void dispose() {
      Hive.close();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) {
            //       return LoginPage();
            //     }));
          },
        ),
      ),
      body: FutureBuilder(
        future: Hive.openBox("users"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('snapshot error'),
              );
            } else {
              var users = Hive.box("users");
              if (users.length == 0) {
                users.add(User('indra', 'indrawani'));
                users.add(User('iin', 'iinindra'));
              }
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  User user = users.getAt(index);
                  return Text(user.username + ' & ' + user.password);
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
