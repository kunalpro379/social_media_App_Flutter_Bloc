import 'package:flutter_bloc/flutter_bloc.dart';
import 'like_event.dart';
import 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeState(isLiked: false));

  Stream<LikeState> mapEventToState(LikeEvent event) async* {
    if (event is LikeButtonPressed) {
      yield LikeState(isLiked: event.isLiked);
    }
  }
}
