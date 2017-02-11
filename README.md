# [Dart i18n](https://github.com/dart-lang/intl) : Intl

[Demo]()

## Installation

```yaml
dependencies:
  intl:
  intl_translation:
```

## Etapes

1. définition d'une locale "en contexte"
2. extraction
3. traduction
4. génération des bundles

## i18n content types

- messages
- pluriels
- genre
- formatage et parsing de date / nombres

## Localizable content

### messages

Définition de méthodes (optionnellement paramétrables) de récupération 
de contenu localisé.

```dart
// ...

// simple texte
String hi() => Intl.message('Hi');

// w/ param
String dit(String mot) => Intl.message('I say : $mot', args: [mot], name: 'dit');

// params & all "expression metadata"
greetingMessage(name) => Intl.message(
  "Hello $name!",
  name: "greetingMessage",
  args: [name],
  desc: "Greet the user as they first open the application",
  examples: const {'name': "Emily"});
print(greetingMessage('Dan'));
```

### pluriels

Il est possible d'appeller directement la fonction plurial.

```dart
String plurial( int num )
  => Intl.plural(
    num,
    zero:'No item',
    one:'One item',
    other:'${num} items', args: [num], desc: "how many", name:'plurial'
  );
```

- colors ?

### dates

```dart
initializeDateFormatting(locale);
// ...
String date = new DateFormat.yMMMMd().add_jm().format(new DateTime.now());
```

## Extraction / Génération 

[intl_translation](https://github.com/dart-lang/intl_translation) permet d'extraire des données de localisation depuis des fichiers Dart,
et de générer des bundles.dart pour les différentes l11n.

### dart -> arb generation

#### [format ARB](https://github.com/googlei18n/app-resource-bundle/wiki/ApplicationResourceBundleSpecification) : json pour traducteur


```bash
# cf. extract.sh
pub run intl_translation:extract_to_arb --output-dir=extract ./web/main.dart ./web/file2.dart
```

### arb -> dart import

```bash
# cf. generate.sh
pub run intl_translation:generate_from_arb --no-use-deferred-loading --generated-file-prefix= --output-dir=./web/ ./web/main.dart extract/messages_en.arb extract/messages_fr.arb
```
- fichier généré

```dart
final messages = new MessageLookup();

final _keepAnalysisHappy = Intl.defaultLocale;

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(g, numChild) => "${Intl.gender(g, female: 'Mère de ${numChild}', male: 'Père de ${numChild}', other: 'Parent de ${numChild}')}";

  static m1(num) => "${Intl.plural(num, zero: 'Aucun item', one: 'Un item', other: '${num} items')}";

  static m2(mot) => "Je dis: ${mot}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => {
    "Blue" : MessageLookupByLibrary.simpleMessage("Bleu"),
    "Green" : MessageLookupByLibrary.simpleMessage("Vert"),
    "Hi" : MessageLookupByLibrary.simpleMessage("salut"),
    "Red" : MessageLookupByLibrary.simpleMessage("Rouge"),
    "lParent" : m0,
    "plurial" : m1,
    "say" : m2
  };
}
```


## init

### defaultLocale

- set defaultLocale

```dart
Intl.defaultLocale = 'pt_BR';
```

- system locale detection

```dart
findSystemLocale().then((String locale) => print('locale : $locale}'));
```

### initialisation

```dart
initializeDateFormatting(locale);
initializeMessages(locale).then((f) => print('locale ready...'));
```