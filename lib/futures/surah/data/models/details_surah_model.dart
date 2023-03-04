// https://api.quran.gading.dev/surah/{surah id}
import 'dart:convert';

import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';

DetailSurahModel detailSurahFromJson(String str) =>
    DetailSurahModel.fromJson(json.decode(str));

class DetailSurahModel extends DetailSurah {
  const DetailSurahModel({
    required super.number,
    required super.sequence,
    required super.numberOfVerses,
    required super.name,
    required super.revelation,
    required super.tafsir,
    required super.preBismillah,
    required super.verses,
  });

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) =>
      DetailSurahModel(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: NameDetailModel.fromJson(json["name"]),
        revelation: RevelationDetailModel.fromJson(json["revelation"]),
        tafsir: DataTafsirModel.fromJson(json["tafsir"]),
        preBismillah: PreBismillahModel.fromJson(json["preBismillah"]),
        verses: List<VerseModel>.from(
            json["verses"].map((x) => VerseModel.fromJson(x))),
      );
}

class NameDetailModel extends NameDetail {
  const NameDetailModel({
    required super.short,
    required super.long,
    required super.transliteration,
    required super.translation,
  });

  factory NameDetailModel.fromJson(Map<String, dynamic> json) =>
      NameDetailModel(
        short: json["short"],
        long: json["long"],
        transliteration:
            TranslationDetailModel.fromJson(json["transliteration"]),
        translation: TranslationDetailModel.fromJson(json["translation"]),
      );
}

class TranslationDetailModel extends TranslationDetail {
  const TranslationDetailModel({
    required super.en,
    required super.id,
  });

  factory TranslationDetailModel.fromJson(Map<String, dynamic> json) =>
      TranslationDetailModel(
        en: json["en"],
        id: json["id"],
      );
}

class PreBismillahModel extends PreBismillah {
  const PreBismillahModel({
    required super.text,
    required super.translation,
    required super.audio,
  });

  factory PreBismillahModel.fromJson(Map<String, dynamic> json) =>
      PreBismillahModel(
        text: TextModel.fromJson(json["text"]),
        translation: TranslationDetailModel.fromJson(json["translation"]),
        audio: AudioModel.fromJson(json["audio"]),
      );
}

class AudioModel extends Audio {
  const AudioModel({
    required super.primary,
    required super.secondary,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        primary: json["primary"],
        secondary: List<String>.from(json["secondary"].map((x) => x)),
      );
}

class TextModel extends Text {
  const TextModel({
    required super.arab,
    required super.transliteration,
  });

  factory TextModel.fromJson(Map<String, dynamic> json) => TextModel(
        arab: json["arab"],
        transliteration: TransliterationModel.fromJson(json["transliteration"]),
      );
}

class TransliterationModel extends Transliteration {
  const TransliterationModel({
    required super.en,
  });

  factory TransliterationModel.fromJson(Map<String, dynamic> json) =>
      TransliterationModel(
        en: json["en"],
      );
}

class RevelationDetailModel extends RevelationDetail {
  const RevelationDetailModel({
    required super.arab,
    required super.en,
    required super.id,
  });
  factory RevelationDetailModel.fromJson(Map<String, dynamic> json) =>
      RevelationDetailModel(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );
}

class DataTafsirModel extends DataTafsir {
  const DataTafsirModel({
    required super.id,
  });

  factory DataTafsirModel.fromJson(Map<String, dynamic> json) =>
      DataTafsirModel(
        id: json["id"],
      );
}

class VerseModel extends Verse {
  const VerseModel({
    required super.number,
    required super.meta,
    required super.text,
    required super.translation,
    required super.audio,
    required super.tafsir,
  });

  factory VerseModel.fromJson(Map<String, dynamic> json) => VerseModel(
        number: NumberModel.fromJson(json["number"]),
        meta: MetaModel.fromJson(json["meta"]),
        text: TextModel.fromJson(json["text"]),
        translation: TranslationDetailModel.fromJson(json["translation"]),
        audio: AudioModel.fromJson(json["audio"]),
        tafsir: VerseTafsirModel.fromJson(json["tafsir"]),
      );
}

class MetaModel extends Meta {
  const MetaModel({
    required super.juz,
    required super.page,
    required super.manzil,
    required super.ruku,
    required super.hizbQuarter,
    required super.sajda,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: SajdaModel.fromJson(json["sajda"]),
      );
}

class SajdaModel extends Sajda {
  const SajdaModel({
    required super.recommended,
    required super.obligatory,
  });

  factory SajdaModel.fromJson(Map<String, dynamic> json) => SajdaModel(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );
}

class NumberModel extends Number {
  const NumberModel({
    required super.inQuran,
    required super.inSurah,
  });

  factory NumberModel.fromJson(Map<String, dynamic> json) => NumberModel(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );
}

class VerseTafsirModel extends VerseTafsir {
  const VerseTafsirModel({
    required super.id,
  });

  factory VerseTafsirModel.fromJson(Map<String, dynamic> json) =>
      VerseTafsirModel(
        id: IdModel.fromJson(json["id"]),
      );
}

class IdModel extends Id {
  const IdModel({
    required super.short,
    required super.long,
  });

  factory IdModel.fromJson(Map<String, dynamic> json) => IdModel(
        short: json["short"],
        long: json["long"],
      );
}
