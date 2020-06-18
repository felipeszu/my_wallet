
import 'package:flutter/material.dart';
import 'package:my_wallet/utils/colors.dart';

class SelectableButton extends StatefulWidget {
  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  List<bool> selectList = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        chip(0, 'no ano'),
        chip(1, 'no mês'),
        chip(2, 'desde o ínicio'),
      ],
    );
  }

  Widget chip(int index, String title){
    return Container(
      padding: EdgeInsets.all(4),
      child: ChoiceChip(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        backgroundColor: Colors.white,
        selectedColor: ColorUtil.secondaryColor,
        label: Text(
          title, style: 
          TextStyle(
            color: selectList[index] ? Colors.white : Colors.grey
          ),
        ),
        selected: selectList[index],
        onSelected: (selected) {
          setState(() {
            selectList = selectList.map((element) => false).toList();
            selectList[index] = true;
          }
          );
        }
      ),
    );
  }
}