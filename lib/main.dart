import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_brain/provider/theme_model.dart';
import 'package:training_brain/screens/home_screen.dart';
import 'package:training_brain/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyTheme.loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: Selector<ThemeModel, ThemeData>(
        selector: (p0, p1) => p1.themeData,
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value,
            home: const InitScreen(
              child: HomeScreen(),
            )
          );
        }
      ),
    );
  }
}

class InitScreen extends StatefulWidget {
  final Widget child;
  const InitScreen({ Key? key, required this.child }) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}