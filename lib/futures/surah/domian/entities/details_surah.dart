// https://api.quran.gading.dev/surah/{surah id}
import 'package:equatable/equatable.dart';

class DetailSurah extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameDetail name;
  final RevelationDetail revelation;
  final DataTafsir tafsir;
  final PreBismillah preBismillah;
  final List<Verse> verses;

  const DetailSurah({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    required this.preBismillah,
    required this.verses,
  });

  @override
  List<Object?> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        tafsir,
        preBismillah,
        verses,
      ];
}

class NameDetail extends Equatable {
  final String short;
  final String long;
  final TranslationDetail transliteration;
  final TranslationDetail translation;

  const NameDetail({
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

class TranslationDetail extends Equatable {
  final String en;
  final String id;

  const TranslationDetail({
    required this.en,
    required this.id,
  });

  @override
  List<Object?> get props => [
        en,
        id,
      ];
}

class PreBismillah extends Equatable {
  final Text text;
  final TranslationDetail translation;
  final Audio audio;

  const PreBismillah({
    required this.text,
    required this.translation,
    required this.audio,
  });

  @override
  List<Object?> get props => [
        text,
        translation,
        audio,
      ];
}

class Audio extends Equatable {
  final String primary;
  final List<String> secondary;

  const Audio({
    required this.primary,
    required this.secondary,
  });

  @override
  List<Object?> get props => [
        primary,
        secondary,
      ];
}

class Text extends Equatable {
  final String arab;
  final Transliteration transliteration;

  const Text({
    required this.arab,
    required this.transliteration,
  });

  @override
  List<Object?> get props => [
        arab,
        transliteration,
      ];
}

class Transliteration extends Equatable {
  final String en;
  const Transliteration({
    required this.en,
  });

  @override
  List<Object?> get props => [
        en,
      ];
}

class RevelationDetail extends Equatable {
  final String arab;
  final String en;
  final String id;
  const RevelationDetail({
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

class DataTafsir extends Equatable {
  final String id;
  const DataTafsir({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}

class Verse extends Equatable {
  final Number number;
  final Meta meta;
  final Text text;
  final TranslationDetail translation;
  final Audio audio;
  final VerseTafsir tafsir;
  const Verse({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  @override
  List<Object?> get props => [
        number,
        meta,
        text,
        translation,
        audio,
        tafsir,
      ];
}

class Meta extends Equatable {
  final int juz;
  final int page;
  final int manzil;
  final int ruku;
  final int hizbQuarter;
  final Sajda sajda;

  const Meta({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  @override
  List<Object?> get props => [
    juz,
    page,
    manzil,
    ruku,
    hizbQuarter,
    sajda,
  ];
}

class Sajda extends Equatable {
  final bool recommended;
  final bool obligatory;
  const Sajda({
    required this.recommended,
    required this.obligatory,
  });

  @override
  List<Object?> get props => [
    recommended,
    obligatory,
  ];
}

class Number extends Equatable {
  final int inQuran;
  final int inSurah;
  const Number({
    required this.inQuran,
    required this.inSurah,
  });

  @override
  List<Object?> get props => [
    inQuran,
    inSurah,
  ];
}

class VerseTafsir extends Equatable {
  final Id id;
  const VerseTafsir({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id
  ];
}

class Id extends Equatable {
  final String short;
  final String long;
  const Id({
    required this.short,
    required this.long,
  });

  @override
  List<Object?> get props => [
        short,
        long,
      ];
}
