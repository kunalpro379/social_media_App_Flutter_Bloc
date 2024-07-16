import 'package:bloc/bloc.dart';

class TabBarCubit extends Cubit<int> {
  TabBarCubit() : super(0);

  void updateTabIndex(int index) {
    emit(index);
  }
}



// import 'package:connectiva/global_classes/Custom_TabBar/segmented_control.bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

// class CustomSegmentedControl extends StatelessWidget {
//   final int initialValue;
//   final Map<int, Widget> children;

//   CustomSegmentedControl({
//     required this.initialValue,
//     required this.children,
//   });
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SegmentedControlBloc(initialValue),
//       child: BlocBuilder<SegmentedControlBloc, SegmentedControlState>(
//         builder: (context, state) {
//           return CustomSlidingSegmentedControl(
//             children: children,
//             decoration: BoxDecoration(
//                 color: CupertinoColors.systemBrown,
//                 borderRadius: BorderRadius.circular(6)),
//             thumbDecoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(6),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 5,
//                       spreadRadius: 2,
//                       offset: Offset(0.1, 2))
//                 ]),
//             duration: Duration(milliseconds: 200),
//             onValueChanged: (int value) {},
//           );
//         },
//       ),
//     );
//   }
// }
