// Copyright (c) 2017, rxlabz. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_browser.dart';
import 'messages_all.dart';

import 'dart:html';

SelectElement colSelector;
DivElement output;
SelectElement lSelector;
SelectElement numSelector;
DivElement console;
SpanElement plurialText;
SpanElement genderText;
SpanElement colorBox;

int lastSelectedColorIndex = 0;

Future main() async {
  String locale = await findSystemLocale();
  initializeUI(locale);
  Intl.defaultLocale = locale;
  initializeDateFormatting(locale);
  initializeMessages(locale).then((f) => localize(locale));
}

/// html elements initialization & event listening
///
void initializeUI(String locale) {
  console = querySelector('#console');
  output = querySelector('#output');
  lSelector = querySelector('#localeSelector');
  colSelector = querySelector('#colorSelector');
  numSelector = querySelector('#numSelector');
  plurialText = querySelector('#plurialText');
  genderText = querySelector('#genderText');
  colorBox = querySelector('#colorBox');

  querySelectorAll("input[name=gender]").onClick.listen((e) {
    updateParent();
  });

  colSelector.onChange.listen((e) {
    if (!colSelector.selectedIndex.isNegative)
      lastSelectedColorIndex = colSelector.selectedIndex;
    updateSelectedColor(colors[lastSelectedColorIndex].value);
  });

  numSelector.onChange.listen((Event value) {
    updatePlurial(int.parse((value.target as SelectElement).value));
  });
  lSelector.onChange.listen((Event value) {
    final newLocal = (value.currentTarget as SelectElement).value;
    print('change locale => newLocal ${newLocal}');
    Intl.defaultLocale = newLocal;
    localize(locale);
  });

  updateSelectedColor(colors[lastSelectedColorIndex].value);
}

void localize(String locale) {
  console.text = t();
  updatePlurial(int.parse(numSelector.value));
  updateLocaleInfos(locale);
  localizeColors();
  updateParent();
}

/// update gender parent text
void updateParent() {
  final String g =
      (querySelectorAll("input[name=gender]:checked").first as InputElement)
          .value;
  print('gender changed ${g}');
  genderText.text = lParent(g, 2);
}

void updatePlurial(int value) {
  plurialText.text = plurial(value);
}

void updateSelectedColor(String c) {
  colorBox.style.backgroundColor = c;
}

List<Color> colors = [
  new Color('R', '#f00', R()),
  new Color('G', '#0f0', G()),
  new Color('B', '#00f', B())
];

void localizeColors() {
  colors = [
    new Color('R', '#f00', R()),
    new Color('G', '#0f0', G()),
    new Color('B', '#00f', B())
  ];
  colors[lastSelectedColorIndex].selected = true;

  colors
      .map((c) =>
          new OptionElement(data: c.label, value: c.id, selected: c.selected))
      .forEach((opt) => colSelector.children.add(opt));
}

Future updateLocaleInfos(String systemLocal) async {
  output.text = "system local : ${systemLocal} /"
      " app locale default ${Intl.defaultLocale}";
}

String hi() => Intl.message('Hi');
String R() => Intl.message('Red');
String G() => Intl.message('Green');
String B() => Intl.message('Blue');

String plurial(int num) => Intl.plural(num,
    zero: 'No item',
    one: 'One item',
    other: '${num} items',
    args: [num],
    desc: "how many",
    name: 'plurial');

String lParent(String g, int numChild) => Intl.gender(g,
    male: 'Father of $numChild',
    female: 'Mother of $numChild',
    other: 'Parent of $numChild',
    args: [g, numChild],
    desc: "dad or mom",
    name: 'lParent');

String say(String mot) =>
    Intl.message('I say : $mot', args: [mot], name: 'say');

String t() =>
    hi() +
    ' / ' +
    say('test') +
    ' / ' +
    new DateFormat.yMMMMd().add_jm().format(new DateTime.now());

class Color {
  String label;
  bool selected = false;
  final String value;
  final String id;

  Color(this.id, this.value, this.label);
}
