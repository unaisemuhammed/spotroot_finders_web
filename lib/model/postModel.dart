// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String? id;
  final String latLng;
  final String placeName;
  final String descName;
  final String landMark;
  final String entranceTime;
  final String visitCost;
  final String whatHave;
  final String bestTime;
  final String spotImage;
  final String addedDate;

  const PostModel(
      {this.id,
      required this.latLng,
      required this.placeName,
      required this.descName,
      required this.landMark,
      required this.entranceTime,
      required this.visitCost,
      required this.whatHave,
      required this.bestTime,
      required this.spotImage,
      required this.addedDate});

  toJson() {
    return {
      'LatLng': latLng,
      'PlaceName': placeName,
      'DescName': descName,
      'LandMark': landMark,
      'EntranceTime': entranceTime,
      'VisitCost': visitCost,
      'WhatHave': whatHave,
      'BestTime': bestTime,
      'SpotImage': spotImage,
      'AddedDate': addedDate,
    };
  }

  factory PostModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PostModel(
        id: document.id,
        latLng: data['LatLng'],
        placeName: data['PlaceName'],
        descName: data['DescName'],
        landMark: data['LandMark'],
        entranceTime: data['EntranceTime'],
        visitCost: data['VisitCost'],
        whatHave: data['WhatHave'],
        bestTime: data['BestTime'],
        spotImage: data['SpotImage'],
        addedDate: data['AddedDate']);
  }
}
