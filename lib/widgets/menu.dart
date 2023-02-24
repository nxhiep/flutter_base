import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_brain/provider/theme_model.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const Text("Menu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.close))
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text("Dark Mode"),
              trailing: Selector<ThemeModel, bool>(
                selector: (p0, p1) => p1.isDarkMode(),
                builder: (context, value, child) {
                  return Switch(
                    value: value, 
                    onChanged: (value) {
                      Provider.of<ThemeModel>(context, listen: false).setDarkMode(value);
                      Navigator.pop(context);
                    },
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}