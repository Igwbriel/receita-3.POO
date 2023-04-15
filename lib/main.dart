import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  final List<IconData> icons = [
    Icons.coffee_outlined,
    Icons.local_drink_outlined,
    Icons.flag_outlined,
    Icons.music_note_outlined,
    Icons.movie_outlined,
  ];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _theme = ThemeData(primarySwatch: Colors.blueGrey);

  void _changeThemeColor(MaterialColor color) {
    setState(() {
      _theme = ThemeData(primarySwatch: color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          title: "Roleta Russa das cores",
          changeThemeColor: _changeThemeColor,
        ),
        body: DataBodyWidget(objects: [
          "ROLETA RUSSA",
          "Consiste em uma roleta russa que você sempre sai vivo. ",
          "Substuindo o revolver pelo menu, e a bala pela cor 'red' que está escondida entre as cores certas."
        ]),
        bottomNavigationBar: NewNavBar(icons: widget.icons),
      ),
    );
  }
}

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    required String title,
    required void Function(MaterialColor) changeThemeColor,
  }) : super(
          key: key,
          title: Text(title),
          actions: [
            PopupMenuButton<MaterialColor>(
              onSelected: changeThemeColor,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Verde"),
                    value: Colors.green,
                  ),
                  PopupMenuItem(
                    child: Text("Azul"),
                    value: Colors.blue,
                  ),
                  PopupMenuItem(
                    child: Text("Amarelo"),
                    value: Colors.yellow,
                  ),
                  PopupMenuItem(
                    child: Text("Laranja"),
                    value: Colors.orange,
                  ),
                  PopupMenuItem(
                    child: Text("Rosa"),
                    value: Colors.red,
                  ),
                  PopupMenuItem(
                    child: Text("Roxo"),
                    value: Colors.deepPurple,
                  ),
                ];
              },
            ),
          ],
        );
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;

  NewNavBar({required this.icons});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      fixedColor: Colors.black,
      unselectedItemColor: Colors.blueGrey,
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(icons[index]),
          label: "Color $index",
        ),
      ),
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;

  DataBodyWidget({required this.objects});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: objects
          .map(
            (obj) => Expanded(
              child: Center(child: Text(obj)),
            ),
          )
          .toList(),
    );
  }
}
