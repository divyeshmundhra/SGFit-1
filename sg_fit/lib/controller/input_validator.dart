/**
 * This class validates all user input
 *
 * @author Jay Gupta
 */

class InputValidator {
  static bool validateAge(int age) {
    if (age < 12 || age > 100) return false;
    return true;
  }

  static bool validateHeight(int height) {
    if (height < 120 || height > 240) return false;
    return true;
  }

  static bool validateWeight(int weight) {
    if (weight < 20 || weight > 140) return false;
    return true;
  }

  static bool validateName(String name) {
    if (name.length > 15) return false;
    return true;
  }

  static bool validateWorkoutDuration(int duration) {
    if (duration < 0 || duration > 180) return false;
    return true;
  }

  static bool validateWorkoutIntensity(int intensity) {
    if (intensity < 0 || intensity > 5) return false;
    return true;
  }

  static bool isEmpty(Object o) {
    if (o.toString().isEmpty) return true;
    return false;
  }
}
