part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  const TimerStarted();
}

class TimerTicked extends TimerEvent {
  const TimerTicked(this.duration);
  final Duration duration;

  @override
  List<Object> get props => [duration];
}
