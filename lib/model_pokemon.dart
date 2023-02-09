import 'package:flutter/material.dart';
import 'dart:convert';

class Pokemon {
  String name;

  Pokemon({required this.name});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name']);
  }
}