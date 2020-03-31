/**
 * This class stores the list of tips related to the Water Consumption
 *
 * @author Swathi Kumar Vembu, Nishka Khendry
 */
library my_prj.globals;

import 'dart:math' show Random;

int workoutmins = 0;
int workoutintensity = 0;
int age = 70;
int gender = 1;
double weight = 85;

int containersize = 100;
int waterconsumedi = 0;

int target = 0;

var commontips = [
  'Remember to\ndrink your water\n in slow sips!',
  'Add flavour to\nyour water to\n drink more!',
  'Drink a glass\nafter every\nbathroom break!'
];

int getTipsIndex() {
  var randomizer = new Random();
  var num = randomizer.nextInt(2);
  return num;
}

int index = getTipsIndex();
String tips = commontips[index];
