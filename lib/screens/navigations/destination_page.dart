import 'package:flutter/material.dart';

import 'nav_models/destination_model.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.destination.title} Text'),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color[100],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          // ignore: missing_return
          builder: (BuildContext context) {
            switch(settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              case '/list':
                return ListPage(destination: widget.destination);
              case '/text':
                return TextPage(destination: widget.destination);
            }
          },
        );
      },
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/list");
          },
          child: Center(
            child: Text('tap here'),
          ),
        ),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    const List<int> shades = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: shades.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 128,
              child: Card(
                color: destination.color[shades[index]].withOpacity(0.25),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/text");
                  },
                  child: Center(
                    child: Text('Item $index', style: Theme.of(context).primaryTextTheme.display1),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TextPage extends StatefulWidget {
  const TextPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color[50],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}