import 'package:after_layout/after_layout.dart';
import 'package:animals_app/models/character.dart';
import 'package:animals_app/styleGuide.dart';
import 'package:flutter/material.dart';


class CharacterDetailScreen extends StatefulWidget {
  final double _expandedBottomSheet = 0;
  final double _collapsedBottomSheet =-235;
  final double _fullCollapsedBottomSheet = -330;
  final Character character;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> with AfterLayoutMixin<CharacterDetailScreen> {
  double _currentBottomSheet = -330;
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: 'background${widget.character.description}',
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: widget.character.colors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(icon: Icon(Icons.close), onPressed: () {
                      Navigator.pop(context);
                    },
                      color: Colors.white,
                      iconSize: 35,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Hero(
                        tag: 'image${widget.character.imageUrl}',
                        child: Image.asset(
                          widget.character.imageUrl, height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.33,),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),

                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Hero(
                              tag: 'name${widget.character.name}',

                              child: Material(
                                  color: Colors.transparent,
                                  child: Text(widget.character.name,
                                    style: AppTheme.hading,)))),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 80),
                        child: Text('${widget.character.description} .',
                          style: AppTheme.subHeading,))
                    ,
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.decelerate,
                bottom: _currentBottomSheet,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          _onTap();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          height: 80,
                          child: Text(
                            'Clips',
                            style: AppTheme.subHeading.copyWith(
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _clipsWidget(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  _onTap()
  {
    setState(() {
      _currentBottomSheet = isCollapsed ? widget._expandedBottomSheet : widget._collapsedBottomSheet;
      isCollapsed = !isCollapsed;
    });
  }
  Widget _clipsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ColorsRow(Colors.redAccent, Colors.greenAccent),
          SizedBox(width: 16,),
          ColorsRow(Colors.orangeAccent, Colors.purple),
          SizedBox(width: 16,),
          ColorsRow(Colors.grey, Colors.blueGrey),
          SizedBox(width: 16,),
          ColorsRow(Colors.lightGreenAccent, Colors.pinkAccent),
          SizedBox(width: 16,),
          ColorsRow(Colors.deepOrange, Colors.lightBlueAccent),
        ],
      ),
    );
  }

  Widget ColorsRow(Color color1, Color color2) {
    return Column(
      children: [
        roundedContainer(color1),
        SizedBox(height: 20,),
        roundedContainer(color2),

      ],
    );
  }

  Widget roundedContainer(Color color) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isCollapsed = true;
        _currentBottomSheet = widget._collapsedBottomSheet;
      });
    });
  }
}

