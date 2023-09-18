import 'dart:math';

class GcdLDE {
  int x;
  int y;
  int g;
  GcdLDE(this.x, this.y, this.g);
}

int gcd(int a, int b) {
  if (b == 0) {
    return a;
  }
  return gcd(b, a % b);
}

GcdLDE extendedGCD(int a, int b) {
  if (b == 0) {
    return GcdLDE(1, 0, a);
  }
  GcdLDE gcdLDE = extendedGCD(b, a % b);
  int x = gcdLDE.y;
  int y = (gcdLDE.x - (a/b) * gcdLDE.y).toInt();
  return GcdLDE(x, y, gcdLDE.g);
}

int moduloInverse(int a, int m) {
  int g = gcd(a, m);
  if (g != 1) {
    return -1;
  }
  int x = 1;
  while (x < m) {
    if (((a * x) % m) == 1) {
      break;
    }
    x++;
  }
  return x;
}

void main() {
  print(moduloInverse(2, 3));
  GcdLDE gcdLDE = extendedGCD(2, 3);
  int c = 6;
  print(gcdLDE.g);
  if (c % gcdLDE.g == 0) {
    print("x = ${(gcdLDE.x * c) ~/ gcdLDE.g}, y = ${(gcdLDE.y * c) ~/ gcdLDE.g}");
  }else {
    print("Solution does not exist for LDE.");
  }


  if (gcdLDE.g != 1) {
    print("No solution");
  }else {
    int x = (gcdLDE.x % 7 + 7) % 7;
    print(x);
  }
}