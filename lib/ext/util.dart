import 'package:flutter/material.dart';

// Utilities for size
const double baseHeight = 650.0;
double screenAwareSize(double size, BuildContext context) 
{
  return size * MediaQuery.of(context).size.height / baseHeight;
}

