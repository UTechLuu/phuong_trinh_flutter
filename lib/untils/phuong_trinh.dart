import 'dart:math' as math;

class PhuongTrinh {
  static List<double>? pt(double a, double b, double c) {
    if (a == 0) {
      if (b == 0) {
        if (c == 0) {
          return null;
        } else {
          return [];
        }
      } else {
        return [-c / b];
      }
    }
    //ptb2
    double delta = b * b - 4 * a * c;
    if (delta < 0) {
      return [];
    } else if (delta == 0) {
      return [-b / (2 * a)];
    } else {
      double x1 = ((-b - math.sqrt(delta)) / (2 * a));
      double x2 = ((-b + math.sqrt(delta)) / (2 * a));
      return [x1, x2];
    }
  }

  static List<double>? pt_1(double a, double b, double c) {
    if (a == 0) {
      if (b == 0) {
        if (c == 0) {
          return null;
        }
        return [];
      }
      return [-c / b];
    }
    //ptb2
    double delta = b * b - 4 * a * c;
    if (delta < 0) {
      return [];
    }
    if (delta == 0) {
      return [-b / (2 * a)];
    }
    double x1 = ((-b - math.sqrt(delta)) / (2 * a));
    double x2 = ((-b + math.sqrt(delta)) / (2 * a));
    return [x1, x2];
  }

  static (double?, double?)? pt_2(double a, double b, double c) {
    if (a == 0) {
      if (b == 0) {
        if (c == 0) {
          return null;
        }
        return (null, null);
      }
      double kq = -c / b;
      return (kq, null);
    }
    //ptb2
    double delta = b * b - 4 * a * c;
    if (delta < 0) {
      return (null, null);
    }
    if (delta == 0) {
      double kq = -b / (2 * a);
      return (kq, null);
    }
    double x1 = ((-b - math.sqrt(delta)) / (2 * a));
    double x2 = ((-b + math.sqrt(delta)) / (2 * a));
    return (x1, x2);
  }
}
