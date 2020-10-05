import 'package:Solace/providers/sign_in_provider.dart';
import 'package:Solace/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final registerProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => SignUpProvider()),
  ChangeNotifierProvider(create: (_) => SignInProvider()),
];
