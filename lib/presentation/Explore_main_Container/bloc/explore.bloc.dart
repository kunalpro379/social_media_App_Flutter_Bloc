import 'package:bloc/bloc.dart';
import 'package:connectiva/presentation/Explore_main_Container/bloc/explore.event.dart';
import 'package:connectiva/presentation/Explore_main_Container/bloc/explore.state.dart';

class ExploreContainerBloc
    extends Bloc<ExploreContainerEvent, ExploreContentState> {
  ExploreContainerBloc(ExploreContentState initialState) : super(initialState) {
    on<ExploreContainerInitialEvent>(_onInitialize);
  }
  _onInitialize(
      ExploreContainerEvent event, Emitter<ExploreContentState> emit) async {}
}
