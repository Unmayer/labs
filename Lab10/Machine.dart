import 'dart:io';
import 'Enums.dart';

abstract class ICoffee {
  double coffeeBeans();
  double milk();
  double water();
  double cash();
}

class Resources {
  double coffeeBeans=0;
  double milk=0;
  double water=0;
  double cash=0;

  Resources(this.coffeeBeans, this.milk, this.water, this.cash);

  void getResource() {
    print('Ресурсы:');
    print('Кофейные зерна: $coffeeBeans г');
    print('Молоко: $milk мл');
    print('Вода: $water мл');
    print('Деньги в кассе: $cash руб');
  }

  void setResource() {
    coffeeBeans += 150;
    milk += 200;
    water += 500;
  }

  
}

class Espresso implements ICoffee {
  @override
  double coffeeBeans() => 60;

  @override
  double milk() => 0;

  @override
  double water() => 300;

  @override
  double cash() => 350;
}

class Cappuccino implements ICoffee {
  @override
  double coffeeBeans() => 50;

  @override
  double milk() => 50;

  @override
  double water() => 300;

  @override
  double cash() => 290;
}

class Latte implements ICoffee {
  @override
  double coffeeBeans() => 40;

  @override
  double milk() => 100;

  @override
  double water() => 300;

  @override
  double cash() => 300;
}

class Machine {
  late Resources resources;

  Machine(this.resources);

  bool isAvailableResources(CoffeeType coffeeType) {
  switch (coffeeType) {
    case CoffeeType.espresso:
      return resources.coffeeBeans >= Espresso().coffeeBeans() && resources.water >= Espresso().water();
    case CoffeeType.cappuccino:
      return resources.coffeeBeans >= Cappuccino().coffeeBeans() && resources.water >= Cappuccino().water() && resources.milk >= Cappuccino().milk();
    case CoffeeType.latte:
      return resources.coffeeBeans >= Latte().coffeeBeans() && resources.water >= Latte().water() && resources.milk >= Latte().milk();
  }
    
  }

  void makeCoffee(CoffeeType coffeeType) {
    if (isAvailableResources(coffeeType)) {
      switch (coffeeType) {
        case CoffeeType.espresso:
          resources.coffeeBeans -= Espresso().coffeeBeans();
          resources.water -= Espresso().water();
          resources.cash += Espresso().cash();
          break;
        case CoffeeType.cappuccino:
          resources.coffeeBeans -= Cappuccino().coffeeBeans();
          resources.water -= Cappuccino().water();
          resources.milk -= Cappuccino().milk();
          resources.cash += Cappuccino().cash();
          break;
        case CoffeeType.latte:
          resources.coffeeBeans -= Latte().coffeeBeans();
          resources.water -= Latte().water();
          resources.milk -= Latte().milk();
          resources.cash += Latte().cash();
          break;
      }
      print('Ваш кофе готов!');
    } else {
      print('Извините, недостаточно ресурсов.');
    }
  }
}

void main() {
  Resources initialResources = Resources(200, 500, 1000, 0.0);
  Machine coffeeMachine = Machine(initialResources);

  print('Добро пожаловать!');

  while (true) {
    print('Выберите ваш кофе (1 - эспрессо, 2 - капучино, 3 - латте, 4 - выход, 5 - Показать ресурсы, 6 - Увеличить ресурсы):');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        coffeeMachine.makeCoffee(CoffeeType.espresso);
        break;
      case 2:
        coffeeMachine.makeCoffee(CoffeeType.cappuccino);
        break;
      case 3:
        coffeeMachine.makeCoffee(CoffeeType.latte);
        break;
      case 4:
        exit(0);
      case 5:
        coffeeMachine.resources.getResource();
      case 6:
        coffeeMachine.resources.setResource();
    }
  }
}