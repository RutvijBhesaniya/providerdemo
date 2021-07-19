import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/itemsProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      home: ChangeNotifierProvider.value(
        value: ItemsProvider(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            RaisedButton(
              onPressed: () {
                if (_textEditingController.text.isNotEmpty) {
                  itemProvider.addItems(_textEditingController.text);
                }
              },
              child: Text("Add Items"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemProvider.getItemData.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    itemProvider.incrementCount(index);
                  },
                  title: Text('${itemProvider.getItemData[index]['title']}'),
                  trailing: CircleAvatar(
                    child: Text('${itemProvider.getItemData[index]['count']}'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
