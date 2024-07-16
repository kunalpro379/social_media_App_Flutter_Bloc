import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TabBar.cubit.dart';

class TabBarWidget extends StatelessWidget {
  final TabController tabController;

  TabBarWidget({required this.tabController, required List<String> tabs});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarCubit, int>(
      builder: (context, state) {
        tabController.animateTo(state);
        return Container(
          height: kToolbarHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              final bool isSelected = index == state;
              final double fontSize = isSelected ? 23 : 16;
              return GestureDetector(
                onTap: () => context.read<TabBarCubit>().updateTabIndex(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'Tab ${index + 1}',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
