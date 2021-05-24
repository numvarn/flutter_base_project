import 'package:base_project/components/rounded_input_field.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/data/country.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textController = TextEditingController();

  List<Map<String, String>> newDataList = countryList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: appBarStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: RoundedInputField(
                hintText: 'Search Here...',
                controller: _textController,
                icon: Icons.search_outlined,
                onChanged: onItemChanged,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(12.0),
                children: newDataList.map((data) {
                  return ListTile(
                    title: Text(data['name']),
                    onTap: () => print(data),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onItemChanged(String value) {
    setState(() {
      newDataList = countryList.where((element) => element['name'].toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
}
