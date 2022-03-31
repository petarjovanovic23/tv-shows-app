import 'package:flutter/material.dart';
import 'package:tv_shows/models/storage_repository.dart';

import 'app.dart';

void main() async {
  await StorageRepository.initialize();

  runApp(const TvShowsApp());
}
