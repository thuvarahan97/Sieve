import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../../injection_container.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/categories.dart';
import '../bloc/apps_bloc.dart';
import 'app_card.dart';
import 'apps_initial_state_widget.dart';
import 'apps_internet_error_widget.dart';
import 'categories_card.dart';

class CategoriesWidget extends StatelessWidget {
  final LoginUser user;
  final List<Categories> categories;

  const CategoriesWidget(
      {Key key, @required this.user, @required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppsBloc>(
      builder: (context) => sl<AppsBloc>(),
      child: Scaffold(
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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.8),
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                _BlocListner(user: user, categoryId: categories[0].getID),
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
                          'Select a Category',
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
                              categories.length,
                              (index) {
                                return CategoriesCard(
                                  id: categories[index].getID,
                                  name: categories[index].getName,
                                  icon: categories[index].getIcon,
                                  user: user,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    //! --*
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Apps on the Category',
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
      ),
    );
  }
}

class _BlocListner extends StatelessWidget {
  final LoginUser user;
  final int categoryId;

  const _BlocListner({
    Key key,
    @required this.user,
    @required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppsBloc, AppsState>(
      bloc: BlocProvider.of<AppsBloc>(context),
      builder: (context, state) {
        print('builder');
        if (state is Initial) {
          return AppsInitialStateWidget(
            user: user,
            categoryId: categoryId,
          );
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is InternetError) {
          return AppsInternetErrorWidget(
              user: user, categoryId: state.categoryId);
        } else if (state is Loaded) {
          if (state.apps[0].getID == 0 && state.apps[0].getName == "") {
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 25, left: 8, right: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff265699),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(left:12, right: 12, top: 20, bottom: 20),
                    child: Text(
                      "No apps found.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),

              ]
            );
          } else {
            return Column(
              children: List.generate(
                state.apps.length,
                    (index) {
                  print(categoryId);
                  return AppCard(
                    user: user,
                    app: state.apps[index],
                  );
                },
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
