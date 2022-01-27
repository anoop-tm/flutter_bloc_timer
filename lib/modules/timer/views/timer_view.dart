import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_timer/modules/timer/bloc/timer_bloc.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            _TimerText(),
            SizedBox(height: 35),
            _Buttons(),
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              ElevatedButton.icon(
                onPressed: () {
                  context.read<TimerBloc>().add(const TimerStarted());
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start'),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
            if (state is TimerRunning) ...[
              ElevatedButton.icon(
                onPressed: () {
                  context.read<TimerBloc>().add(const TimerStopped());
                },
                icon: const Icon(Icons.stop),
                label: const Text('Stop'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<TimerBloc>().add(TimerPaused(state.duration));
                },
                icon: const Icon(Icons.pause),
                label: const Text('Pause'),
                style: ElevatedButton.styleFrom(primary: Colors.pink),
              ),
            ],
            if (state is TimerPause) ...[
              ElevatedButton.icon(
                onPressed: () {
                  context.read<TimerBloc>().add(TimerResumed(state.duration));
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Resume'),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _TimerText extends StatelessWidget {
  const _TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final durationText =
        duration.toString().substring(0, duration.toString().indexOf('.'));
    return Text(
      durationText,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
