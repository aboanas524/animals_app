import 'package:animals_app/models/character.dart';
import 'package:animals_app/styleGuide.dart';
import 'package:animals_app/widget/character_widget.dart';
import 'package:flutter/material.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {

  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1,
      initialPage: currentPage,
      keepPage: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),color: Colors.black,onPressed: (){Navigator.pop(context);},),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search,color: Colors.black,),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 10),
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: 'Animals Kingdom \n',
                            style: AppTheme.display1),
                        TextSpan(text: 'Characters', style: AppTheme.display2),
                      ]
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController, children: [
                  for(int i = 0; i < character.length; i++)
                    CharacterWidget(character: character[i],
                        pageController: _pageController,
                        currentPage: currentPage),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
