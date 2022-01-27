// ignore_for_file: prefer_const_constructors, unused_import

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
          children: <Widget>[
            _TimerText(),
            ElevatedButton(
              onPressed: () {
                context.read<TimerBloc>().add(TimerStarted());
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('Start'),
            ),
          ],
        ),
      ),
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
