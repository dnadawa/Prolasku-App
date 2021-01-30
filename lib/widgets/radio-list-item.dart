import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'custom-text.dart';

class RadioListItem extends StatelessWidget {

  final Widget leading;
  final String title;
  final Function onChange;
  final String selected;

  const RadioListItem({Key key, this.leading, this.title, this.onChange, this.selected}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                color: Theme.of(context).accentColor
            ),
            child: SizedBox(
                width: ScreenUtil().setWidth(115),
                height: ScreenUtil().setWidth(115),
                child: leading
            ),
          ),
          Expanded(
            child: RadioListTile(
              title: CustomText(text: title,isBold: false,),
              value: title,
              groupValue: selected,
              onChanged: onChange,
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Theme.of(context).accentColor,

            ),
          ),
        ],
      ),
    );
  }
}
