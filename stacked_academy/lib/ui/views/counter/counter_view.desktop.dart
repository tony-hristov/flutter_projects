import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_viewmodel.dart';

class CounterViewDesktop extends ViewModelWidget<CounterViewModel> {
  const CounterViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CounterViewModel viewModel) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        child: const Text('+'),
      ),
      body: Center(
        child: Text(
          'Desktop View Counter: ${viewModel.counter}',
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
