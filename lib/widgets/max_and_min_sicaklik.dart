import 'package:flutter/material.dart';

class MaxandMinSicaklikWidget extends StatelessWidget {
  const MaxandMinSicaklikWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Maksimum : '+ 24.toString() +'°C',style: TextStyle(fontSize: 20),),
                 Text('Minumum : '+ 12.toString() +'°C',style: TextStyle(fontSize: 20),)],
    );
  }
}
