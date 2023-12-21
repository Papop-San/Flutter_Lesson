import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class MoneyBox extends StatelessWidget {
  String titleCon;
  double amount;
  double sizeConHeight;
  Color colorSet;
  MoneyBox(this.titleCon, this.amount, this.sizeConHeight,this.colorSet);
  
  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: colorSet, 
                  borderRadius: BorderRadius.circular(20)),            
                height: sizeConHeight,
                
                child: Row(
                  children: [
                    Text(titleCon,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                    ),
                  
                    Expanded(
                      child: Text(
                        '${NumberFormat("#,###.###").format(amount)}',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                    ),
                    ),
                  ],
                ),
              );
  }
}