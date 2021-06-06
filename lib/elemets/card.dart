import 'package:flutter/material.dart';

Widget buildCard(BuildContext context, String image, VoidCallback navigation,
    [String title, String subTitle]) {
      print(subTitle);
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 4,
    child: Padding(
      padding: subTitle == null ? EdgeInsets.all(8.0) : EdgeInsets.all(0),
      child: subTitle == null
          ? _buildListTileWithoutSubTitle(image, () => navigation(), title)
          : _buildListTileWithSubTitle(image, subTitle, () => navigation()),
    ),
  );
}

Widget _buildListTileWithSubTitle(
  String image,
  String subTitle,
  VoidCallback navigation,
) {
  return ListTile(
    onTap: () => navigation(),
    leading: _buildLeading(image),
    title: _buildTitle(),
    subtitle: _buildSubTitle(subTitle),
    trailing: _buildTrailing(),
  );
}

Widget _buildListTileWithoutSubTitle(
    String image, VoidCallback navigation, String title) {
  return ListTile(
    onTap: () => navigation(),
    leading: _buildLeading(image),
    title: _buildTitle(title),
    trailing: _buildTrailing(),
  );
}

Widget _buildLeading(String image) {
  return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(40), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(1, 3), // changes position of shadow
        ),
      ]),
      child: Image.asset(
        image,
        height: 50,
      ));
}

Widget _buildTitle([String title]) {
  return Text(
    title == null ? 'i am'.toUpperCase() : title,
    style: title == null
        ? TextStyle(fontSize: 14)
        : TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff4c36ad)),
  );
}

Widget _buildSubTitle([String subTitle]) {
  return Text(
    subTitle.toUpperCase(),
    style: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff4c36ad)),
  );
}

Widget _buildTrailing() {
  return Icon(
    Icons.arrow_forward_ios,
    size: 17,
  );
}
