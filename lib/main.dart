import 'package:amasona_clone/Common/Widgets/buttom_bar.dart';
import 'package:amasona_clone/Constants/global_variables.dart';
import 'package:amasona_clone/Features/Admin/Screens/admin_screen.dart';
import 'package:amasona_clone/Features/Auth/Screens/auth_screen.dart';
import 'package:amasona_clone/Providers/user_provider.dart';
import 'package:amasona_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Features/Auth/Services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  Future<bool> getUser(context) async {
    final bool user = await authService.getUserDetail(context);
    if (user) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amasona Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Builder(
        builder: (BuildContext _) {
          return Scaffold(
            key: _scaffoldKey,
            body: FutureBuilder<bool>(
              future: getUser(_),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data &&
                    Provider.of<UserProvider>(context).user.token.isNotEmpty) {
                  return Provider.of<UserProvider>(context).user.type == 'user'
                      ? const BottomBar()
                      : const AdminScreen();
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return const AuthScreen();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
