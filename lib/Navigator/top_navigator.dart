import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef Callback = Function(int);

class AppTopNavigator extends StatelessWidget{
  final List<String> displayTexts;
  final List<IconData> dropdownIcons;
  final Callback onSelectionChanged;
  final Callback onSidebuttonsPressed;
  final VoidCallback onDropdownTouched;
  final int currentDisplayTextIdx;

  const AppTopNavigator({super.key, required this.displayTexts, required this.dropdownIcons, required this.currentDisplayTextIdx, required this.onSelectionChanged, required this.onSidebuttonsPressed, required this.onDropdownTouched});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final devicePadding = MediaQuery.of(context).padding;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(left: devicePadding.left, right: devicePadding.right),
      color: theme.colorScheme.secondary,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton<int>(
            enableFeedback: true,
            value: currentDisplayTextIdx,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down_rounded),
            onTap: (){
              onDropdownTouched();
            },
            items: displayTexts.asMap().entries.map((entry) {
              return DropdownMenuItem<int>(
                value: entry.key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      entry.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 5),
                    Icon(dropdownIcons[entry.key])
                  ],
                ),
              );
            }).toList(),
            selectedItemBuilder: (context){
              var list = <Widget>[];
              for(int i = 0; i < displayTexts.length; i++){
                list.add(Text(
                  displayTexts[i],
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ));
              }
              return list;
            },
            onChanged: (val){
              onSelectionChanged(val!);
            }
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: (){onSidebuttonsPressed(0);}, icon: const Icon(Icons.search), tooltip: 'Search'),
              IconButton(onPressed: (){onSidebuttonsPressed(1);}, icon: const Icon(Icons.history_rounded), tooltip: 'History'),
            ],
          )
        ],
      ),
    );
  }
}