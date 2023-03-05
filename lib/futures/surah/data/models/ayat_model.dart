// https://api.quran.gading.dev/surah/{surah id}/{ayah id}
import 'dart:convert';

import 'package:quran_app/futures/surah/domian/entities/ayat.dart';

AyatModel ayatFromJson(String str) => AyatModel.fromJson(json.decode(str));

class AyatModel extends Ayat {
  const AyatModel({
    required super.number,
    required super.meta,
    required super.detailAyahText,
    required super.detailAyahTranslation,
    required super.audio,
    required super.detailAyahTafsir,
  });

  factory AyatModel.fromJson(Map<String, dynamic> json) => AyatModel(
        number: NumberModel.fromJson(json["number"]),
        meta: MetaModel.fromJson(json["meta"]),
        detailAyahText: DetailAyatTextModel.fromJson(json["detailAyahText"]),
        detailAyahTranslation:
            AtionModel.fromJson(json["detailAyahTranslation"]),
        audio: AudioModel.fromJson(json["audio"]),
        detailAyahTafsir:
            DetailAyahTafsirModel.fromJson(json["detailAyahTafsir"]),
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

class DetailAyahTafsirModel extends DetailAyahTafsir {
  const DetailAyahTafsirModel({
    required super.id,
  });

  factory DetailAyahTafsirModel.fromJson(Map<String, dynamic> json) =>
      DetailAyahTafsirModel(
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

class DetailAyatTextModel extends DetailAyatText {
  const DetailAyatTextModel({
    required super.arab,
    required super.transliteration,
  });

  factory DetailAyatTextModel.fromJson(Map<String, dynamic> json) =>
      DetailAyatTextModel(
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

class AtionModel extends Ation {
  const AtionModel({
    required super.en,
    required super.id,
  });

  factory AtionModel.fromJson(Map<String, dynamic> json) => AtionModel(
        en: json["en"],
        id: json["id"],
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
