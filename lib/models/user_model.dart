// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

class User extends Equatable {

  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });
  
  final String id;
  final String? email;
  final String? name;
  final String? photo;

  static const empty = User(id: '');
  
  bool get isEmpty => id.isEmpty;
  bool get isNotEmpty => !isEmpty;
  
  @override
  List<Object?> get props => [id, email, name, photo];
}
