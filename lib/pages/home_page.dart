import 'package:bloc_example/widgets/counter_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build home");
    return BlocProvider.value(
      value: _counterBloc,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (_, state) {
                  print("rebuild");
                  return Text("Counter is $state");
                },
              ),
              CounterLabel()
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'increment',
              onPressed: () {
                _counterBloc.add(CounterEvents.increment);
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: 'decrement',
              onPressed: () {
                _counterBloc.add(CounterEvents.decrement);
              },
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              heroTag: 'reset',
              onPressed: () {
                _counterBloc.add(CounterEvents.reset);
              },
              child: Icon(Icons.restore),
            )
          ],
        ),
      ),
    );
  }
}
