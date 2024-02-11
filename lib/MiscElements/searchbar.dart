import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef Callback = Function(String);

class AppSearchbar extends StatelessWidget{
  final hintText;
  final IconData searchIcon;
  final TextEditingController textController;
  final Callback onChanged;

  const AppSearchbar({super.key, required this.hintText, required this.searchIcon, required this.textController, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              readOnly: false,
              keyboardType: TextInputType.text,
              controller: textController,
              decoration: InputDecoration(
                hintText: hintText,
                hintFadeDuration: const Duration(milliseconds: 300)
              ),
              maxLines: 1,
              onChanged: (str){
                onChanged(str);
              },
            ),
          ),
          Icon(searchIcon)
        ],
      ),
    );
  }
}