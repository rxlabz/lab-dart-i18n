// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

final _keepAnalysisHappy = Intl.defaultLocale;

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(g, numChild) => "${Intl.gender(g, female: 'Mother of ${numChild}', male: 'Father of ${numChild}', other: 'Parent of ${numChild}')}";

  static m1(num) => "${Intl.plural(num, zero: 'No item', one: 'One item', other: '${num} items')}";

  static m2(mot) => "I say : ${mot}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => {
    "Blue" : MessageLookupByLibrary.simpleMessage("Blue"),
    "Green" : MessageLookupByLibrary.simpleMessage("Green"),
    "Hi" : MessageLookupByLibrary.simpleMessage("Hi"),
    "Red" : MessageLookupByLibrary.simpleMessage("Red"),
    "lParent" : m0,
    "plurial" : m1,
    "say" : m2
  };
}
