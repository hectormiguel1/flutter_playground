import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'category.dart';

final List<String> medicalSubCats = [
  "Status Asthmaticus",
  "Status Epilepticus",
  "Sepsis",
  "Sickle Cell and Fever",
  "Pneumonia",
  "Pyelonephritis",
  "Fever in Immunocupressed",
  "Fever < or = 28 days",
  "Fever < or = 60 days",
  "Orbital Cellultis",
  "Pelvic Inflammatory Disease",
  "Ectopic Pregnancy",
  "Meningitis",
  "Altered Mental Status",
  "Retropharyngeal Abcess",
  "Peritonsillar Abcess",
  "Hypertensive Crisis",
  "Thyroid Storm",
  "Diabetic Ketoacidosis (DKA)",
  "Anaphylaxis",
  "Bacterial Tracheitis",
  "Croup",
  "Brief Resolved Unexplained Event (BRUE)",
];
final List<String> surgerySubCats = [
  "Appendicitis",
  "Testicular Torsion",
  "Ovarian Torsion",
  "Pyloric Stenosis",
  "Midgut Volvulus",
  "Intracranial Bleed",
  "Globe Rupture",
  "Hyphema",
  "Nasal Septal Hematoma",
  "Surgical Airway",
  "Necrotizing Enterocolitis",
  "Peritonitis",
  "Perianal Abscess",
  "Acute Cholecystitis",
  "Intussusception",
];
final List<String> traumaSubCats = [
  "Spine",
  "Head",
  "Maximum Voluntary Contraction (MVC)",
  "Pedestrian HBC",
  "Blunt Thoracic",
  "Blunt Abdominal",
  "GSW Extremity",
  "Tension Pneumothorax",
  "Cardiac Tamponade"
];
final List<String> toxicologySubCats = [
  "Acetaminophen",
  "Iron",
  "Salicylate",
  "Tricyclic Antidepressants",
  "Clonidine",
  "Organophosphate",
  "Carbon Monoxide",
  "Cyanide",
  "Opioids",
  "Benzodiazepines",
  "Ecstasy",
  "Bath Salts",
  "Cocaine",
  "LSD",
  "Marijuana",
  "Alcohols",
];
final List<String> foreignIngestionSubCats = [];

final List<Category> categories = [
  Category("Medical", FontAwesomeIcons.hospitalSymbol, Colors.blue.shade100,
      Colors.blue.shade900, medicalSubCats),
  Category("Surgery", Fontisto.surgical_knife, Colors.red.shade100,
      Colors.red.shade900, surgerySubCats),
  Category("Trauma", FontAwesomeIcons.userInjured, Colors.orange.shade100,
      Colors.deepOrange.shade900, traumaSubCats),
  Category("Toxicology", FontAwesomeIcons.biohazard, Colors.green.shade100,
      Colors.green.shade900, toxicologySubCats),
  Category("Foreign Ingestion", Entypo.lab_flask, Colors.purple.shade100,
      Colors.purple.shade900, foreignIngestionSubCats),
];
