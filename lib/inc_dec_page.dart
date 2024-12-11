import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, int>(
                  builder: (context, state) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        state.toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterIncremented());
                        },
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterDecremented());
                        },
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
