import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global_classes/Custom_TabBar/CustomTabBar.dart';
import '../../global_classes/NavigationService.dart';
import '../../global_classes/Custom_TabBar/TabBar.cubit.dart';
import '../../core/utils/imageconstants.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_text_style.dart';
import '../../widgets/CustomSearchView/custom_search_view.dart';
import 'bloc/Explore.bloc.dart';
import 'bloc/Explore.event.dart';
import 'bloc/Explore.state.dart';
import 'models/explore.model.dart';

class ExploreMain extends StatefulWidget {
  const ExploreMain({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ExploreBloc>(
      create: (context) => ExploreBloc(
        ExploreState(ExploreModelObj: ExploreModel()),
      )..add(ExploreInitalEvent()),
      child: const ExploreMain(),
    );
  }

  @override
  State<ExploreMain> createState() => _ExploreMainState();
}

class _ExploreMainState extends State<ExploreMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 7, vsync: this); // Adjust the length for the number of tabs
    _tabController.addListener(_handleTabChange);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {}); // Ensure the widget rebuilds on tab change
      context.read<TabBarCubit>().updateTabIndex(_tabController.index);
      if (_tabController.index > 3) {
        _scrollToSelectedTab(_tabController.index);
      }
    }
  }

  void _scrollToSelectedTab(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scrollPosition = (screenWidth / 2) * index;
    _scrollController.animateTo(
      scrollPosition,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 67, 66, 66),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: SizeUtils.verticalSize(5)),
              _buildSearchRow(context),
              SizedBox(height: SizeUtils.verticalSize(31)),
              _buildTabBar(),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: List.generate(
                    5,
                    (index) => Center(child: Text('Tab ${index + 1} Content')),
                  ),
                ),
              ),
              SizedBox(height: SizeUtils.verticalSize(30)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalSize(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child:
                BlocSelector<ExploreBloc, ExploreState, TextEditingController?>(
              selector: (state) => state.searchController,
              builder: (context, searchController) {
                return CustomSearchView();
              },
            ),
          ),
          GestureDetector(
            onTap: () => NavigationService.pushNamed(AppRoutes.stories),
            child: Container(
              height: SizeUtils.adaptSize(40),
              width: SizeUtils.adaptSize(40),
              margin: EdgeInsets.only(left: SizeUtils.horizontalSize(20)),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeUtils.horizontalSize(20)),
                image: DecorationImage(
                  image: AssetImage(ImageConstant.DefStoryImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    List<String> tabTitles = [
      "Trending",
      "Followers",
      "Latest",
      "Discover",
      "My Digest",
      "SnapShot",
      " "
    ];

    return Container(
      child: TabBar(
        indicator: null,
        isScrollable: true,
        controller: _tabController,
        unselectedLabelColor: Colors.white,
        labelColor: Colors.yellow,
        tabs: List.generate(tabTitles.length, (index) {
          return AnimatedBuilder(
            animation: _tabController.animation!,
            builder: (context, child) {
              double value = _tabController.animation!.value;
              double selectedness = value == index ? 1.0 : 0.0;
              double zoom = 1.0 + (0.5 * selectedness);
              return Transform.scale(
                scale: _tabController.index == index ? zoom : 1.0,
                child: Text(
                  tabTitles[index],
                  style: TextStyle(
                    fontSize: _tabController.index == index ? 20 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
