// Copyright (c) 2017, rxlabz. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

import 'dart:html';

void main() {
  final output = querySelector('#output');
  final console = querySelector('#console');
  final lSelector = querySelector('#localeSelector');

  findSystemLocale().then((String locale) => output.text = locale);

  lSelector.onChange.listen((Event value)=>print('change locale => value ${(value.currentTarget as SelectElement).value}'));

  hi() => Intl.message('Hi');
}
