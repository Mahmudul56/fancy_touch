import 'package:flutter/material.dart';
import 'package:fancy_touch/src/config/route.dart';
import 'package:fancy_touch/src/pages/mainPage.dart';
import 'package:fancy_touch/src/pages/product_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name!.contains('detail')) {
          return MaterialPageRoute(builder: (context)=>ProductDetailPage());
        } else {
          return MaterialPageRoute(builder: (context)=>MainPage(title: '',));
        }
      },
      initialRoute: "MainPage",
    );
  }
}
