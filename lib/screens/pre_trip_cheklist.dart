import 'package:auto_size_text/auto_size_text.dart';
import 'package:bus_app/elemets/custom_appbar.dart';
import 'package:bus_app/models/radio_items.dart';
import 'package:bus_app/screen_resolution.dart/screen_resolution.dart';
import 'package:bus_app/screens/large_profile_pic.dart';
import 'package:flutter/material.dart';

class PreTripCheckList extends StatefulWidget {
  @override
  _PreTripCheckListState createState() => _PreTripCheckListState();
}

class _PreTripCheckListState extends State<PreTripCheckList> {
  final _formKey = GlobalKey<FormState>();
  int selectedIndex;
  bool status = false;

  List<RadioItems> radio = [
    RadioItems('Engine Water Level', 0),
    RadioItems('Engine Oil Level', 0),
    RadioItems('Seat Belts', 0),
    RadioItems('Indicators', 0),
    RadioItems('Wipers', 0),
    RadioItems('Tyres', 0),
    RadioItems('Spare Tyres', 0),
    RadioItems('Cleaness', 0),
  ];

  var subHeadingStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

  var textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(), hintText: 'Enter Fleet Number');

  Widget _buildScreenUI() {
    return Form(key: _formKey, child: _buildFormData());
  }

  Widget _buildFormData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 30),
          _buildTextField(),
          SizedBox(height: 30),
          _buildHeaderRow(),
          Divider(
            thickness: 2,
          ),
          _buildListView(),
          SizedBox(height: 20),
          _buildSubmitButton(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
        validator: (val) => val.isEmpty ? 'Fleet Number Required' : null,
        decoration: textFieldDecoration);
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'items'.toUpperCase(),
          style: subHeadingStyle,
        ),
        Text(
          'items'.toUpperCase(),
          style: subHeadingStyle,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('working'.toUpperCase(), style: subHeadingStyle),
              SizedBox(width: 30),
              Text(
                'faulty'.toUpperCase(),
                style: subHeadingStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return Container(
      child: Expanded(
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: radio.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    _buildCheckListItems(index),
                    SizedBox(height: 10,),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget _buildCheckListItems(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Hero(tag: 'light$index',
                  child: InkWell(
                    onTap: ()=>_dialogCall(context, radio[index].title),
                    // onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LargerPic())),
                                      child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/tyre.jpg'),
            radius: 25,
          ),
                  ),
        ),
        _buildListViewTitle(index),
        _buildRadioButtons(index),
      ],
    );
  }

  Widget _buildListViewTitle(int index) {
    return Container(
      width: 0.3 * screenWidth(context),
      child: Text(
        radio[index].title,
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _buildRadioButtons(int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildRadioButtonForWorkingStatus(index),
          SizedBox(width: 50),
          _buildRadioButtonForFaultyStatus(index)
        ],
      ),
    );
  }

  Widget _buildRadioButtonForWorkingStatus(int index) {
    return Radio(
      value: 1,
      groupValue: radio[index].selectedRadio,
      activeColor: Colors.green,
      onChanged: (val) {
        selectedValue(index);
        selectIndex == index ? changeValue(val, index) : val = false;
      },
    );
  }

  Widget _buildRadioButtonForFaultyStatus(int index) {
    return Radio(
      value: 2,
      groupValue: radio[index].selectedRadio,
      activeColor: Colors.green,
      onChanged: (val) {
        selectedValue(index);
        selectIndex == index ? changeValue(val, index) : val = false;
      },
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        color: Color(0xff6135bc),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: AutoSizeText(
            'Submit',
            style:
                TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 1),
            maxLines: 1,
          ),
        ),
        onPressed: () {
          _formKey.currentState.validate();
        },
      ),
    );
  }

  changeValue(int val, int index) {
    setState(() {
      radio[index].selectedRadio = val;
    });
  }

  void selectedValue(int index) {
    selectedIndex = index;
  }

  checkedStatus(int isChecked) {
    isChecked == 0 ? status = false : status = true;
  }

  bool get isChecked {
    return status;
  }

  int get selectIndex {
    return selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('Pre Trip CheckList'),
      body: _buildScreenUI(),
    );
  }

   Future<void> _dialogCall(BuildContext context, String title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog(title);
        });
  }

  Widget MyDialog(String title){
    return AlertDialog(
      insetPadding: EdgeInsets.all(0),
      title: Text(title),
      actions: <Widget>[
        Hero(tag: 'light1',
        child: Image.asset('assets/images/tyre.jpg',fit: BoxFit.fitWidth,)),
      ],
    );
  }
}
