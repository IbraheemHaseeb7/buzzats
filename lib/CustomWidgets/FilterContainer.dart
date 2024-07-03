import 'package:flutter/material.dart';
import 'package:flutter_app_1/CustomWidgets/CustomFilter.dart';



class FilterContainer extends StatefulWidget {

  const FilterContainer({super.key});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {

  List items = ['FA20','SP21','FA21'];
 late var valueChoose= "Department" ;
 late var choose = "Batch";
 


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20,left: 20,),
      height: 70,
      color: const Color(0xff141d26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomFilter(
            
            
            items: items.map((e) => e.toString()).toList(),
             value: valueChoose,
              onChanged:(newValue){
                setState(() {
                valueChoose = newValue.toString();
                  
                });
              },
               width: 140,
                labelText: valueChoose),
          CustomFilter(
            
            
            items: items.map((e) => e.toString()).toList(),
             value: choose,
              onChanged:(newValue){
                setState(() {
                valueChoose = newValue.toString();
                  
                });
              },
               width: 140,
                labelText: choose),
                 ],
      ),


    );

  }
    String getDep(){
      return valueChoose;
    }
    String getBatch(){
      return choose;
    }
}