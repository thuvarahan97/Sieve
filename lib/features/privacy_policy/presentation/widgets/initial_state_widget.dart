import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/privacy_policy_bloc.dart';

class InitialStateWidget extends StatefulWidget {
  final LoginUser user;
  final String appId;

  const InitialStateWidget({Key key, @required this.user, @required this.appId})
      : super(key: key);

  @override
  _InitialStateWidgetState createState() => _InitialStateWidgetState();
}

class _InitialStateWidgetState extends State<InitialStateWidget> {
  @override
  void initState() {
    super.initState();
    this._dispatchEvent(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        height: (MediaQuery.of(context).size.height) / 2,
        child: Center(
          child: CircularProgressIndicator(
            key: Key('circularProgressIndicator'),
            strokeWidth: 8,
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  void _dispatchEvent(BuildContext context) {
    BlocProvider.of<PrivacyPolicyBloc>(context).dispatch(
      LoadPrivacyPolicyEvent(user: widget.user, appId: widget.appId),
    );
  }
}
