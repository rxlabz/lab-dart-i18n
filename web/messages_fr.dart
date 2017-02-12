// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

final _keepAnalysisHappy = Intl.defaultLocale;

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'fr';

  static m0(g, numChild) => "${Intl.gender(g, female: 'Mère de ${numChild}', male: 'Père de ${numChild}', other: 'Parent de ${numChild}')}";

  static m1(num) => "${Intl.plural(num, zero: 'Aucun item', one: 'Un item', other: '${num} items')}";

  static m2(mot) => "Je dis: ${mot}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => {
    "Male" : MessageLookupByLibrary.simpleMessage("Homme"),
    "Female" : MessageLookupByLibrary.simpleMessage("Femme"),
    "Blue" : MessageLookupByLibrary.simpleMessage("Bleu"),
    "Green" : MessageLookupByLibrary.simpleMessage("Vert"),
    "Hi" : MessageLookupByLibrary.simpleMessage("Salut"),
    "Red" : MessageLookupByLibrary.simpleMessage("Rouge"),
    "lParent" : m0,
    "plurial" : m1,
    "say" : m2
  };
}
