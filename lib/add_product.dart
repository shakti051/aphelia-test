import 'package:aphelia_test/add_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  DateTime _currentDate = DateTime.now();
  final expire_date = TextEditingController();

  List<ListItem> _dropdownItems = [
    ListItem(1, "Furniture"),
    ListItem(2, "Cosmetics"),
    ListItem(3, "Garments"),
    ListItem(4, "Food Items")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  Future<Null> _selectedDate(BuildContext context) async {
    var today = DateTime.now();
    final DateTime _selDate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(today.year - 1),
        lastDate: DateTime(today.year + 1),
        builder: (context, child) {
          return SingleChildScrollView(child: child);
        });

    if (_selDate != null) {
      setState(() {
        _currentDate = _selDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Add product",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black38)),
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      padding: EdgeInsets.only(left: 16),
                      height: 35,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: _selectedItem,
                            items: _dropdownMenuItems,
                            onChanged: (value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      height: 35,
                      child: TextFormField(
                        enabled: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      height: 35,
                      child: TextFormField(
                        enabled: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Expiry Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        _selectedDate(context);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        height: 35,
                        child: TextFormField(
                          enabled: false,
                          controller: expire_date
                            ..text = DateFormat("yyyy-MM-dd")
                                .format(_currentDate)
                                .toString(),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Select Image",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        padding: EdgeInsets.only(top: 8),
                        height: 35,
                        color: Colors.blue,
                        child: Text(
                          "Add more Images",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
              const Divider(
                color: Colors.blue,
                height: 20,
                thickness: 1,
                indent: 8,
                endIndent: 8,
              ),
              Container(height: 200, child: AddImage()),
              Container(
                  margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
                  padding: EdgeInsets.only(top: 8),
                  width: double.infinity,
                  height: 35,
                  color: Colors.blue,
                  child: Text(
                    "upload data",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
