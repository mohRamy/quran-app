// https://api.quran.gading.dev/surah
import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final Name name;
  final Revelation revelation;
  final Tafsir tafsir;
  const Surah({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  @override
  List<Object?> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        tafsir,
      ];
}

class Name extends Equatable {
  final String short;
  final String long;
  final Translation transliteration;
  final Translation translation;

  const Name({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  @override
  List<Object?> get props => [
        short,
        long,
        transliteration,
        translation,
      ];
}

class Translation extends Equatable {
  final String en;
  final String id;

  const Translation({
    required this.en,
    required this.id,
  });

  @override
  List<Object?> get props => [
        en,
        id,
      ];
}

class Revelation extends Equatable {
  final String arab;
  final String en;
  final String id;

  const Revelation({
    required this.arab,
    required this.en,
    required this.id,
  });

  @override
  List<Object?> get props => [
        arab,
        en,
        id,
      ];
}

class Tafsir extends Equatable {
  final String id;

  const Tafsir({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
