# Dart OOP Assignment: Kigali Bus Card

**Name:** Stevy Mbazoloumoue 
**Student ID:** 23049

## My numbers
- D = 49, L = 9
- Starting balance = 1000 + (49 × 10) = 1490 RWF
- Bus fare = 200 + 49 = 249 RWF
- Student discount = 10 + 9 = 19%

## Output of main.dart
```
Error: name too short
Owner: Stevy | Balance: 1490 RWF
Owner: Stevy Mbazoloumoue | Balance: 1490 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 249 RWF
Owner: Stevy Mbazoloumoue | Balance: 2992 RWF
Student discount: 47 RWF
Paid 202 RWF
Owner: Stevy Mbazoloumoue | Balance: 1288 RWF
Student card: 19% off
```

## Part 1: Why no setter for balance?
If there was a setter for balance, anyone could just write `card.balance = 1000000` and get free money without paying anything. That would break the whole card. Without a setter, the only ways to change the balance are `topUp`, which checks that the amount is between 500 and 50000, and `pay`, which refuses when there is not enough money. So the class protects its own data and nobody can cheat.

## Part 2: What does ~/ do?
The normal `/` gives a decimal result, like 40.29. The `~/` does the division and then cuts off everything after the point, so we only keep the whole number.
- `print(237 * 17 / 100);` gives `40.29`
- `print(237 * 17 ~/ 100);` gives `40`

With my numbers it is the same idea: `249 * 19 / 100` gives 47.31 and `249 * 19 ~/ 100` gives 47. I need `~/` because the balance and the discount are `int`, and money in this program has no decimals.

## Part 4: Bug table
| Bug | The line | Why it is wrong (your words) | Your fix |
|-----|----------|------------------------------|----------|
| 1 | `String _brand;` and `int _battery;` | The fields have no starting value, and Dart does not allow that for normal (non-null) types. | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The child constructor never builds the parent. Phone needs a brand and a battery, so Dart complains. | Add `: super(brand, battery)` |
| 3 | `@override void restart()` | `@override` is only for a method that already exists in the parent. Phone has no `restart`, so there is nothing to override. | Remove `@override` |
| 4 | `p.battery = 100;` | Phone only has a getter for battery, so I cannot give it a new value. | Add `set battery(int value)` that accepts only 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, so it is used like a field, without `()`. With `()` Dart thinks it is a method. | `print(p.battery);` |

| Not a bug | Why is this line fine? |
|-----------|------------------------|
| `Phone p = new Phone('Tecno', 50);` | It looks old-style, but `new` is optional in Dart. It is still allowed, so the line works. |

After the fixes the program prints `100`.

## Part 5
My prediction: it prints `1` and then `5`.
- For `Bag a`: `add()` makes `_items` equal to 1. Then `a.items = -5` is refused because the setter only accepts values that are 0 or more, so it stays 1. It prints `1`.
- For `BigBag b`: its `add()` calls `super.add()` two times, so each call adds 2. After two calls we have 4. Then `b.items = b.items + 1` is 5, and the setter accepts it. It prints `5`.

Real output:
```
1
5
```

Was I right? Yes
