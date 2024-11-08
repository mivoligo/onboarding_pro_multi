import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/step_model.dart';
import 'package:onboarding_pro_multi/strings.dart';

const stepsList = [
  SingleStep(
    label: creativeTime,
    foregroundImage: '0-f.png',
    backgroundImage: '0-b.png',
    lineImage: 'line-0.png',
    backgroundGradientAlignment: Alignment.center,
    decorImages: [],
  ),
  SingleStep(
    label: events,
    foregroundImage: '1-f.png',
    backgroundImage: '1-b.png',
    lineImage: 'line-1.png',
    backgroundGradientAlignment: Alignment(0.25, 0.25),
    decorImages: [],
  ),
  SingleStep(
    label: newPlaces,
    foregroundImage: '2-f.png',
    backgroundImage: '2-b.png',
    lineImage: 'line-2.png',
    backgroundGradientAlignment: Alignment.center,
    decorImages: [],
  ),
  SingleStep(
    label: reminders,
    foregroundImage: '3-f.png',
    backgroundImage: '3-b.png',
    backgroundGradientAlignment: Alignment(0.25, 0),
    decorImages: [],
  ),
  SingleStep(
    label: upToDate,
    foregroundImage: '4-f.png',
    backgroundImage: '4-b.png',
    backgroundGradientAlignment: Alignment.center,
    decorImages: [],
  ),
  SingleStep(
    label: rhythm,
    foregroundImage: '5-f.png',
    backgroundImage: '5-b.png',
    lineImage: 'line-5.png',
    backgroundGradientAlignment: Alignment(0.25, 0),
    decorImages: [],
  ),
];
