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

  static m0(num) => "${Intl.plural(num, zero: 'Aucun item', one: 'Un item', other: '${num} items')}";

  static m1(mot) => "Je dis: ${mot}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => {
    "Blue" : MessageLookupByLibrary.simpleMessage("Bleu"),
    "Green" : MessageLookupByLibrary.simpleMessage("Vert"),
    "Hi" : MessageLookupByLibrary.simpleMessage("salut"),
    "Red" : MessageLookupByLibrary.simpleMessage("Rouge"),
    "plurial" : m0,
    "say" : m1
  };
}
