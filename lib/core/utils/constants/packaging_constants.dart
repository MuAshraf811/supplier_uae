import 'package:flutter/material.dart';
import 'package:supplier/generated/l10n.dart';

class PackagingModel {
  final String title;
  final String image;

  PackagingModel({required this.title, required this.image});

  @override
  String toString() {
    return "$title , $image";
  }
}

class PackagingConstants {
  static List<List<String>> innerTitles(BuildContext context) { return [
    [ 
      S.of(context).containers, 
      S.of(context).foils,
      S.of(context).platters,
      S.of(context).pots,
   
    ], 
    [ 
      S.of(context).bakeryRange,
      S.of(context).bottles,
      S.of(context).clingFilm,
      S.of(context).containers,
      S.of(context).cups,
      S.of(context).cutleryRange,
      S.of(context).deliContainers,
      S.of(context).garbageBags,
      S.of(context).microwaveContainers,
      S.of(context).plateTrays,
      S.of(context).portionCups,
      S.of(context).bowls,
      S.of(context).saladContainers,
      S.of(context).stirrerStraws,
      S.of(context).tableSheets,
      S.of(context).tamperEvidentContainers
     
    ],
    [
      S.of(context).dispenser,
      S.of(context).cleaner,
      S.of(context).gloves,
      S.of(context).hygiene
    ],
    [
      S.of(context).bakingRange,
      S.of(context).bowls,
      S.of(context).boxes,
      S.of(context).concessionSupplies,
      S.of(context).cups,
      S.of(context).paperBags,
      S.of(context).sweetBoxes
    ],
    [
      S.of(context).concessionTrays,
      S.of(context).cutleries,
      S.of(context).sticks_skewers
    ],
   
  ];}
  static List tissue = [
    "Bed Roll Couch 1-Ply",
    "Bed Roll Paper 1-Ply 50cm",
    "Black Napkin 25x25cm",
    "Black Napkin 40x40cm",
    "Brown Napkin 33cmx33cm",
    "Brown Napkin Dt Fold 42x32cm",
    "Dispenser Napkin 21x33cm",
    "Facial Tissue 1x130box",
    "Kitchen Roll",
    "Maxi Roll 1-Ply 1kg",
    "Maxi Roll 1-Ply 300m",
    "Maxi Roll 1-Ply Autocut",
    "Maxi Roll 2-Ply 1kg",
    "Mini Tissue Rolls",
    "Paper Napkin 23cmx23cm 2ply",
    "Paper Napkin 30cmx30cm",
    "Paper Napkin 33cmx33cm",
    "Paper Napkin 40cmx40cm",
    "Red Napkin 40x40cm",
    "Snow White Tissue 2 Ply X 80 Sheets",
    "Soft N Cool Twin Pack Maxi Roll 300",
    "square-boutique facial-tissues",
    "T Roll Tissue 10cm",
    "Toilet Roll Paper 100 Sheet",
    "Toilet Roll Paper 150 Sheet",
    "Toilet Roll Paper 200 Sheet",
    "Toilet Roll Paper 300 Sheet",
    "Toilet Roll Paper 400 Sheet",
    "Toilet Roll Paper 500 Sheet",
    "V Fold Tissue 150pcs",
    "V-Fold Tissue 20x23cm 28gsm",
    "Wet Tissue Black 6x8cm",
    "Wet Tissue Black 7x11cm",
    "White Napkin Dt Fold 42x32cm"
  ];
  static List moldedFiber = [
    "6X4 inch Bio Hinged Container",
    "8 inch Square Plate",
    "9x6.5 inch Oval Plate",
    "9X6 inch Bio Hinged Container",
    "10x5 inch Rectangular Plate",
    "10x8 inch Bio Oval Plate",
    "12x10 inch Bio Oval Plate",
    "Bio Bowl 8Oz",
    "Bio Bowl 12Oz",
    "Bio Bowl 18Oz",
    "Bio Bowl 32Oz",
    "Bio Burrito Bowl 18Oz",
    "Bio Burrito Bowl 26Oz",
    "Bio Degradable 6 inch Burger Box",
    "Bio Natural Clear Container 750Ml 2 Divider 400Oz",
    "Bio Natural Clear Container 800Ml 400Oz",
    "Bio Natural Clear Container 1800Ml 200Oz",
    "Bio Paper Lunch Box 3 Divider 9 inch",
    "Biodegradable HD Cutlery Set",
    "Biodegradable Lunch Box 2 Divider",
    "Biodegradable Normal Fork",
    "Biodegradable Normal Knife",
    "Biodegradable Plate 10 inch Plain",
    "Biodegradable Square Bowl 24Oz",
    "Biodegradable Square Bowl 32Oz",
    "Biodegradable Sushi Tray",
    "Clamshell Container 8X8 cm",
    "Clamshell Container 9X9 cm",
    "Deep 9 inch 3 Compartment Container",
    "Dome Lid for 8 inch Square Plate",
    "Dome Lid for Oval Plate 12x10 inch",
    "Eco Friendly Burger Box 6 inch 500Oz",
    "Eco Friendly Food Container 5 Compartment 200Oz",
    "Eco Friendly Food Container 450Ml 500Oz",
    "Eco Friendly Food Container 550Ml 500Oz",
    "Eco Friendly Food Container 650Ml – 500Oz",
    "Eco Friendly Food Container 750Ml – 500Oz",
    "Eco Friendly Portion Cup 1Oz (30Ml) 2000Oz",
    "Eco Friendly Portion Cup 2Oz (60Ml) 2000Oz",
    "Eco Friendly Round Bowl 32Oz 500Oz",
    "Eco Friendly Round Bowl 40Oz 500Oz",
    "Eco Friendly Round Bowl Lids Pet 32Oz/40Oz 500Oz",
    "Eco Friendly Square Bowl 16Oz 300Oz",
    "Eco Friendly Square Bowl 24Oz 300Oz",
    "Large 5cm Bio American Tray 8.5x12.5 inch",
    "Lid for Sushi Box",
    "Lids for 9inch 3 Compartment Container",
    "Lids for Multi Purpose Container 12 Oz & 16 Oz",
    "Multi Purpose Container 12 Oz",
    "Multi Purpose Container 24 Oz",
    "Multi Purpose Container 32 Oz",
    "Paper Soup Bowl 16Oz",
    "Plate, Bio Degradable, Paper, 3cm, 10inch",
    "Wide Rim Bowl 12Oz",
    "Wide Rim Bowl 24Oz",
    "Wide Rim Bowl 32Oz"
  ];
  static List carton = [
    "3Ply Brown Box 26x19x27cm",
    "3Ply Brown Box 37x26x27cm",
    "3Ply Brown Box 42x14x30cm",
    "5 Ply Corrugated Carton Box 40x40x40cm",
    "5 Ply Corrugated Carton Box 45x45x45cm",
    "5 Ply Cardboard Carton Box 46x46x71cm",
    "5 Ply Corrugated Carton Box 48x40x39cm",
    "Brown Pizza Box Large",
    "Brown Pizza Box medium",
    "Brown Pizza Box small",
    "Multipurpose Carton Corrugated 20x20x10cm",
    "Multipurpose Carton Corrugated 30x20x10cm",
    "Multipurpose Carton Corrugated 40x30x12cm",
    "Multipurpose Carton Corrugated 50x30x12cm",
    "Multipurpose Carton Corrugated 59x40x11cm",
    "Printed cake box",
    "Ramadan Printed Carton Box",
    "White Cake Box 15x15cm",
    "White Cake Box 20x20cm",
    "White Cake Box 25x25cm",
    "White Cake Box 30x30cm",
    "White Cake Box 35x35cm",
    "White Pizza Box large",
    "White Pizza Box medium",
    "White Pizza Box small"
  ];
  static List foam = [
    "Black Rectangle Foam Tray 17.5 X 13.3 X 2 Cm",
    "Black Rectangle Foam Tray 21.5 X 17.7 X 1.8 Cm",
    "Foam Bowl 12 Oz",
    "Foam Burger Box",
    "Foam Cup 6oz",
    "Foam Cup 8oz",
    "Foam Cup 10oz",
    "Foam Cup 12oz",
    "Foam Cup 14oz",
    "Foam Lunch Box",
    "Foam Plates 10 Inch 3 Section",
    "Rectangle Foam Tray 17.5 X 13.3 X 2 Cm",
    "Rectangle Foam Tray 21.5 X 15.2 X 2.2 Cm",
    "Rectangle Foam Tray 26.2 X 18.5 X 2.2 Cm",
    "Rectangle Jumbo Foam Tray 31.5 X 23.2 X 4.2 cm",
    "White Round Foam Plate 9inch",
    "White Round Foam Plate 10inch",
    "White Round Foam Plate 12inch"
  ];

  static List<dynamic> showPackagingItems(
          {required int loopIndex, required int innerIndex}) =>
      [
        carton
            .map((e) => PackagingModel(
                title: e,
                image: "assets/images/Carton Products/$loopIndex.jpeg"))
            .toList(),
        moldedFiber
            .map((e) => PackagingModel(
                title: e,
                image: "assets/images/Molded Fiber Products/$loopIndex.jpeg"))
            .toList(),
        tissue
            .map((e) => PackagingModel(
                title: e,
                image: "assets/images/Tissue Products/$loopIndex.jpeg"))
            .toList(),
        foam
            .map((e) => PackagingModel(
                title: e, image: "assets/images/Foam Products/$loopIndex.jpeg"))
            .toList(),
        [
          [
            "Aluminium Container 1077HP",
            "Aluminium Container 8325 Base Only",
            "Aluminium Container 8342 Base Only",
            "Aluminium Container 8368 Base Only",
            "Aluminium Container 8389 Base Only",
            "Aluminium Container 73365 Base Only",
            "Aluminium Container 83120 Base Only",
            "Aluminium Container 83185 Base Only",
            "Aluminium Container 83190 Base Only",
            "Aluminium Container 83241 Base Only",
            "Aluminium Containers 890CC Base",
            "Aluminium Round Bowl 18CMX4CM",
            "Aluminium Round Bowl 18CMX5CM 5080 (Base)",
            "Aluminium Round Container 31135",
            "Base for 8576 Aluminium Container 3sec",
            "Base Only Aluminium Container 831160 ECO",
            "Base Only Aluminium Container 831160",
            "Base Only for 8367",
            "Round Aluminium Cake Ramekin Bowl 7112"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Alumium Products/Containers/$loopIndex.jpeg"))
              .toList(),
          [
            "Alu. Pop-Up Foil 9′′X10 3200 4′′/SHT",
            "Alu. Pop-Up Foil 9′′X10 3500 4′′/SHT",
            "Alu. Pop-Up Foil 12′′X10 3200 4′′/SHT",
            "Alu. Pop-Up Foil 12′′X10 3500 4′′/SHT",
            "Aluminium Foil (AF 45 cm METER)",
            "Aluminium Foil (AF 45L MTR)",
            "Aluminium Foil 30CM X 100Mtr",
            "Aluminium Foil 30CM X 150MTRS",
            "Aluminium Foil 45CM X 50Mtr",
            "Aluminium Foil 45CM X 100MTR",
            "Aluminium Foil 45CM X 150MTR",
            "Aluminium Foil Catering 45CM",
            "Aluminium Foil Commercial 30CM",
            "Aluminium Foil Embossed 25SQFT",
            "Aluminium Foil Embossed 75SQFT",
            "Embossed Aluminium Foil 37.5 SQ",
            "Embossed Aluminium Foil 45CM X 375 SQ FT",
            "Embossed Foil 45CMX37.5SQFT",
            "Aluminium Foil Embossed 200SQFT",
            "Aluminium Foil Embossed 250 Sqft"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Alumium Products/Foils/$loopIndex.jpeg"))
              .toList(),
          [
            "Aluminium Oval Platter 6550",
            "Aluminium Oval Platter 6586, 14inch DUC",
            "Aluminium Oval Platter 65180, 17inch DUC",
            "Aluminium Oval Platter 65220, 22inch DUC",
            "Aluminium Round Platter 6575"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Alumium Products/Platters/$loopIndex.jpeg"))
              .toList(),
          <String>[
            "Aluminium Pot 9CM with Hood",
            "Aluminium Pot 21CM with Hood",
            "Aluminium Pot 25CM Small with Hood",
            "Aluminium Pot 29CM Medium with Hood",
            "Aluminium Pot 34CM Large with Hood",
            "Aluminium Pot 39CM with Hood",
            "Color Aluminium Pot 9CM with Hood",
            "Color Aluminium Pot 21CM with Hood",
            "Color Aluminium Pot 25CM with Hood",
            "Color Aluminium Pot 29CM with Hood",
            "Color Aluminium Pot 39CM with Hood"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image: "assets/images/Alumium Products/Pots/$loopIndex.jpeg"))
              .toList(),
        ],
        [
          [
            "6 Croissant PET Clear Clamshell",
            "10 Croissant PET Clear Clamshell",
            "Black Base Cake Container 8′′ + Clear Lids",
            "Black Base Cake Container 10′′ + Clear Lids",
            "Black Base Cake Container 12′′ + Clear Lids",
            "Black Base Cake Container 14′′ Base – 1×50",
            "Black Base Cake Container 14′′ Lid – 1×50",
            "Black Base PET Triangular Container + Lid",
            "Clear Container (Club Sandwich)",
            "Clear Hinged Container – 170x110x45mm",
            "Clear Hinged Pastry Containers Large",
            "Clear Hinged Pastry Containers Meduim",
            "Clear Hinged Pastry Containers",
            "Clear Pineapple Container (Large)",
            "Clear Rectangular Cookies/Biscuit Tray",
            "Clear Round Box – 235x100mm",
            "Clear Round Box (Medium) – 15x8.5cm",
            "Clear Round Cake Box – 295x100mm",
            "Clear Round Hinged Container 20x8.5cm",
            "Clear Triangular Cake Container",
            "Deep Clear Hinged Pastry Container Large",
            "Deep Clear Hinged Pastry Container Medium",
            "Deep Clear Hinged Pastry Container Small",
            "Kraft Paper Sandwich Wedge Double",
            "Kraft Paper Sandwich Wedge Single",
            "Kraft Sandwich Wedge Window Large",
            "PET Black Base Cake Container 16cm + Lid",
            "PET Clear Burger Box 5inch",
            "PET Clear Burger Box 6inch",
            "PET Clear Hotdog (Bugette) Box 7inch",
            "PET Clear Hotdog (Bugette) Box 9inch",
            "PET Muffin Container 4 Division",
            "PET Muffin Tray Clear 6 Section",
            "PET Muffin Tray Clear 12 Section",
            "PET SANDWICH WEDGE 2 SLICE",
            "PET SANDWICH WEDGE 4 SLICE",
            "PET SANDWICH WEDGE 6 SLICE"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Bakery Range/$loopIndex.jpeg"))
              .toList(),
          [
            "Plastic Square Bottle 200ml + Cover",
            "Plastic Square Bottle 250ml + Cover",
            "Plastic Square Bottle 330ml + Cover",
            "Plastic Square Bottle 500ml + Cover",
            "Plastic Square Bottle 1000ml + Cover",
            "Plastic Square Bottle 1500ml + Cover"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Bottles/$loopIndex.jpeg"))
              .toList(),
          [
            "Cling Film 30*1500MDL",
            "Cling Film 30Cm X 100Mtr",
            "Cling Film 30Cm X 200Mtr",
            "Cling Film 45Cm X 100Mtr",
            "Cling Film 45Cm X 150Mtr",
            "Cling Film 45CM-Jumbo Roll",
            "Cling Film 45CM*1500MTR",
            "Cling Film, 1000 Sqft",
            "Cling Film, 1500 Sqft",
            "Food Wrap (Cling Film) 100 Sqft",
            "Food Wrap (Cling Film) 200 Sqft",
            "Food Wrap (Cling Film) 300 Sqft"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Cling Film/$loopIndex.jpeg"))
              .toList(),
          [
            "Clear Container 24oz High-Profile",
            "Clear Container 32oz High-Profile",
            "Clear Container 48oz High-Profile",
            "Clear Container 64oz High-Profile",
            "Clear Container with Lids 2 Compartment",
            "Clear Container with Lids 3 Compartment",
            "Clear PET Container with Lids 5 Compartment",
            "Clear Plastic Container Rectangular",
            "Clear Rectangular Box",
            "Clear Rectangular Container 8oz PET Base",
            "Clear Rectangular Container 12oz PET Base",
            "Clear Rectangular Container 16oz PET Base",
            "Clear Rectangular Container",
            "Clear Salad Container without Lid 64oz",
            "Clear Square Container Large",
            "Clear Square Container Medium",
            "Clear Square Container Small",
            "Clear Square Container XL",
            "Flat Lid Without Hole Dia 98 for IB PET Bowl",
            "PET Clear Donut Clamshell 4 Compartment",
            "PET Clear Donut Clamshell 5 Compartment",
            "PET Clear Rectangular 3 Compartment",
            "PET Clear Rectangular 4 Compartment",
            "PET Clear Rectangular 8 Compartment",
            "PET Clear Rectangular Single Compartment",
            "PET VEG/FRUIT PUNNET CONTAINER.100G",
            "PET VEG/FRUIT PUNNET CONTAINER.250G",
            "PET VEG/FRUIT PUNNET CONTAINER.500G",
            "PET VEG/FRUIT PUNNET CONTAINER.750G",
            "Round Clear Salad Bowl 8oz",
            "Plain Black Sushi Box",
            "Plain Black Sushi Boxs"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Containers/$loopIndex.jpeg"))
              .toList(),
          [
            "Clear PET Cup 12oz",
            "Clear PET Cup 14oz",
            "Clear PET Cup 16oz",
            "Clear PET Cup 20oz",
            "Clear PET Cup 24oz",
            "Clear PET Cups 8oz",
            "Clear PET Cups 10oz",
            "PET Ice Cream Bowl 6oz",
            "PET Ice Cream Bowl 8oz"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Cups/$loopIndex.jpeg"))
              .toList(),
          [
            "Heavy Duty Black Cutlery Set (Spoon/Fork/Knife/Napkin)",
            "Heavy Duty White Cutlery Set (Spoon/Fork/Knife/Napkin)",
            "Plastic Heavy Duty Black Fork",
            "Plastic Heavy Duty Black Knife",
            "Plastic Heavy Duty Black Spoon",
            "Plastic Heavy Duty Clear Fork",
            "Plastic Heavy Duty Clear Knife",
            "Plastic Heavy Duty Clear Spoon",
            "Plastic Heavy Duty White Fork",
            "Plastic Heavy Duty White Knife",
            "Plastic Heavy Duty White Spoon"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Cutlery range/$loopIndex.jpeg"))
              .toList(),
          [
            "4oz Round Deli Container",
            "Hinged Square Deli Clear PET Container 8oz",
            "Hinged Square Deli Clear PET Container 12oz",
            "Hinged Square Deli Clear PET Container 16oz",
            "Hinged Square Deli Clear PET Container 24oz",
            "Hinged Square Deli Clear PET Container 28oz",
            "Hinged Square Deli Clear PET Container 32oz",
            "Hinged Square Deli Clear PET Container 48oz",
            "Hinged Square Deli Clear PET Container 64oz",
            "PET Cup Insert for Round Deli Container",
            "PET Cup Insert for Square Deli Container",
            "PET Square Deli Container 8oz",
            "PET Square Deli Container 12oz",
            "PET Square Deli Container 16oz",
            "PET Square Deli Container 24oz",
            "PET Square Deli Container 32oz",
            "Round Deli Container 8oz",
            "Round Deli Container 12oz",
            "Round Deli Container 16oz",
            "Round Deli Container 24oz",
            "Round Deli Container 32oz"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Deli Containers/$loopIndex.jpeg"))
              .toList(),
          [
            "Drawstring Garbage Bag Roll H/Duty 60X90 Cm",
            "Drawstring Garbage Bag Roll H/Duty 75X103 Cm",
            "Drawstring Garbage Bag Roll H/Duty 90 X110 Cm",
            "Drawstring Kitchen Bag White Roll 55X65 Cm",
            "Dust Bin Liner Bag 45*55Cm",
            "Dustbin Liners White Roll 45X55 Cm",
            "Garbage Bag 65*95Cm-H/Duty",
            "Garbage Bag 65*95Cm-Regular",
            "Garbage Bag 80*110Cm-H/Duty",
            "Garbage Bag 80*110Cm-Regular",
            "Garbage Bag 95*120Cm-H/Duty",
            "Garbage Bag 95*120Cm-Regular",
            "Garbage Bag 105*130Cm-H/Duty",
            "Garbage Bag 105*130Cm-Regular",
            "Garbage Bag Roll 65X95 Cm – 30 Gallon",
            "Garbage Bag Roll 80X110 Cm – 55 Gallon",
            "Garbage Bag Roll 95X120 Cm – 60 Gallon",
            "Garbage Bag Roll 105X130 Cm"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Garbage Bags/$loopIndex.jpeg"))
              .toList(),
          [
            "3 Section Black HD Round Container 48oz",
            "Black Base 3 Section Round Container 48 Oz",
            "Black Base Chicken Container with Clear Hood",
            "Black Base HD Rectangular Container 38oz",
            "Black Base HD Rectangular Container 48oz",
            "Black Base HD Rectangular Container 58oz",
            "Black Base HD Round Container 8oz",
            "Black Base HD Round Container 16oz",
            "Black Base HD Round Container 24oz",
            "Black Base HD Round Container 25oz",
            "Black Base HD Round Container 32oz",
            "Black Base HD Round Container 40oz",
            "Black Base Rectangular + Lid 28 oz",
            "Black Base Rectangular 2",
            "Black Base Rectangular 4 Section Container With Lid",
            "Black Base Rectangular 6 Section Container With Lid",
            "Black Base Rectangular Container + Lids 32oz",
            "Black Base Rectangular Container 8oz",
            "Black Base Rectangular Container 24oz PP + Lids",
            "Black Base Rectangular Container 28oz",
            "Black Base Rectangular Container 48oz",
            "Black Base Rectangular Container With lid 16oz",
            "Black Base Rectangular Container With lid 24oz",
            "Black Base Rectangular Container With lid 28oz",
            "Black Base Rectangular Container With lid 32oz",
            "Black Base Rectangular Container With lid 38oz",
            "Black Base Rectangular Container With lid 48oz",
            "Black Base Rectangular Container With lid 58oz",
            "Black Base Rectangular HD Container 3 Section",
            "Black Base Rectangular HD Container 16oz",
            "Black Base Rectangular HD Container 24oz",
            "Black Base Rectangular Microwavable Container 2 Section",
            "Black Base Rectangular Microwavable Container 3 Section",
            "Black Base Rectangular Microwave 2 Section",
            "Black Base Rectangular Microwave Container 16oz",
            "Black Base Rectangular Microwave Container 16oz +Lid",
            "Black Base Rectangular Microwave Container with Lid 12oz",
            "Black Base Rectangular Microwave Container with Lid 16oz",
            "Black Base Rectangular Microwave Container with Lid 28oz",
            "Black Base Rectangular Microwave Container with Lid 32oz",
            "Black Base Rectangular Microwave Container with Lid 38oz",
            "Black Base Rectangular Microwave Container with Lid 58oz",
            "Black Base Round Container 12oz",
            "Black Base Round Container 37oz",
            "Black Base Round Container 40oz",
            "Black Base Round Container 48 oz 3 Secution",
            "Black Base Round Container 48oz",
            "Black Base Round Microwava Container with Lid 16oz",
            "Black Base Round Microwave Container with Lid 24oz",
            "Black Base Round Microwave Container with Lid 32oz",
            "Black Base Round Microwave Container with Lid 48oz",
            "Black HD Round Container 48oz",
            "Black Microwave 3 Divider Base",
            "Black Microwave Rectangular Container + Lid 12oz",
            "Black Microwave Rectangular Container + Lid 28oz",
            "Black Microwave Rectangular Container + Lid 38oz",
            "Black Microwave Round Container + Lid 24oz",
            "Black Microwave Round Container + Lid 32oz",
            "Black Rectangular Container 12oz Base",
            "Black Rectangular Container 32oz Base",
            "Black Rectangular Container 58oz Base",
            "Black Round Container 16oz Base",
            "Black Round Container 24oz Base",
            "Black Round Container 32oz Base",
            "Black Round Microwave Bowl + Lid 32oz",
            "Black Round Microwave Container 250ml",
            "Black Round Microwave Container 400ml",
            "Black Round Microwave Container 525ml",
            "Clear Lid for Black Base Rectangular Container 8oz",
            "Clear Microwave 2 Section Container With Lid",
            "Clear Microwave 3 Section Container With Lid",
            "Clear Microwave 4 Section Container With Lid",
            "Clear Microwave 5 Section Container With Lid",
            "Clear Microwave Portion Cup With Lid 60ml",
            "Clear Microwave Portion Cup With Lid 100ml",
            "Clear Rectangle Microwave 500ml",
            "Clear Rectangle Microwave 650ml",
            "Clear Rectangle Microwave 750ml",
            "Clear Rectangle Microwave 1000ml",
            "Clear Rectangle Microwave 1500ml",
            "Clear Rectangle Microwave 2000ml",
            "Clear Rectangular Heavy Duty Microwave Container with Lid 500ml",
            "Clear Rectangular Heavy Duty Microwave Container with Lid 650ml",
            "Clear Rectangular Heavy Duty Microwave Container with Lid 750ml",
            "Clear Rectangular Heavy Duty Microwave Container with Lid 1000ml",
            "Clear Rectangular Heavy Duty Microwave Container with Lid 2000ml",
            "Plastic Ribbed Clear Round Container 250ml",
            "Plastic Ribbed Clear Round Container 350ml",
            "Plastic Ribbed Clear Round Container 500ml",
            "Plastic Ribbed Clear Round Container Lid",
            "Plastic Ribbed Round Container White 200ml",
            "Plastic Ribbed Round Container White 250ml",
            "Plastic Ribbed Round Container White 350ml",
            "Plastic Ribbed Round Container White 500ml",
            "Rectangular Microwaveabl 28oz",
            "Red & Black Base Container 650 ML with Lid",
            "Red & Black Base Container 750 ML with Lid",
            "Red & Black Base Container 800 ML with Lid",
            "Red & Black Base Container 1000 ML with Lid",
            "Red & Black Base Rectangular 2 Section Container With Lid",
            "Red & Black Soup Bowl 450 cc with Lid",
            "Red & Black Soup Bowl 550 cc with Lid",
            "Red & Black Soup Bowl 700 cc with Lid",
            "Red & Black Soup Bowl 1000 cc with Lid",
            "Round Black Small Bowl + Clear Lid 16oz",
            "White Base Rectangular Container 16oz",
            "White Base Rectangular Multi-2 compartment Container",
            "White Base Rectangular Multi-3 compartment Container",
            "White Rectangular Container 12oz Base",
            "White Rectangular Container 28oz Base",
            "White Rectangular Container 32oz Base",
            "White Round Container 16oz Base",
            "White Round Container 24oz Base",
            "White Round Microwave Container 400ml",
            "White Round Microwave Container 525ml",
            "White Round Microwave Container Lid"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Microwave Containers/$loopIndex.jpeg"))
              .toList(),
          [
            "Round Crystal Desig 12 cm",
            "Round Crystal Desig 18 cm",
            "Round Crystal Desig 21 cm",
            "Round Crystal Desig 24 cm",
            "Round Crystal Desig 27 cm",
            "Round Crystal Desig 30 cm",
            "Round Crystal Desig 33 cm",
            "Round Crystal Desig 36 cm",
            "white rectangular plastic plate no. 1",
            "White Rectangular Plastic Plate No. 2",
            "White Rectangular Plastic Plate No. 3",
            "white rectangular plastic plate no. 4",
            "white rectangular plastic plate no. 5",
            "white round plastic plate 3 section",
            "white round plastic plate 7 inch",
            "white round plastic plate 9 inch",
            "white round plastic plate"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/PlateTrays/$loopIndex.jpeg"))
              .toList(),
          [
            "Black Portion Cup 1oz Base",
            "Black Portion Cup 2oz Base",
            "Black Portion Cup 30cc",
            "Black Portion Cup 60cc",
            "Black Portion Cup 80cc",
            "Black Portion Cup 100cc",
            "Clear Cup 60cc (2oz)",
            "Clear Garlic Cups 30cc + Lid",
            "Clear Portion Cup 45ml (1.5oz)",
            "Clear Portion Cup 80ml (2.5oz)",
            "Clear Portion Cup 100ml (4oz)",
            "Clear Portion Cup 165cc",
            "Flat Lid for Black/Clear 1oz Cup",
            "Flat Lid for Black/Clear 23/oz Cup",
            "PET Portion Cup 60ml",
            "PET Portion Cup120ml (4oz)",
            "PET Portion Cup 1oz",
            "Sample Portion Cup 3oz Base"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Portion Cups/$loopIndex.jpeg"))
              .toList(),
          [
            "Black Base Salad Bowl 32oz",
            "Clear Base Salad Bowl 18oz",
            "Clear Base Salad Bowl 24oz",
            "Clear Base Salad Bowl 32oz",
            "Clear Lids for Black Base Salad Bowl",
            "Clear Oval Hinged Container 175ML",
            "PET Black Square Bowl 32oz (9)",
            "PET Black Square Bowl 48oz",
            "PET Black Square Bowl 48oz (9)",
            "PET Black Square Bowl 64oz",
            "PET Black Square Bowl 64oz (9)",
            "PET Clear Square Bowl 24oz",
            "PET Clear Square Bowl 32oz",
            "PET Clear Square Bowl 32oz (9)",
            "PET Clear Square Bowl 48oz",
            "PET Clear Square Bowl 48oz (9)",
            "PET Clear Square Bowl 64oz (9)",
            "PET Clear Square Bowl 64oz",
            "PET Ice Cream Bowl 10oz",
            "White Bowl 60 cc",
            "White Bowl 80 cc",
            "White Bowl 100 cc"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Powls/$loopIndex.jpeg"))
              .toList(),
          [
            "Black Base Salad Bowl 18oz",
            "Black Base Salad Bowl 24oz",
            "Clear Oval Hinged Container with Sparkle",
            "Clear PET Hinged Oval 12oz",
            "Clear PET Hinged Oval Container 240",
            "Clear PET Hinged Oval Container 750",
            "Clear PET Hinged Oval Container 1000",
            "PET Black Square Bowl 24oz",
            "PET Black Square Bowl 32oz",
            "Plastic Clear Container 4oz",
            "Plastic Clear Container 6oz",
            "Round Clear Salad Bowl 16oz",
            "Round Clear Salad Bowl 24oz",
            "Round Clear Salad Bowl 32oz",
            "Round Clear Salad Bowl 48oz"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Salad Containers/$loopIndex.jpeg"))
              .toList(),
          [
            "7mm Black Straight Straw",
            "7mm Clear Straight Straw",
            "8mm Black Straight Straw",
            "12mm Black Straight Straw Wrapped",
            "12mm Clear Straight Straw Clear" "Flexible Straw 6mm",
            "Mix Colors Spoon Straw 8 MM",
            "Plastic Black Coffee Stirrer 13 cm",
            "Plastic Clear Cocktail Stirrer"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/StirrerStraws/$loopIndex.jpeg"))
              .toList(),
          [
            "Disposable Prayer Mat Ld 60X115Cm",
            "Jumbo Sofra Roll, 5Kg",
            "Jumbo Sofra Roll, 10Kg",
            "Ld Lxry Sofra Roll 100*120Cm",
            "Ld Sofra Roll 100*120Cm Perf",
            "Perf Sofra Roll 100*100Cm",
            "Perf Sofra Roll Spoffer"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Table Sheets/$loopIndex.jpeg"))
              .toList(),
          [
            "PET VEG/FRUIT PUNNET CONTAINER.1000G",
            "Tamper Evident Round PET Container 8oz",
            "Tamper Evident Round PET Container 12oz",
            "Tamper Evident Round PET Container 16oz",
            "Tamper Evident Round PET Container 24oz",
            "Tamper Evident Round PET Container 28oz",
            "Tamper Evident Round PET Container 32oz",
            "Tamper Evident Round PET Container 48oz",
            "Tamper Evident Round PET Container 64oz",
            "Tamper Evident Square PET Container 8oz",
            "Tamper Evident Square PET Container 12oz",
            "Tamper Evident Square PET Container 16oz",
            "Tamper Evident Square PET Container 24oz",
            "Tamper Evident Square PET Container 28oz",
            "Tamper Evident Square PET Container 32oz",
            "Tamper Evident Square PET Container 48oz",
            "Tamper Evident Square PET Container 64oz"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Plastic Products/Tamper Evident Containers/$loopIndex.jpeg"))
              .toList(),
        ],
        [
          [
            "Autocut Paper Dispenser",
            "Automatic Soap Dispenser 1000ML",
            "C/Z-Fold Dispenser Small",
            "Dispenser for Film or Foil",
            "Dispenser for Nurse Cap",
            "Manual Soap Dispenser 400ML",
            "Stainless Steel Dispenser 800ML",
            "Steel Dispenser Small",
            "Steel Soap Dispenser 1000ML",
            "Twin Clear Manual Soap Dispenser 400ML"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Hygiene and protection/ Dispenser/$loopIndex.jpeg"))
              .toList(),
          [
            "All Purpose Cleaner 5L",
            "Antiseptic Disinfectant 5L",
            "Dish Wash Liquid 1Ltr",
            "Dish Wash Liquid 25Ltr",
            "Dish Wash Liquid 750ml",
            "Dishwashing Liquid 5Ltr",
            "Glass Cleaner 750ML",
            "Hand Sanitizer 5L",
            "Hand Sanitizer 500ML",
            "Hand Sanitizer Spray 100ML",
            "Hand Wash Liquid 500ML",
            "Hand Wash Liquid Green Apple 500ML",
            "Hand Wash Liquid Lavender 500ML",
            "Hand Wash Liquid Lemon 500ML",
            "Hand Wash Liquid Oud 500ML",
            "Hand Wash Liquid Rose 25LTR",
            "Hand Wash Liquid Rose 500ML",
            "Marjaan Dishwashing Liquid 1Ltr",
            "Oven Cleaner 5L",
            "Floor Cleaner Lavender 1.5L",
            "Floor Cleaner Lavender 3L",
            "Floor Cleaner Lavender 5L",
            "Hand Sanitizer Gel 60ML",
            "Hand Wash Liquid Clear 5LTR",
            "Hand ash Liquid Lemon 5LTR",
            "Hand Wash Liquid Rose 5LTR",
            "Super Clean Bleach 1G",
            "Surface Sanitizer Disinfectant 750ML"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Hygiene and protection/Cleaner/$loopIndex.jpeg"))
              .toList(),
          [
            "Latex Gloves – L",
            "Latex Gloves – M",
            "Latex Gloves – S",
            "Latex Gloves – XL",
            "Powder Free Vinyl Gloves – L",
            "Powder Free Vinyl Gloves – M",
            "Powder Free Vinyl Gloves – S",
            "Powder Free Vinyl Gloves – XL",
            "Powder Latex Gloves – L",
            "Powder Latex Gloves – M",
            "Powder Latex Gloves – S",
            "Powder Latex Gloves – XL",
            "Vinyl Gloves – L",
            "Vinyl Gloves – M",
            "Vinyl Gloves – S",
            "Vinyl Gloves – XL"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Hygiene and protection/Gloves/$loopIndex.jpeg"))
              .toList(),
          [
            "Dust Bin with Pedal 30L",
            "Garbage Bin with Pedal 45L Yellow",
            "Garbage Bin with Pedal 50L",
            "Garbage Bin with Pedal 68L",
            "Garbage Bin with Pedal 80L",
            "Garbage Bin with Pedal 120L",
            "Garbage Bin with Pedal 240L",
            "Plastic Garbage Bin with Pedal 87L",
            "Stainless Steel Garbage Bin 40L",
            "Stainless Steel Garbage Bin 60L"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Hygiene and protection/Hygiene/$loopIndex.jpeg"))
              .toList(),
        ],
        [
          [
            "Kraft Cake Box Round Window 35x35CM",
            "Kraft Paper Cake Base 9X9CM",
            "Kraft Paper Cake Base 16X9CM",
            "Kraft Paper Cake Base 17X16CM",
            "Kraft Paper Cake Base 19X19CM",
            "Kraft Paper Cake Base 20X17CM",
            "Kraft Paper Cake Base 22.5X10.3CM",
            "Kraft Paper Cake Base 23X23CM",
            "Kraft Paper Cake Base 27X27CM",
            "Plain White Cake Box 35X35X12CM",
            "White Light Duty Paper Plate 79/inch"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/paper products/Baking Range/$loopIndex.jpeg"))
              .toList(),
          [
            "Brown Top Lunch Box 195 oz",
            "Brown Top Square Box 16 oz",
            "Brown Top Square Box 26 oz",
            "Brown Top Square Box 32 oz",
            "Brown Top Take Away Box 22 oz",
            "Brown Top Take Away Box 32 oz",
            "Brown Top Take Away Box 36 oz",
            "Brown Top Take Away Box 56 oz",
            "Brown Top Take Away Box 72 oz",
            "Brown Top Windw Lunch Box 150 oz",
            "Brown Top Windw Lunch Box 180 oz",
            "Brown Top Windw Lunch Box 195 oz",
            "HP Kraft Paper Pasta/Soup Bowl 16OZ",
            "Brown Top Windw Lunch Box 250 oz",
            "Kraft Noodle Bowl 12oz",
            "Kraft Noodle Bowl 16oz",
            "Kraft Noodle Bowl 26oz",
            "Kraft Noodle Bowl 32oz",
            "Kraft Paper Pasta/Soup Bowl 12OZ",
            "Kraft Paper Pasta/Soup Bowl 20OZ",
            "Kraft Paper Pasta/Soup Bowl 24OZ",
            "Kraft Paper Salad Bowl 20oz",
            "Kraft Paper Salad Bowl 26oz",
            "Kraft Paper Salad Bowl 32oz",
            "Kraft Paper Salad Bowl 37oz",
            "Kraft Paper Salad Bowl 45oz",
            "Kraft PE Lnch Box Window 195 oz",
            "Kraft PE Lnch Box with Windw 180 oz",
            "Krat Paper Salad Bowl 20oz",
            "PP Lid for Kraft Pasta/Soup Bowl",
            "Printed Paper Popcorn Tub 85oz",
            "Printed Paper Popcorn Tubs 64oz",
            "Printed Popcorn Round Tub 32oz",
            "Printed Popcorn Tubs 24oz",
            "Printed Popcorn Tubs 130oz",
            "Printed Square Popcorn Tub 32oz",
            "White Paper Noodle Bowl 16oz",
            "White Paper Noodle Bowl 26oz",
            "White Paper Noodle Bowl 32oz",
            "White Paper Pail Box Round 16oz",
            "White Paper Pail Box Round 26oz",
            "White Paper Pail Box Round 32oz",
            "White Paper Salad Bowl 26oz",
            "White Paper Salad Bowl 32oz",
            "White Paper Soup Bowl 250ml",
            "White Paper Soup Bowl 400ml",
            "White Paper Soup Bowl 500ml",
            "White Paper Soup Bowl 750ml",
            "White Paper Soup Bowl 900ml",
            "White Paper Soup Bowl 1100ml",
            "Yellow Printed Popcorn Round Tub 46oz"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image: "assets/images/paper products/Bowls/$loopIndex.jpeg"))
              .toList(),
          [
            "Brown Top Lunch Box 120 oz",
            "Brown Top Lunch Box 150 oz",
            "Brown Top Lunch Box 180 oz",
            "Brown Top Lunch Box 195 oz",
            "Brown Top Square Box 16 oz",
            "Brown Top Square Box 26 oz",
            "Brown Top Square Box 32 oz",
            "Brown Top Take Away Box 22 oz",
            "Brown Top Take Away Box 32 oz",
            "Brown Top Take Away Box 36 oz",
            "Brown Top Take Away Box 56 oz",
            "Brown Top Take Away Box 72 oz",
            "BROWN TOP WINDW LUNCH BOX 120 OZ",
            "Brown Top Windw Lunch Box 150 oz",
            "Brown Top Windw Lunch Box 180 oz",
            "Brown Top Windw Lunch Box 195 oz",
            "Kraft 9” One Side Open Tray 230X70X50MM",
            "Kraft Carry Pack Large 265X128X180MM",
            "Kraft Flute Punnet 1KG",
            "Kraft Flute Punnet 1KG+Handle",
            "Kraft Flute Punnet 250GRM+Window",
            "Kraft Flute Punnet 500GRM+Window",
            "Kraft Flute Punnett 100GRM+Window",
            "Kraft Flute Punnett+Handle 1KG",
            "Kraft Flute Tray 27X17X8MM",
            "Kraft PE Lnch Box with Windw 120 oz",
            "Kraft PE Lnch Bx Window 150 oz",
            "Kraft PE Lunch Box 120 oz",
            "Kraft PE Lunch Box 150 oz",
            "Kraft PE Lunch Box 180 oz",
            "Kraft PE Lunch Box 195 oz",
            "Kraft PE Lunch Box Window 195 oz",
            "Kraft PE Lunch Box with Window 180 oz",
            "Kraft PE Square Box 8 oz",
            "Kraft PE Square Box 16 oz",
            "Kraft PE Square Box 26 oz",
            "Kraft PE Square Box 32 oz",
            "Kraft PE Take Away Box 22 oz",
            "KRAFT PE TAKE AWAY BOX 32 OZ",
            "KRAFT PE TAKE AWAY BOX 36 OZ",
            "Kraft PE Take Away Box 56 oz",
            "Kraft PE Take Away Box 72 oz",
            "Kraft Rect. Salad Box 17X11CM with Window",
            "Kraft Square Salad Box+Window 105X105MM",
            "Kraft Square Salad Box+Window 125X125MM",
            "Kraft Square Salad Box+Window 140X140MM",
            "Kraft Square Salad Box+Window 160X160MM"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image: "assets/images/paper products/Boxes/$loopIndex.jpeg"))
              .toList(),
          [
            "Brown Pizza Box Liner Small/Medium/Large",
            "French Fries Pouch Large",
            "French Fries Pouch Small",
            "French Fries Scoop 16/12 oz",
            "Kraft Boat Tray Small/Medium/Large",
            "Kraft Carry Pack Small",
            "Kraft Flute Burger Box Double",
            "Kraft Flute Burger Box Single",
            "Kraft Flute Chip Box",
            "Kraft Flute Hotdog Box 208X75X70MM",
            "Kraft French Fries Pouch Large",
            "Kraft French Fries Pouch Small",
            "Kraft Long Sandwich Box with Window",
            "Kraft Noodle Bowl 12/8oz",
            "Kraft Paper Hotdog Box with Window",
            "Kraft Paper Sandwich Wedge Double",
            "Kraft Paper Sandwich Wedge Single",
            "Kraft Pillow Pack 114X227X44MM",
            "Kraft Sandwich Wedge Window Large",
            "Kraft Wrap Box with Window",
            "Paper Plain Brown Pocket Wrap Small/Large 1000",
            "Paper Plain White Pocket Wrap Small/Large",
            "Paper Printed Pocket Wrap Small",
            "PET Flat Lid for Paper Cold Cup 12 oz",
            "PET Flat Lid for Paper Cold Cup",
            "Plain Brown Pizza Box Small/Midum/Large",
            "Printed Chicken Bucket Large-Size 170/130/85oz",
            "Printed Paper Chicken Bucket 64oz",
            "Printed Paper Dinner Box Small/Medium",
            "Printed Paper Ice Cream Cup 16/13/8/4oz",
            "Purple Paper Straw 6mm",
            "White Biodegradable Lid Dia 90/80mm",
            "White Chicken Bucket 170/130/85oz",
            "White French Fries Scoop Large",
            "White French Fries Scoop",
            "White Ice Cream Bowl 16/13/8/4oz",
            "White Noodle Bowl 12/8oz",
            "White Paper Boat Tray Small/Medium/Large",
            "White Paper Straw 8/7mm",
            "White Paper Straw with Wrap 8/7/6mm",
            "White Pizza Box Liner Small/Midum/Large",
            "White Reclosable Travel Lid for 16/12/8/4oz"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/paper products/Concession Supplies/$loopIndex.jpeg"))
              .toList(),
          [
            "Black 16/12/8/4oz Ripple Wrap Cup",
            "Black Double Wall Paper Cup 16/12/8/4oz",
            "Black Reclosable Travel Lid for 16/12/8/4oz",
            "Brown Kraft Paper Heavy Duty Cup 20/16/12/10/8/4oz",
            "Kraft Corrugated 2 Cup Holder",
            "Kraft Corrugated 4 Cup Holder",
            "Kraft Paper Portion Cup 60ml",
            "Kraft Paper Portion Cup 90ml",
            "Kraft Paper Portion Cup 120ml",
            "Kraft Printed Hot Sleeves (Cup Buddies) 8oz",
            "Kraft Printed Hot Sleeves (Cup Buddies) 16/12oz",
            "Kraft/Brown Ripple Wrap Cup 16/12/8/4oz",
            "Printed Double Wall Paper Cup 16/12/8/4oz",
            "Printed Juice Cup 2 Cups Carrier",
            "Printed Juice Cup 4 Cups Carrier",
            "Printed Paper Cup with Handle 9/7oz",
            "Printed Paper Heavy Duty Cup 20/16/12/8/4oz",
            "Printed Paper Juice Cup 22/16/12oz",
            "Printed Paper Ripple Wrap Corrugated Cup 16/12/8/4oz",
            "White Double Wall Paper Cup 16/12/8/4oz",
            "White Juice Cup 2 Cup Carrier",
            "White Juice Cup 4 Cup Carrier",
            "White Paper Cup 9/7oz with Handle",
            "White Paper Heavy Duty Cup 20/16/1012/8/4oz",
            "White Paper Juice Cup 22/16/12oz",
            "White Paper Ripple Wrap Cup 16/12/8/4oz"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image: "assets/images/paper products/Cups/$loopIndex.jpeg"))
              .toList(),
          [
            "Brown Flat Paper Bags No-1 to 7 4Kg",
            "Brown Paper Bag Twisted Handle 32X12X36",
            "Brown Paper Bag Twisted Handle 32X16X33cm",
            "Brown Paper Bag Twisted Handle 34X18X33.5CM",
            "Brown Square Bottom Paper Bag (Small/Medium/Large)",
            "Flat Paper Bag White No-1 to 7 (4Kg)",
            "White Square Bottom Paper Bag (Small/Medium/Large)"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/paper products/Paper Bags/$loopIndex.jpeg"))
              .toList(),
          [
            "Alum/Gold Sweet Box w/Window 10*15CM",
            "Alum/Gold Sweet Box w/Window 10*20CM",
            "Alum/Gold Sweet Box w/Window 20*20CM",
            "Alum/Gold Sweet Box w/Window 10*25CM",
            "Alum/Gold Sweet Box w/Window 25*25CM",
            "Kraft Flute Tray 130 1#X91X50MM",
            "Kraft Flute Tray 178 2#X178X45MM",
            "Kraft Flute Tray 180 3#X134X45MM",
            "Kraft Flute Tray 152 4#X228X45MM",
            "Kraft Natural Window Box 13x12x5CM",
            "Kraft Natural Window Box 16x11x10CM",
            "Kraft Natural Window Box 18x10x8CM",
            "Kraft Natural Window Box 19x10x10CM",
            "Kraft Natural Window Box 10.5×20x5CM",
            "Kraft Natural Window Box 20x20x6CM",
            "Kraft Natural Window Box 23x23x6CM",
            "Kraft Natural Window Box 24x24x10CM",
            "Kraft Natural Window Box 28x28x5CM",
            "Kraft Natural Window Box 28x28x10CM",
            "Kraft Natural Window Box 30x14x5CM",
            "White Sweet Box PE Coated w/Window 10*15CM",
            "White Sweet Box PE Coated w/Window 15*15CM",
            "White Sweet Box PE Coated w/Window 10*20CM",
            "White Sweet Box PE Coated w/Window 20*20CM",
            "White Sweet Box PE Coated w/Window 10*25CM",
            "White Sweet Box PE Coated w/Window 25*25CM"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/paper products/Sweet Boxes/$loopIndex.jpeg"))
              .toList(),
        ],
        [
          [
            "Wooden Boat Tray 80x45mm",
            "Wooden Boat Tray 170x97mm",
            "Wooden Boat Tray 220x115mm",
            "Wooden Boat Tray 245x115mm",
            "Wooden Cone 85x60mm",
            "Wooden Cone 125x85mm",
            "Wooden Cone 180x130mm"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Wooden Products/Concession Trays/$loopIndex.jpeg"))
              .toList(),
          [
            "Wooden Cutlery Pack Wrapped Spoon/Fork/Knife",
            "Wooden Fork Plastic Wrap",
            "Wooden Knife Plastic Wrap",
            "Wooden Spoon Plastic Wrap"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Wooden Products/Cutleries/$loopIndex.jpeg"))
              .toList(),
          [
            "Bamboo Chopstick 23cm Black Wrapped",
            "Bamboo Chopstick 24cm Wrapped",
            "Bamboo Flag Skewer 20cm",
            "Bamboo Kebab Stick 50cm",
            "Bamboo Knotted Skewer 15cm",
            "Barbeque Skewers 12′′ x 5mm",
            "Cocktail (Parasol) Umbrella",
            "wooden coffee stirrer 14cm 10000 pcs",
            "Minted Toothpick",
            "Wooden Coffee Stirrers 17cm",
            "Wooden Frill Picks Paper 10cm",
            "Wooden Stirrers 19cm Individually Wrapped",
            "Wooden Toothpick",
            "Wrapped Tooth Picks"
          ]
              .map((e) => PackagingModel(
                  title: e,
                  image:
                      "assets/images/Wooden Products/Sticks & Skewers/$loopIndex.jpeg"))
              .toList()
        ]
      ];
}
