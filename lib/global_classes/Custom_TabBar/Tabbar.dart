// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'TabBar.cubit.dart'; // Adjust path as necessary

// class TabBarWidget extends StatelessWidget {
//   final TabController tabController;
//   final List<Widget> tabs;
//   final List<Widget> tabViews;

//   TabBarWidget({
//     required this.tabController,
//     required this.tabs,
//     required this.tabViews,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TabBarCubit, int>(
//       builder: (context, state) {
//         tabController.animateTo(
//             state); // Ensure tabController follows the selected index
//         return Column(
//           children: [
//             Container(
//               height: kToolbarHeight,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: tabs.length,
//                 itemBuilder: (context, index) {
//                   final bool isSelected = index == state;
//                   final double fontSize = isSelected ? 20 : 14;
//                   return GestureDetector(
//                     onTap: () =>
//                         context.read<TabBarCubit>().updateTabIndex(index),
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                       child: Text(
//                         tabs[index].toString(),
//                         style: TextStyle(fontSize: fontSize),
//                       ),
//                     ),
//                   );
//                 },
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 physics: NeverScrollableScrollPhysics(),
//                 controller: tabController,
//                 children: tabViews,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
