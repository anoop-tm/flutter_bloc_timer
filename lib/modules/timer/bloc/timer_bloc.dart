import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_timer/data/services/ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  StreamSubscription<int>? _subscription;
  final _ticker = Ticker();

  TimerBloc() : super(const TimerInitial(Duration())) {
    on<TimerStarted>((event, emit) {
      emit(const TimerRunning(Duration(seconds: 0)));
      _subscription?.cancel();
      _subscription = _ticker.tick().listen((elapsedSeconds) {
        add(TimerTicked(Duration(seconds: elapsedSeconds)));
      });
    });

    on<TimerTicked>((event, emit) {
      emit(TimerRunning(event.duration));
    });

    on<TimerStopped>((event, emit) {
      _subscription?.cancel();
      emit(const TimerInitial(Duration()));
    });

    on<TimerPaused>((event, emit) {
      _subscription?.pause();
      emit(TimerPause(event.duration));
    });

    on<TimerResumed>((event, emit) {
      _subscription?.resume();
      emit(TimerRunning(event.duration));
    });
  }
}
