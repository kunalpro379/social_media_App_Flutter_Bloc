import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreContent extends StatelessWidget {
  ExploreContent({Key? key}) : super(key: key);
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    
  }

  @override
  Widget build(BuildContext context) {
return BlocBuilder<ExploreContentBloc, ExploreContentState>(builder: builder)  }
}
