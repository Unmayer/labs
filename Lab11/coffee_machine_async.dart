class CoffeeMachineAsync {
  CoffeeMachineAsync() {
    prepareCoffee();
  }

  Future<void> heatWater() async {
    print('start_process: water');
    await Future.delayed(Duration(seconds: 3));
    print('done_process: water');
  }

  Future<void> brewCoffee() async {
    print('start_process: expresso');
    await Future.delayed(Duration(seconds: 5));
    print('done_process: coffee with water');
  }

  Future<void> frothMilk() async {
    print('start_process: milk');
    await Future.delayed(Duration(seconds: 5));
    print('done_process: milk');
  }

  Future<void> mixCoffeeAndMilk() async {
    await Future.delayed(Duration(seconds: 3));
    print('done_process: coffee with milk');
  }

  void prepareCoffee() async {
    print('*—————————————————-*');
    print('_start_');
    await heatWater();
    print('_then_');
    await Future.wait([brewCoffee(), frothMilk()]);
    await mixCoffeeAndMilk();
    print('_end_');
  }
}


void main() {
  CoffeeMachineAsync coffeeMachine = CoffeeMachineAsync();
  coffeeMachine;
}