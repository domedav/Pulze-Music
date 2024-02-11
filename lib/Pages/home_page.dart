import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pulze_music/InsidePages/all_music.dart';
import 'package:pulze_music/MiscElements/searchbar.dart';
import 'package:pulze_music/Navigator/top_navigator.dart';
import 'package:pulze_music/Themes/app_theme.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  var _currentlySelectedDropdownElement = 0;
  final GlobalKey _appTopNavbarGlobalKey = GlobalKey();

  final TextEditingController _searchbarTextController = TextEditingController();

  var _showSearchbar = false;

  @override
  Widget build(BuildContext context) {
    final devicePadding = MediaQuery.of(context).padding;
    final deviceScale = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: deviceScale.width,
        height: deviceScale.height,
        margin: EdgeInsets.only(left: devicePadding.left, right: devicePadding.right, top: devicePadding.top, bottom: devicePadding.bottom),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: _showSearchbar ? (_appTopNavbarGlobalKey.currentContext == null ? 0 : (_appTopNavbarGlobalKey.currentContext!.findRenderObject() as RenderBox).size.height) : 0.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.bounceOut,
                builder: (context, value, child){
                  return Padding(
                    padding: EdgeInsets.only(top: value),
                    child: AppSearchbar(
                      hintText: [
                        'Search Library...',
                        'Search Playlists...',
                        'Search in Files...'
                      ][_currentlySelectedDropdownElement],
                      searchIcon: [
                        Icons.saved_search_rounded,
                        Icons.manage_search_rounded,
                        Icons.screen_search_desktop_rounded
                      ][_currentlySelectedDropdownElement],
                      textController: _searchbarTextController,
                      onChanged: (str){

                      },
                    ),
                  );
                }
              ),
              AppTopNavigator(
                key: _appTopNavbarGlobalKey,
                displayTexts: const ['Library', 'Playlists', 'Import'],
                dropdownIcons: const [Icons.library_music_rounded, Icons.playlist_play_rounded, Icons.label_important_rounded],
                currentDisplayTextIdx: _currentlySelectedDropdownElement,
                onSelectionChanged: (val){
                  setState(() {
                    _currentlySelectedDropdownElement = val;
                  });
                },
                onSidebuttonsPressed: (val){
                  switch (val){
                    case 0: // search
                      setState(() {
                        _showSearchbar = !_showSearchbar;
                      });
                      break;
                    case 1: // history
                      break;
                    default:
                      return;
                  }
                },
                onDropdownTouched: (){
                  setState(() {
                    _showSearchbar = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}