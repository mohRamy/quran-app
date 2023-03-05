// https://api.quran.gading.dev/surah
import 'dart:convert';

import 'package:quran_app/futures/surah/domian/entities/surah.dart';

SurahModel surahFromJson(String str) => SurahModel.fromJson(json.decode(str));

class SurahModel extends Surah {
    const SurahModel({
        required super.number,
        required super.sequence,
        required super.numberOfVerses,
        required super.name,
        required super.revelation,
        required super.tafsir,
    });

    factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: NameModel.fromJson(json["name"]),
        revelation: RevelationModel.fromJson(json["revelation"]),
        tafsir: TafsirModel.fromJson(json["tafsir"]),
    );
}

class NameModel extends Name {
    const NameModel({
        required super.short,
        required super.long,
        required super.transliteration,
        required super.translation,
    });

    factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        short: json["short"],
        long: json["long"],
        transliteration: TranslationModel.fromJson(json["transliteration"]),
        translation: TranslationModel.fromJson(json["translation"]),
    );
}

class TranslationModel extends Translation {
    const TranslationModel({
        required super.en,
        required super.id,
    });

    factory TranslationModel.fromJson(Map<String, dynamic> json) => TranslationModel(
        en: json["en"],
        id: json["id"],
    );
}

class RevelationModel extends Revelation {
    const RevelationModel({
        required super.arab,
        required super.en,
        required super.id,
    });

    factory RevelationModel.fromJson(Map<String, dynamic> json) => RevelationModel(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
    );
}

class TafsirModel extends Tafsir {
    const TafsirModel({
        required super.id,
    });

    factory TafsirModel.fromJson(Map<String, dynamic> json) => TafsirModel(
        id: json["id"],
    );
}
