import 'package:animals_app/pages/character_detail_screen.dart';
import 'package:animals_app/styleGuide.dart';
import 'package:flutter/material.dart';
import 'package:animals_app/models/character.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  final PageController pageController;
  final int currentPage;

  const CharacterWidget(
      {Key key, this.character, this.pageController, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return InkWell(
      onTap: () {
        Navigator.push(context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (context, _, __) =>
                  CharacterDetailScreen(character: character),));
      },
      child: AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            double value = 1;
            if (pageController.position.haveDimensions) {
              value = pageController.page;
              value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
            }
            if(value<1)
            {
              value=1;
            }
            return Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: CharacterCardBackgroundClipper(),
                    child: Hero(
                      tag: 'background${character.description}',
                      child: Container(
                        width: 0.9 * screenWidth,
                        height: 0.6 * screenHeight,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: character.colors,
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0 , -0.5),
                  child: Hero(
                    tag: 'image${character.imageUrl}',
                    child: Image.asset(
                        character.imageUrl,
                        height: screenHeight * 0.55 * value
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Hero(
                          tag: 'name${character.name}',
                          child: Material(
                              color: Colors.transparent,
                              child: Text(
                                character.name, style: AppTheme.hading,))),
                      Text('Tap to read more', style: AppTheme.subHeading,),
                    ],
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}
class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveDistance = 40;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height - 1, curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height);
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    path.lineTo(size.width, curveDistance);
    path.quadraticBezierTo(
        size.width - 1, 0, size.width - curveDistance - 5, curveDistance / 3);
    path.lineTo(curveDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
