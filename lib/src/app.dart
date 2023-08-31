// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/ui/theme/app_theme.dart';
import 'core/utls/app_routes.dart';
import 'models/user_model.dart';
import 'pages/home/home_page.dart';
import 'pages/with_changer_notifier/controler/provider_controller.dart';
import 'pages/with_changer_notifier/with_changer_notifier_page.dart';
import 'pages/with_provider/with_provider_page.dart';

class MyApp extends StatefulWidget {
  final String title;
  const MyApp({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => const UserModel(
            name: 'Zoe Saldana',
            email: 'user2023@gmail.com',
            // imgAvatar: 'https://i.pravatar.cc/300',
            imgAvatar: 'https://yt3.googleusercontent.com/rY0nqXPcrDPkbmxVZk0ZjoZRCWIZjBY7Q2XsBzvr6Ca9WvCa4Z28yupewm-rHqiu3w6GVficDQ=s900-c-k-c0x00ffffff-no-rj',
            birthday: '01/01/2023',
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
          ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My APP',
        theme: MyAppTheme.themeData,
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (ctx) => HomePageApp(title: widget.title),
          'provider': (ctx) => const WithProviderPage(),
          'changer-notifier': (ctx) => const WithChangerNotifierPage(),
        },

        onGenerateRoute: (settings) {
          if (settings.name == '/alguma-coisa') {
            return null;
          } else if (settings.name == '/outra-coisa') {
            return null;
          } else {
            return MaterialPageRoute(builder: (_) {
              return HomePageApp(title: widget.title);
            });
          }
        },
        // funciona tipo fosse uma página 404
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (_) {
            return HomePageApp(title: widget.title);
          });
        },
      ),
    );
  }
}
