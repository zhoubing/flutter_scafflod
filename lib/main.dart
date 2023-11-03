import 'package:fluent_ui/fluent_ui.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
  
}

class MyState extends State<MyApp> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme: FluentThemeData (
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.blue,
          iconTheme: const IconThemeData(size: 24)),
      darkTheme: FluentThemeData (
          scaffoldBackgroundColor: Colors.black,
          accentColor: Colors.blue,
          iconTheme: const IconThemeData(size: 24)),
          home: NavigationView(          appBar: NavigationAppBar(
            title: Text("Fluent Design App Bar")),
          pane: NavigationPane(
            selected: _index,
            displayMode: PaneDisplayMode.auto,
                        items: [
              PaneItem(
                icon: Icon(FluentIcons.access_logo),
                title: Text("Sample Page 1"),
                body: Text("123")
              ),
              PaneItem(
                icon: Icon(FluentIcons.accept_medium),
                title: Text("Sample Page 2"),
                body: Text("123")
              )
            ],
            onChanged: (newIndex) {
              setState(() {
                _index = newIndex;
              });
            }
          ),),
    );
  }

}