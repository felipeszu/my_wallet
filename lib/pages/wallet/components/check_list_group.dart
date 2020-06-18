
import 'package:flutter/material.dart';
import 'package:my_wallet/model/chart_data.dart';

class CheckBoxGroup extends StatefulWidget {
  final List<ChartData> listCategory;
  final ValueChanged onChanged;
  CheckBoxGroup({Key key, this.listCategory, this.onChanged}) : super(key: key);

  @override
  _CheckBoxGroupState createState() => _CheckBoxGroupState();
}

class _CheckBoxGroupState extends State<CheckBoxGroup> {
  @override
  Widget build(BuildContext context) {
    List<Widget> checkBoxList = widget.listCategory.map(
      (element) => customCheckBoxTile(
        category: element,
        onChanged: (value){
          element.isChecked = value;
          widget.onChanged(element);
        })
      ).toList();
    return Container(
      child: Row(
        children: checkBoxList
      ));
    }

  Widget customCheckBoxTile({@required ChartData category, ValueChanged onChanged}){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Color.fromARGB(category.color.a, category.color.r, category.color.g, category.color.b),
            value: category.isChecked, 
            onChanged: (value) => onChanged(value)
          ),
          Text(category.title)
        ],
      ),
    );
  }
}