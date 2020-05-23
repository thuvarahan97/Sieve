import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/categories.dart';
import 'categories_card.dart';
import '../../../privacy_policy/presentation/pages/privacy_policy.dart';

class CategoriesWidget extends StatelessWidget {
  final LoginUser user;
  final List<Categories> news;

  const CategoriesWidget({Key key, @required this.user, @required this.news})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesign(
        user: user,
      ),
      appBar: AppBarDesign(
        title: 'Categories',
        imageUrl: user.getImageUrl,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.8),
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              //! SELECT A CATEGORY --*
              Column(
                children: <Widget>[
                  //! Category Card
                  Container(
                    height: MediaQuery.of(context).size.height / 2.8,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: AssetImage(
                          'icons/fb.png',
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          BlendMode.multiply,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Image(
                                  image: AssetImage(
                                    'icons/g.png',
                                  ),
                                  height: 70,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PrivacyPolicy(user: user, appId: '1'),
                                    ),
                                  );
                                },
                                tooltip: 'Go to the App Page',
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              bottom: 7,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'GOOGLE'.toUpperCase(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'One of the Biggest Social Media Platform',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 0.4,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height / 2.8,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: AssetImage(
                          'icons/fb.png',
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          BlendMode.multiply,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Image(
                                  image: AssetImage(
                                    'icons/fb.png',
                                  ),
                                  height: 70,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: (){
                                  print ('presses');
                                },
                                tooltip: 'Go to the App Page',
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              bottom: 7,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Facebook'.toUpperCase(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'One of the Biggest Social Media Platform',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 0.4,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ],
          ),
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height / 2.7,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select a Category'.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            this.news.length,
                                (index) {
                              print (this.news.length);
                              print (this.news[index].getTitle);
                              print(index);
                              return CategoriesCard(
                                title: this.news[index].getTitle,
                                desc: this.news[index].getDesc,
                                link: this.news[index].getFullLink,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  //! --*
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Apps on the category'.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}