import 'package:flutter/material.dart';
import 'package:project_akhir_tpm_teori/login_page/Login.dart';
import 'package:project_akhir_tpm_teori/login_page/Register.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Menu Utama",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: Colors.orange,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          onTap: (value) {
            if (value == 1) {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => BantuanHalamanUtama()));
            } else if (value == 2) {
              AlertDialog alert = AlertDialog(
                title: Text("Logout"),
                content: Container(
                  child: Text("Apakah Anda Yakin Ingin Logout?"),
                ),
                actions: [
                  TextButton(
                    child: Text("Yes"),
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginPage()),
                      // );
                    },
                  ),
                  TextButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
              showDialog(context: context, builder: (context) => alert);;
            }
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Halaman Utama'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Keranjang'),
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              title: Text('Logout'),
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png',
                    width: 180,
                    height: 180,
                  ),
                  Text(
                    'Order Your Food',
                    style: TextStyle(fontSize: 25),
                  ),
                  buttonGetProduk(context),
                  buttonContact(context),
                  // buttonFavorite(context),
                ]),
          ),
        ]),
      ),
    );
  }
}

Widget buttonGetProduk(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 35),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return RegisterPage();
              }));
        },
        child: const Text('Register'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}

Widget buttonContact(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 0),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
        },
        child: const Text('Login'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}
