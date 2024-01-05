import 'package:flutter/material.dart';
import 'package:lab6_159/pages/hobby.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Hobby> hobbies = [];

  List _selectedItem = [];
  bool Tiktok = false;

  @override
  void initState() {
    super.initState();
    hobbies = Hobby.getHobby();
    print(hobbies);
  }

  List<Widget> createCheckbox() {
    List<Widget> widgets = [];

    for (var hb in hobbies) {
      widgets.add(CheckboxListTile(
        value: hb.value,
        onChanged: (value) {
          setState(() {
            hb.value = value!;

            if (value) {
              _selectedItem.add(hb.Name);
            } else {
              _selectedItem.remove(hb.Name);
            }
          });
        },
        title: Text(hb.Name),
      ));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab6"),
        backgroundColor: Color.fromARGB(255, 177, 159, 189),
      ),
      body: Column(
        children: [
          Text("งานอดิเรกของฉัน"),
          Column(
            children: createCheckbox(),
          ),
          Text(_selectedItem.toString()),
        ],
      ),
    );
  }
}