

import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final String id;
  final String name;
  final String rollNumber;
  final String className;
  final String section;
  final String? parentPhone;
  final String photoUrl;
  final bool isActive;

  StudentModel({
    required this.id,
    required this.name,
    required this.rollNumber,
    required this.className,
    required this.section,
    this.parentPhone,
    this.photoUrl = '',
    this.isActive = true,
  });

  factory StudentModel.fromFirestore(Map<String, dynamic> data, String id) {
    return StudentModel(
      id: id,
      name: data['name'] ?? '',
      rollNumber: data['rollNumber']?.toString() ?? '',
      className: data['className'] ?? '',
      section: data['section'] ?? '',
      parentPhone: data['parentPhone'],
      photoUrl: data['photoUrl'] ?? '',
      isActive: data['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'rollNumber': rollNumber,
      'className': className,
      'section': section,
      'parentPhone': parentPhone,
      'photoUrl': photoUrl,
      'isActive': isActive,
    };
  }
}