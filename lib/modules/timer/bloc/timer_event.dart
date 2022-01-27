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

class TimerStopped extends TimerEvent {
  const TimerStopped();
}

class TimerPaused extends TimerEvent {
  final Duration duration;
  const TimerPaused(this.duration);
}

class TimerResumed extends TimerEvent {
  final Duration duration;
  const TimerResumed(this.duration);
}
