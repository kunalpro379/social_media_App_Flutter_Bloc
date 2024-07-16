import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// Events
abstract class CardSwiperEvent {}

class InitializeCardsEvent extends CardSwiperEvent {}

class NavigateNextEvent extends CardSwiperEvent {}

class NavigatePreviousEvent extends CardSwiperEvent {}

// States
abstract class CardSwiperState {}

class CardSwiperInitializedState extends CardSwiperState {
  final List<Widget> cards;
  final int currentIndex;

  CardSwiperInitializedState(this.cards, this.currentIndex);
}

// Bloc
class CardSwiperBloc extends Bloc<CardSwiperEvent, CardSwiperState> {
  late List<Widget> _cards;
  late int _currentIndex;

  CardSwiperBloc() : super(CardSwiperInitializedState([], 0)) {
    _cards = [];
    _currentIndex = 0;
  }

  @override
  Stream<CardSwiperState> mapEventToState(CardSwiperEvent event) async* {
    if (event is InitializeCardsEvent) {
      _initializeCards();
      yield CardSwiperInitializedState(_cards, _currentIndex);
    } else if (event is NavigateNextEvent) {
      _navigateNext();
      yield CardSwiperInitializedState(_cards, _currentIndex);
    } else if (event is NavigatePreviousEvent) {
      _navigatePrevious();
      yield CardSwiperInitializedState(_cards, _currentIndex);
    }
  }

  void _initializeCards() {
    _cards.clear();
    _cards.add(_buildCard("1", Colors.blue));
    _cards.add(_buildCard("2", Colors.red));
    _cards.add(_buildCard("3", Colors.purple));
  }

  void _navigateNext() {
    _currentIndex = (_currentIndex + 1) % _cards.length;
  }

  void _navigatePrevious() {
    _currentIndex = (_currentIndex - 1 + _cards.length) % _cards.length;
  }

  Widget _buildCard(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0, color: Colors.white),
      ),
      color: color,
    );
  }
}
