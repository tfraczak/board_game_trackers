import 'package:flutter/material.dart';
import '../classes/index.dart' show ColorItem;

List<ColorItem> colors = [
  ColorItem(name: 'red', color: Colors.red),
  ColorItem(name: 'blue', color: Colors.blue),
  ColorItem(name: 'yellow', color: Colors.yellow),
  ColorItem(name: 'black', color: Colors.black),
];

Map<String, Color> fontColors = {
  'red': Colors.white,
  'blue': Colors.black,
  'yellow': Colors.black,
  'black': Colors.white,
};

const String stopSign = 'Stop Sign';
const String ticketDarker = 'Ticket Darker';

const Map<num, Map> appealData = {
  0: {'income': 5, 'eventType': null},
  1: {'income': 6, 'eventType': null},
  2: {'income': 7, 'eventType': null},
  3: {'income': 8, 'eventType': null},
  4: {'income': 9, 'eventType': null},
  5: {'income': 10, 'eventType': stopSign},
  6: {'income': 10, 'eventType': null},
  7: {'income': 11, 'eventType': null},
  8: {'income': 11, 'eventType': null},
  9: {'income': 12, 'eventType': null},
  10: {'income': 12, 'eventType': null},
  11: {'income': 13, 'eventType': null},
  12: {'income': 13, 'eventType': null},
  13: {'income': 14, 'eventType': null},
  14: {'income': 14, 'eventType': null},
  15: {'income': 15, 'eventType': null},
  16: {'income': 15, 'eventType': null},
  17: {'income': 16, 'eventType': null},
  18: {'income': 16, 'eventType': null},
  19: {'income': 16, 'eventType': null},
  20: {'income': 17, 'eventType': null},
  21: {'income': 17, 'eventType': null},
  22: {'income': 17, 'eventType': null},
  23: {'income': 18, 'eventType': null},
  24: {'income': 18, 'eventType': null},
  25: {'income': 18, 'eventType': ticketDarker},
  26: {'income': 19, 'eventType': null},
  27: {'income': 19, 'eventType': null},
  28: {'income': 19, 'eventType': null},
  29: {'income': 20, 'eventType': null},
  30: {'income': 20, 'eventType': null},
  31: {'income': 20, 'eventType': null},
  32: {'income': 21, 'eventType': null},
  33: {'income': 21, 'eventType': null},
  34: {'income': 21, 'eventType': null},
  35: {'income': 21, 'eventType': null},
  36: {'income': 22, 'eventType': null},
  37: {'income': 22, 'eventType': null},
  38: {'income': 22, 'eventType': null},
  39: {'income': 22, 'eventType': null},
  40: {'income': 23, 'eventType': null},
  41: {'income': 23, 'eventType': null},
  42: {'income': 23, 'eventType': null},
  43: {'income': 23, 'eventType': null},
  44: {'income': 24, 'eventType': null},
  45: {'income': 24, 'eventType': null},
  46: {'income': 24, 'eventType': null},
  47: {'income': 24, 'eventType': null},
  48: {'income': 25, 'eventType': null},
  49: {'income': 25, 'eventType': null},
  50: {'income': 25, 'eventType': null},
  51: {'income': 25, 'eventType': null},
  52: {'income': 26, 'eventType': null},
  53: {'income': 26, 'eventType': null},
  54: {'income': 26, 'eventType': null},
  55: {'income': 26, 'eventType': null},
  56: {'income': 27, 'eventType': null},
  57: {'income': 27, 'eventType': null},
  58: {'income': 27, 'eventType': null},
  59: {'income': 27, 'eventType': null},
  60: {'income': 27, 'eventType': null},
  61: {'income': 28, 'eventType': null},
  62: {'income': 28, 'eventType': null},
  63: {'income': 28, 'eventType': null},
  64: {'income': 28, 'eventType': null},
  65: {'income': 28, 'eventType': null},
  66: {'income': 29, 'eventType': null},
  67: {'income': 29, 'eventType': null},
  68: {'income': 29, 'eventType': null},
  69: {'income': 29, 'eventType': null},
  70: {'income': 29, 'eventType': null},
  71: {'income': 30, 'eventType': null},
  72: {'income': 30, 'eventType': null},
  73: {'income': 30, 'eventType': null},
  74: {'income': 30, 'eventType': null},
  75: {'income': 30, 'eventType': null},
  76: {'income': 31, 'eventType': null},
  77: {'income': 31, 'eventType': null},
  78: {'income': 31, 'eventType': null},
  79: {'income': 31, 'eventType': null},
  80: {'income': 31, 'eventType': null},
  81: {'income': 32, 'eventType': null},
  82: {'income': 32, 'eventType': null},
  83: {'income': 32, 'eventType': null},
  84: {'income': 32, 'eventType': null},
  85: {'income': 32, 'eventType': null},
  86: {'income': 33, 'eventType': null},
  87: {'income': 33, 'eventType': null},
  88: {'income': 33, 'eventType': null},
  89: {'income': 33, 'eventType': null},
  90: {'income': 33, 'eventType': null},
  91: {'income': 34, 'eventType': null},
  92: {'income': 34, 'eventType': null},
  93: {'income': 34, 'eventType': null},
  94: {'income': 34, 'eventType': null},
  95: {'income': 34, 'eventType': null},
  96: {'income': 35, 'eventType': null},
  97: {'income': 35, 'eventType': null},
  98: {'income': 35, 'eventType': null},
  99: {'income': 35, 'eventType': null},
  100: {'income': 35, 'eventType': null},
  101: {'income': 35, 'eventType': null},
  102: {'income': 36, 'eventType': null},
  103: {'income': 36, 'eventType': null},
  104: {'income': 36, 'eventType': null},
  105: {'income': 36, 'eventType': null},
  106: {'income': 36, 'eventType': null},
  107: {'income': 36, 'eventType': null},
  108: {'income': 37, 'eventType': null},
  109: {'income': 37, 'eventType': null},
  110: {'income': 37, 'eventType': null},
  111: {'income': 37, 'eventType': null},
  112: {'income': 37, 'eventType': null},
  113: {'income': 37, 'eventType': null},
};

const Map<num, Map> conservationData = {
  0: {'lowestAppeal': 0, 'bonus': false},
  1: {'lowestAppeal': 112, 'bonus': false},
  2: {'lowestAppeal': 110, 'bonus': true, 'bonusType': 'Bonus Tile'},
  3: {'lowestAppeal': 108, 'bonus': false},
  4: {'lowestAppeal': 106, 'bonus': false},
  5: {'lowestAppeal': 104, 'bonus': true, 'bonusType': 'Bonus Tile'},
  6: {'lowestAppeal': 102, 'bonus': false},
  7: {'lowestAppeal': 100, 'bonus': false},
  8: {'lowestAppeal': 98, 'bonus': true, 'bonusType': 'Bonus Tile'},
  9: {'lowestAppeal': 96, 'bonus': false},
  10: {'lowestAppeal': 94, 'bonus': true, 'bonusType': 'Discard one goal card'},
  11: {'lowestAppeal': 91, 'bonus': false},
  12: {'lowestAppeal': 88, 'bonus': false},
  13: {'lowestAppeal': 85, 'bonus': false},
  14: {'lowestAppeal': 82, 'bonus': false},
  15: {'lowestAppeal': 79, 'bonus': false},
  16: {'lowestAppeal': 76, 'bonus': false},
  17: {'lowestAppeal': 73, 'bonus': false},
  18: {'lowestAppeal': 70, 'bonus': false},
  19: {'lowestAppeal': 67, 'bonus': false},
  20: {'lowestAppeal': 64, 'bonus': false},
  21: {'lowestAppeal': 61, 'bonus': false},
  22: {'lowestAppeal': 58, 'bonus': false},
  23: {'lowestAppeal': 55, 'bonus': false},
  24: {'lowestAppeal': 52, 'bonus': false},
  25: {'lowestAppeal': 49, 'bonus': false},
  26: {'lowestAppeal': 46, 'bonus': false},
  27: {'lowestAppeal': 43, 'bonus': false},
  28: {'lowestAppeal': 40, 'bonus': false},
  29: {'lowestAppeal': 37, 'bonus': false},
  30: {'lowestAppeal': 34, 'bonus': false},
  31: {'lowestAppeal': 31, 'bonus': false},
  32: {'lowestAppeal': 28, 'bonus': false},
  33: {'lowestAppeal': 25, 'bonus': false},
  34: {'lowestAppeal': 22, 'bonus': false},
  35: {'lowestAppeal': 19, 'bonus': false},
  36: {'lowestAppeal': 16, 'bonus': false},
  37: {'lowestAppeal': 13, 'bonus': false},
  38: {'lowestAppeal': 10, 'bonus': false},
  39: {'lowestAppeal': 7, 'bonus': false},
  40: {'lowestAppeal': 4, 'bonus': false},
  41: {'lowestAppeal': 1, 'bonus': false},
};
