part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.duration);

  final Duration duration;

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(Duration duration) : super(duration);
}

class TimerRunning extends TimerState {
  const TimerRunning(Duration duration) : super(duration);
}
