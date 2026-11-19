# Dart OOP Assignment: Kigali Bus Card

**Name:** Firstname Lastname
**Student ID:** 23049

## My numbers
- D = 49, L = 9
- Starting balance = 1000 + (49 × 10) = 1490 RWF
- Bus fare = 200 + 49 = 249 RWF
- Student discount = 10 + 9 = 19%

## Output of main.dart
```
Error: name too short
Owner: Firstname | Balance: 1490 RWF
Owner: Firstname Lastname | Balance: 1490 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 249 RWF
Paid 249 RWF
Owner: Firstname Lastname | Balance: 2992 RWF
Student discount: 47 RWF
Paid 202 RWF
Owner: Firstname Lastname | Balance: 1288 RWF
Student card: 19% off
```

## Part 1: Why no setter for balance?
A setter would let any code write `card.balance = 1000000` and give itself free money, skipping all the rules. Without a setter, the balance can only change through `topUp` (which checks 500 to 50000) and `pay` (which refuses if there is not enough money). The class controls its own data, so the card stays safe.

## Part 2: What does ~/ do?
`/` is normal division and gives a decimal number (double). `~/` is integer division: it divides and throws away the decimal part.
- `print(237 * 17 / 100);` prints `40.29`
- `print(237 * 17 ~/ 100);` prints `40`

With my numbers: `249 * 19 / 100` = 47.31 and `249 * 19 ~/ 100` = 47. We use `~/` because money here is an `int` (no decimals).

## Part 4: Bug table
| Bug | The line | Why it is wrong (your words) | Your fix |
|-----|----------|------------------------------|----------|
| 1 | `String _brand;` and `int _battery;` | Non-nullable fields must have a starting value, otherwise Dart gives an error. | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The child constructor does not build the parent Phone, and Phone has no empty constructor. | Add `: super(brand, battery)` |
| 3 | `@override void restart()` | `@override` only works if the parent has that method. Phone has no `restart`. | Remove `@override` |
| 4 | `p.battery = 100;` | There is only a getter, no setter, so battery cannot be assigned. | Add `set battery(int value)` that accepts only 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, not a method. It is used without `()`. | `print(p.battery);` |

| Not a bug | Why is this line fine? |
|-----------|------------------------|
| `Phone p = new Phone('Tecno', 50);` | The `new` keyword is optional in Dart but still allowed, so it is valid code. |

The fixed program prints `100`.

## Part 5
My prediction: it prints `1` then `5`.
- `Bag a`: `add()` makes `_items` = 1. `a.items = -5` is refused (value < 0), so `_items` stays 1. Prints `1`.
- `BigBag b`: each `add()` calls `super.add()` twice, so +2 each time. Two calls give 4. Then `b.items = 4 + 1 = 5` is accepted. Prints `5`.

Real output:
```
1
5
```

Was I right? Yes.
