// // https://api.quran.gading.dev/surah/{surah id}/{ayah id}
// import 'package:equatable/equatable.dart';

// class Ayat extends Equatable {
//   final Number number;
//   final Meta meta;
//   final DetailAyatText detailAyahText;
//   final Ation detailAyahTranslation;
//   final Audio audio;
//   final DetailAyahTafsir detailAyahTafsir;
//   const Ayat({
//     required this.number,
//     required this.meta,
//     required this.detailAyahText,
//     required this.detailAyahTranslation,
//     required this.audio,
//     required this.detailAyahTafsir,
//   });

//   @override
//   List<Object?> get props => [
//         number,
//         meta,
//         detailAyahText,
//         detailAyahTranslation,
//         audio,
//         detailAyahTafsir,
//       ];
// }

// class Audio extends Equatable {
//   final String primary;
//   final List<String> secondary;
//   const Audio({
//     required this.primary,
//     required this.secondary,
//   });

//   @override
//   List<Object?> get props => [
//         primary,
//         secondary,
//       ];
// }

// class DetailAyahTafsir extends Equatable {
//   final Id id;
//   const DetailAyahTafsir({
//     required this.id,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//       ];
// }

// class Id extends Equatable {
//   final String short;
//   final String long;
//   const Id({
//     required this.short,
//     required this.long,
//   });

//   @override
//   List<Object?> get props => [
//         short,
//         long,
//       ];
// }

// class DetailAyatText extends Equatable {
//   final String arab;
//   final Transliteration transliteration;
//   const DetailAyatText({
//     required this.arab,
//     required this.transliteration,
//   });

//   @override
//   List<Object?> get props => [
//         arab,
//         transliteration,
//       ];
// }

// class Transliteration extends Equatable {
//   final String en;
//   const Transliteration({
//     required this.en,
//   });

//   @override
//   List<Object?> get props => [
//         en,
//       ];
// }

// class Ation extends Equatable {
//   final String en;
//   final String id;
//   const Ation({
//     required this.en,
//     required this.id,
//   });

//   @override
//   List<Object?> get props => [
//         en,
//         id,
//       ];
// }

// class Meta extends Equatable {
//   final int juz;
//   final int page;
//   final int manzil;
//   final int ruku;
//   final int hizbQuarter;
//   final Sajda sajda;
//   const Meta({
//     required this.juz,
//     required this.page,
//     required this.manzil,
//     required this.ruku,
//     required this.hizbQuarter,
//     required this.sajda,
//   });

//   @override
//   List<Object?> get props => [
//         juz,
//         page,
//         manzil,
//         ruku,
//         hizbQuarter,
//         sajda,
//       ];
// }

// class Sajda extends Equatable {
//   final bool recommended;
//   final bool obligatory;
//   const Sajda({
//     required this.recommended,
//     required this.obligatory,
//   });

//   @override
//   List<Object?> get props => [
//         recommended,
//         obligatory,
//       ];
// }

// class Number extends Equatable {
//   final int inQuran;
//   final int inSurah;
//   const Number({
//     required this.inQuran,
//     required this.inSurah,
//   });

//   @override
//   List<Object?> get props => [
//         inQuran,
//         inSurah,
//       ];
// }
