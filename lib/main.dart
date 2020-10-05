import 'package:Solace/providers/register_providers.dart';
import 'package:Solace/theme/theme.dart';
import 'package:Solace/views/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Solace());
}

class Solace extends StatefulWidget {
  @override
  _SolaceState createState() => _SolaceState();
}

class _SolaceState extends State<Solace> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: registerProviders,
      child: MaterialApp(
        theme: themeData(context),
        home: Splash(),
      ),
    );
  }
}
