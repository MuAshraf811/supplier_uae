import 'package:supplier/core/utils/models/detailed_category_model.dart';

class CategoryConstants {
  static final printing = [
    DetailedCategoryModel(
      title: "Offset Print",
      radioOptions: [
        "Business Card",
        "Flyer",
        "Brochure",
        "Letterhead",
        "Envelope",
        "Nootbook",
        "Invoice Book",
        "Reciept Voucher",
        "Payment Voucher",
        "Captain Order",
        "Paper Sticker",
        "Pvc Sticker",
        "Menu",
        "Lather Menu / Folder",
        "Catalogue",
        "Business Profile",
        "Label"
      ],
      details: [
        {
          "title": "Business Card",
          "details": {
            "Size": ["5x9", "4.5x8.5"],
            "Printing": [1, 2, 3, 4],
            "Paper": [
              25,
              30,
              35,
              45,
              55,
              80,
              90,
              100,
              115,
              135,
              150,
              170,
              200,
              250, 
              300,
              350
            ],
            "Lamination": ["Glossy", "Matt", "Non"],
            "Cutting": ["Shape", "Normal", "Curve"],
            "Quantity": [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            "Foil": ["Gold", "Silver", "Special", "Non"],
            "Spot UV": ["Yes", "No"],
          },
          "isRequired": false,
        },
        {
          "title": "Flyer",
          "details": {
            "Size": ["A3", "A4", "A5", "A6"],
            "Printing": [1, 2, 3, 4],
            "Paper": [
              25,
              30,
              35,
              45,
              55,
              80,
              90,
              100,
              115,
              135,
              150,
              170,
              200,
              250, 
              300,
              350
            ],
            "Lamination": ["Glossy", "Matt", "Non"],
            "Folding": [ "2 fold","3 fold", "4 fold"],
            "Quantity": [500, 1000, 1500, 2000, 5000, 10000],
          },
          "other": {
            "Dai Cutt": ["Yes", "No"],
            "Spot UV": ["Yes", "No"],
          },
          "isRequired": false,
        },
        {
          "title": "Brochure",
          "details": {
            "Size": ["A4", "A3", "A5", "A6"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Lamination": ["Glossy", "Matt", "Non"],
            "Folding": ["2 fold", "3 fold", "4 fold"],
            "Quantity": [500, 1000, 1500, 2000, 5000, 10000],
          },
          "other": {
            "Dai Cutt": ["yes", "No"],
            "Spot UV": ["Yes", "No"],
          },
          "isRequired": false,
        },
        {
          "title": "Letterhead",
          "details": {
            "Size": ["A4", "A3", "A5", "A6"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Material": ["Normal", "Special", "Concord"],
            "Quantity": [500,1000, 3000,  5000, 10000, 15000],
          },
          "other": {
            "Foil": ["Non", "silver", "Gold"],
            "Emboss": ["Yes", "No"],
          },
          "isRequired": false,
        },
        {
          "title": "Envelope",
          "details": {
            "Size": ["DL", "A4", "A5", "A3"],
            "Printing": [1, 2, 3, 4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Material": ["Hispapel", "Special", "Normal"],
            "Folding": ["3 fold", "4 fold", "Non"],
            "Quantity": [1000, 3000,  5000, 10000, 15000],
          },
          "other": {
            "Foil": ["Non", "Silver", "Gold"],
            "Emboss": ["Yes" ,"No" ],
          },
          "isRequired": false,
        },
        {
          "title": "Noot Book",
          "details": {
            "Size": ["A5", "A4", "A6"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Lamination": ["Glossy", "Matt" , "Non"],
            "Folding": ["3 fold", "4 fold", "Non"],
            "Quantity": [1000, 2000, 3000, 4000, 5000],
          },
          "other": {
            "Dai Cutt": ["Non", "Yes"],
            "Spot UV": ["Yes", "No"],
          },
          "isRequired": true,
        },
        {
          "title": "Invoice Book",
          "details": {
            "Size": ["A4", "A3", "A5", "A6"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Material": ["NCR", "Normal"],
            "Sheet": ["25 Sheet", "50 Sheet"],
            "Quantity": [10, 20, 30, 40],
          },
          "other": {
            "Copy": ["1+1", "1+2", "1+3"],
            "Creasing": ["Yes", "No"],
          },
          "isRequired": false,
        },
        {
          "title": "Reciept Voucher",
          "details": {
            "Size": ["A4", "A3", "A5", "A6"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Material": ["Ncr" , 'Normal'],
            "Book": ["25 Sheet", "50 Sheet"],
            "Quantity": [10, 20, 30, 40],
          },
          "other": {
            "Copy": ["1+1", "1+2", "1+3"],
            "Creasing": ["Yes", "No"],
          },
          "isRequired": false,
        },
        {
          "title": "Payment Voucher",
          "details": {
            "Size": ["A4", "A3", "A5", "A6"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Material": ["Ncr", "Normal"],
            "Book": ["25 Sheet", "50 Sheet"],
            "Quantity": [10, 20, 30, 40],
          },
          "other": {
            "Copy": ["1+1", "1+2", "1+3"],
            "Creasing": ["Yes", "No"],
          },
          "isRequired": false,
        },
        {
          "title": "Captain Order",
          "details": {
            "Size": ["A4", "A3", "A5", "A6"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Material": ["Ncr", "Normal"],
            "Book": ["25 Sheet", "50 Sheet"],
            "Quantity": [10, 20, 30, 40],
          },
          "other": {
            "Copy": ["1+1", "1+2", "1+3"],
            "Creasing": ["Yes", "No"],
          },
          "isRequired": false,
        },
        {
          "title": "Paper Sticker",
          "details": {
            "Size": ["A4", "A3", "A5", "A6"],
            "Printing": [1, 2, 3, 4],
            "Lamination": ["Glossy", "Matt", "Non"],
            "Material": ["Adestor","China"],
            "Quantity": [5000, 6000, 7000, 8000, 9000, 10000],
          },
          "other": {
            "Dai Cutt": ["Yes", "No"],
            "Type": ["pcs", "Sheet"],
          },
          "isRequired": true,
        },
        {
          "title": "PVC Sticker",
          "details": {
            "Size": ["A4", "A6", "A5", "A3"],
            "Printing": [1, 2, 3,4],
            "Lamination": ["Glossy", "Matt", "Non"],
            "Quantity": [1000, 5000, 6000, 7000, 8000, 9000, 10000],
          },
          "other": {
            "Dai Cutt": ["Yes", "No"],
            "Type": ["Pvc", "Paper"],
          },
          "isRequired": true,
        },
        {
          "title": "Menu",
          "details": {
            "Size": ["A4", "A3", "A5"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Lamination": ["Glossy", "Matt", "Non"],
            "Creasing": ["Yes", "No"],
            "Pages": [20, 30, 40, 50, 60, 70, 80],
            "Quantity": ["30 set", "40 set", "50 set"],
          },
          "other": {
            "Dai Cutt": ["Yes", "No"],
            "Foil": ["Gold", "Silver", "Non"],
          },
          "isRequired": true,
        },
        {
          "title": "Lather Menu / Folder",
          "details": {
            "Type": ["Lather Menu", "Lather Folder"],
          },
          "other": {},
          "isRequired": true,
        },
        {
          "title": "Catalogue",
          "details": {
            "Size": ["A4", "A3", "A5"],
            "Printing": [1, 2, 3,4],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Lamination": ["Glossy", "Matt", "Non"],
            "Creasing": ["Yes", "No"],
            "Pages": [20, 30, 40, 50, 60, 70],
            "Quantity": [1000, 5000, 6000, 7000, 8000, 9000, 10000],
          },
          "other": {
            "Dai Cutt": ["Yes", "No"],
            "Foil": ["Silver", "Gold", "Non"],
          },
          "isRequired": true,
        },
        {
          "title": "Business Profile",
          "details": {
            "Size": ["A4", "A3", "A5"],
            "Printing": [1, 2, 3],
            "Paper": [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            "Lamination": ["Glossy", "Matt"],
            "Creasing": ["Yes", "No", "Non"],
            "Pages": [20, 30, 40, 50, 60, 70],
            "Quantity": [5000, 6000, 7000, 8000, 9000, 10000],
          },
          "other": {
            "Dai Cutt": ["Yes", "No"],
             "Foil": ["Silver", "Gold", "Non"],
          },
          "isRequired": true,
        },
        {
          "title": "Label",
          "details": {},
          "other": {},
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Carton Boxes",
      radioOptions: [
        "Pizza Box",
        "Lunch Box",
        "Meal Box",
        "Sandwich Box",
        "Duplex Box"
      ],
      details: [
        {
          "title": "Pizza Box",
          "details": {
            "height": [4,5,6,7,8,9,10],
            "width": [23, 28, 33, ],
            "Length": [23, 28, 33, ],
            "Printing": [1, 2, 3, 4],
            "Carton": ["3 Ply", "5 Ply"],
            "OutSide": ["Brown", "White"],
            "Inside": ["Brown", "White"],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            "Inside Print": ["1 Color", "2 Colors", "3 Colors", "4 Colors", "Non"],
            "Packing": [50,100],
          },
          "isRequired": true,
        },
        {
          "title": "Lunch Box",
          "details": {
            "height": [5, 6, 7, 8, 9],
            "width": [5, 6, 7, 8, 9],
            "Length": [5, 6, 7, 8, 9],
            "Printing": [1, 2, 3, 4],
            "Carton": ["3 Ply", "5 ply"],
            "OutSide": ["Brown", "White","duplex"],
            "Inside": ["Brown", "White"],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            "Inside Print": ["1 Color", "2 Colors", "3 Colors", "4 Colors"],
            "Packing": [50,100],
          },
          "isRequired": true,
        },
        {
          "title": "Meal Box",
          "details": {
            "height": [5, 6, 7, 8, 9],
            "width": [5, 6, 7, 8, 9],
            "Length": [5, 6, 7, 8, 9],
            "Printing": [1, 2, 3, 4],
            "Carton": ["3 Ply" , "5 ply"],
            "OutSide": ["Brown", "White"],
            "Inside": ["Brown", "White"],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            "Inside Print": ["1 Color", "2 Colors", "3 Colors", "4 Colors"],
            "Packing": [100],
          },
          "isRequired": true,
        },
        {
          "title": "Sandwich Box",
          "details": {
            "height": [5, 6, 7, 8, 9],
            "width": [5, 6, 7, 8, 9],
            "Length": [5, 6, 7, 8, 9],
            "Printing": [1, 2, 3, 4],
            "Carton": ["3 Ply", "4 ply"],
            "OutSide": ["Brown", "White"],
            "Inside": ["Brown", "White"],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            "Inside Print": ["1 Color", "2 Colors", "3 Colors", "4 Colors"],
            "Packing": [50,100],
          },
          "isRequired": true,
        },
        {
          "title": "Duplex Box",
          "details": {
            "height": [5, 6, 7, 8, 9],
            "width": [5, 6, 7, 8, 9],
            "Length": [5, 6, 7, 8, 9],
            "Printing": [1, 2, 3, 4],
            "Carton": ["3 Ply", "5 ply"],
            "OutSide": ["Brown", "White", "Duplex"],
            "Inside": ["Brown", "White"],
            "Print": ["Offset" , "Flexo"],
            "Quantity": [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            "Inside Print": ["1 Color", "2 Colors", "3 Colors", "4 Colors"],
            "Packing": [50,100],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Paper Boxes",
      radioOptions: [
        "Burger Box",
        "Salad Box",
        "Manakish Box",
        "Sandwich Box",
        "Take Away Box",
        "Noodles Box"
      ],
      details: [
        {
          "title": "Burger Box",
          "details": {
            "Type": ["Food Board", "Kraft"],
            "Size": ["Standerd", "Customize"],
            "Printing": ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            "Paper": [250,300,350],
            "Lamination": ["Non", "Glossy", "Matt"],
            "Shape": ["Normal", "Cusotomize"],
            "Quantity": [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            "Emboss": ["Yes", "Non"],
            "Packing": [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Salad Box",
          "details": {
            "Type": ["Food Board", "Kraft"],
            "Size": ["Stander", "Customize"],
            "Printing": ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            "Paper": [250,300,350],
            "Lamination": ["Non", "Glossy", "Matt"],
            "Shape": [500, 1000, 1500, 2000],
            "Quantity": [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            "Emboss": ["Yes", "Non"],
            "Packing": [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Manakish Box",
          "details": {
            "Type": ["Food Board", "Kraft"],
            "Size": ["Stander", "Customize"],
            "Printing": ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            "Paper": [250,300,350],
            "Lamination": ["Non", "Glossy", "Matt"],
            "Shape": [500, 1000, 1500, 2000],
            "Quantity": [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            "Emboss": ["Yes", "Non"],
            "Packing": [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Sandwich Box",
          "details": {
               "Type": ["Food Board", "Kraft"],
            "Size": ["Stander", "Customize"],
            "Printing": ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            "Paper": [250,300,350],
            "Lamination": ["Non", "Glossy", "Matt"],
            "Shape": [500, 1000, 1500, 2000],
            "Quantity": [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            "Emboss": ["Yes", "Non"],
            "Packing": [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Take Away Box",
         "details": {
               "Type": ["Food Board", "Kraft"],
            "Size": ["Stander", "Customize"],
            "Printing": ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            "Paper": [250,300,350],
            "Lamination": ["Non", "Glossy", "Matt"],
            "Shape": [500, 1000, 1500, 2000],
            "Quantity": [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            "Emboss": ["Yes", "Non"],
            "Packing": [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Noodles Box",
          "details": {
               "Type": ["Food Board", "Kraft"],
            "Size": ["Stander", "Customize"],
            "Printing": ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            "Paper": [250,300,350],
            "Lamination": ["Non", "Glossy", "Matt"],
            "Shape": [500, 1000, 1500, 2000],
            "Quantity": [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            "Emboss": ["Yes", "Non"],
            "Packing": [ 250, 350,500],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Wrapping Paper",
      radioOptions: [
        "Sandwich Paper",
        "L Shape Paper",
        "Sandwich Pouch",
        "Wrapping Roll",
        "Sweet Roll"
      ],
      details: [
        {
          "title": "Sandwich Paper",
          "details": {
            "height": [25, 35, 50],
            "width": [25, 35, 50],
            "Paper": [25, 30, 35, 40, 45, 50,55],
            "Printing": [1, 2, 3,4],
            "Quantity": [30000, 40000, 50000, 60000, 70000, 80000],
            "Cutting": ["Auto Sel", 'Normal'],
          },
          "other": {
            "Block": ["Normal", "Laser"],
            "Packing": [1000, 2000],
          },
          "isRequired": false,
        },
        {
          "title": "L Shape Paper",
          "details": {
            "height": [10, 12, 15, 17],
            "width": [10, 12, 15, 17],
            "Paper": [25, 30, 35, 40, 45, 50],
            "Printing": [1, 2, 3,4],
            "Quantity": [30000, 40000, 50000, 60000, 70000, 80000],
            "Cutting": ["Auto Sel", "Normal"],
          },
          "other": {
            "Block": ["Normal", "Laser"],
            "Packing": [1000, 2000],
          },
          "isRequired": false,
        },
        {
          "title": "Sandwich Pouch",
          "details": {
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Paper": [25, 30, 35, 40, 45, 50],
            "Printing": [1, 2, 3,4],
            "Quantity": [30000, 40000, 50000, 60000, 70000, 80000],
            "Cutting": ["Auto Sel", "Normal"],
          },
          "other": {
            "Block": ["Normal", "Laser"],
            "Packing": [1000, 2000],
          },
          "isRequired": true,
        },
        {
          "title": "Wrapping Roll",
          "details": {
           
          },
          "other": {
            "Block": ["Normal", "Laser"],
            "Packing": [1000, 2000],
          },
          "isRequired": true,
        },
        {
          "title": "Sweet Roll",
          "details": {
           
          },
          "other": {
            "Block": ["Laaser", "Laser"],
            "Packing": [1000, 2000],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Coffee Bag",
      radioOptions: [
        "Coffee Bag With Zipper",
        "Coffee Bag With Filter",
        "Plastic Coffee Bag",
        "Paper Coffee Bag",
      ],
      details: [
        {
          "title": "Coffee Bag With Zipper",
          "details": {
            "height": [25, 30, 35, 40, 45],
            "Width": [25, 30, 35, 40, 45],
            "Bottom": [10, 20, 30],
            "Printing": [1, 2, 3,4],
            "PE": ["yes", "No"],
            "Celinder": ["Steel", "Normal"],
            "Quantity": [10000, 15000, 20000, 25000],
          },
          "other": {
            "Spot UV": ["yes", "No"],
            "Packing": ["250 pcs", "500 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Coffee Bag With Filter",
          "details": {
           "height": [25, 30, 35, 40, 45],
            "Width": [25, 30, 35, 40, 45],
            "Bottom": [10, 20, 30],
            "Printing": [1, 2, 3,4],
            "PE": ["yes", "No"],
            "Celinder": ["Steel", "Normal"],
            "Quantity": [10000, 15000, 20000, 25000],
          },
          "other": {
            "Spot UV": ["yes", "No"],
            "Packing": ["250 pcs", "500 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Paper Coffee Bag ",
          "details": {
           "height": [25, 30, 35, 40, 45],
            "Width": [25, 30, 35, 40, 45],
            "Bottom": [10, 20, 30],
            "Printing": [1, 2, 3,4],
            "PE": ["yes", "No"],
            "Celinder": ["Steel", "Normal"],
            "Quantity": [10000, 15000, 20000, 25000],
          },
          "other": {
            "Spot UV": ["yes", "No"],
            "Packing": ["250 pcs", "500 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Plastic Coffee Bag ",
          "details": {
           "height": [25, 30, 35, 40, 45],
            "Width": [25, 30, 35, 40, 45],
            "Bottom": [10, 20, 30],
            "Printing": [1, 2, 3,4],
            "PE": ["yes", "No"],
            "Celinder": ["Steel", "Normal"],
            "Quantity": [10000, 15000, 20000, 25000],
          },
          "other": {
            "Spot UV": ["yes", "No"],
            "Packing": ["250 pcs", "500 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Shopping Bag",
      radioOptions: [
        "Shopping Bag CardBoard",
        "Shopping Bag as Request",
      ],
      details: [
        {
          "title": "Shopping Bag CardBoard",
          "details": {
            "Color": ["White", "Brown"],
            "height": [25, 30, 35, 40, 45],
            "Width": [25, 30, 35, 40, 45],
            "Bottom": [10, 20, 30],
            "Printing": [1, 2, 3,4],
            "Handle": ["paper", "Rope"],
            "Block": ["Laser", "Normal"],
            "Quantity": [500, 1000, 1500, 2000],
          },
          "other": {
            "Print": ["Offset", "digital"],
            "Packing": ["1*200 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Shopping Bag as Request",
          "details": {
            "Color": ["White", "Brown"],
            "height": [25, 30, 35, 40, 45],
            "Width": [25, 30, 35, 40, 45],
            "Bottom": [10, 20, 30],
            "Printing": [1, 2, 3,4],
            "Handle": ["paper", "Rope"],
            "Block": ["Laser", "Normal"],
            "Quantity": [500, 1000, 1500, 2000],
          },
          "other": {
            "Print": ["Offset", "digital"],
            "Packing": ["1*200 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Kraft Paper Bags",
      radioOptions: [
        "Kraft Paper Bags With Twisted Handle",
        "Kraft Paper Bags Square Bottom (SOS)",
        "Kraft Paper Bags Flat",
        "Kraft Paper Bags Flat With Window",
      ],
      details: [
        {
          "title": "Kraft Paper Bags With Twisted Handle",
          "details": {
            "Color": ["White", "Brown"],
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Bottom": [25, 30, 35, 40],
            "Printing": [1, 2, 3,4],
            "Handle": ["Paper",],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 5000, 10000],
          },
          "other": {
            "Print": ["Offset", "flexo"],
            "Packing": [250],
          },
          "isRequired": true,
        },
        {
          "title": "Kraft Paper Bags Square Bottom (SOS)",
           "details": {
            "Color": ["White", "Brown"],
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Bottom": [25, 30, 35, 40],
            "Printing": [1, 2, 3,4],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 5000, 10000],
          },
          "other": {
            "Print": ["Offset", "flexo"],
            "Packing": [250],
          },
          "isRequired": true,
        },
        {
          "title": "Kraft Paper Bags Flat",
           "details": {
            "Color": ["White", "Brown"],
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Printing": [1, 2, 3,4],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 5000, 10000],
          },
          "other": {
            "Print": ["Offset", "flexo"],
            "Packing": [250],
          },
          "isRequired": true,
        },
        {
          "title": "Kraft Paper Bags Flat With Window",
          "details": {
            "Color": ["White", "Brown"],
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Printing": [1, 2, 3,4],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 5000, 10000],
          },
          "other": {
            "Print": ["Offset", "flexo"],
            "Packing": [250],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Canavas Bag",
      radioOptions: [
        "Canavas Bag With Handle",
        "Canavas Bag Square Bottom",
        "Canavas Bag Flat",
      ],
      details: [
        {
          "title": "Canavas Bag With Handle",
          "details": {
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Printing": [1, 2, 3,4],
            "Handle": ["Fabric"],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 2000, 5000, 10000],
          },
          "other": {
            "Print": ["Offset", "digital"],
            "Packing": [250],
          },
          "isRequired": true,
        },
        {
          "title": "Canavas Bag Square Bottom",
          "details": {
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Printing": [1, 2, 3,4],
            "Handle": ["Fabric"],
            "Block": ["Laser", "Normal"],
            "Quantity":[1000, 2000, 5000, 10000],
          },
          "other": {
            "Print": ["Offset", "digital"],
            "Packing": [250],
          },
          "isRequired": true,
        },
        {
          "title": "Canavas Bag Flat",
          "details": {
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Printing": [1, 2, 3],
            "Handle": ["Fabric"],
            "Block": ["Laser", "Normal"],
            "Quantity": [1000, 2000, 5000, 10000],
          },
          "other": {
            "Packing": [250],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Plastic Bag",
      radioOptions: [
        "Plastic Bag Hd",
        "Plastic Bag LD",
        "Courier Bag",
      ],
      details: [
        {
          "title": "Plastic Bag Hd",
          "details": {
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Gasset": [10, 20, 30],
            "Printing": [1, 2, 3,4],
            "Handle": ["Normal", "banana"],
            "Block": ["Laser", "Normal"],
            "Quantity": [250, 300, 500],
          },
          "other": {
            "Packing": ["50 Kg"],
          },
          "isRequired": true,
        },
        {
          "title": "Plastic Bag LD",
          "details": {
            "height": [25, 30, 35, 40, 45],
            "width": [25, 30, 35, 40, 45],
            "Gasset": [10, 20, 30],
            "Printing": [1, 2, 3,4],
            "Handle": ["Normal", "banana"],
            "Block": ["Laser", "Normal"],
            "Quantity": [250, 300, 500],
          },
          "other": {
            "Packing": ["50 Kg"],
          },
          "isRequired": true,
        },
        {
          "title": "Courier Bag",
          "details": {
           
          },
          "other": {
          
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Paper Cup",
      radioOptions: [
        "Paper Cup Sigle Wall",
        "Paper Cup Double Wall",
        "Paper Cup Corrugated",
        "Ice Cream Cup",
        "Pop Corn Cup"
      ],
      details: [
        {
          "title": "Paper Cup Single Wall",
          "details": {
            "Size": [4, 6, 7, 8 , 9,12 ,14,16],
            "Lid": ["Yes", "No"],
            "Foil": ["Gold", "Silver", "Non"],
            "Printing": [1, 2, 3,4],
            "Block": ["Laser", "Normal"],
            "Quantity": [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            "Emboss": ["Yes", "No"],
            "Packing": ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Paper Cup double Wall",
          "details": {
            "Size": [4, 6, 7, 8 , 9,12 ,14,16],
            "Lid": ["Yes", "No"],
            "Foil": ["Gold", "Silver", "Non"],
            "Printing": [1, 2, 3,4],
            "Block": ["Laser", "Normal"],
            "Quantity": [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            "Emboss": ["Yes", "No"],
            "Packing": ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Paper Cup Corrugated",
          "details": {
            "Size": [4, 6, 7, 8 , 9,12 ,14,16],
            "Lid": ["Yes", "No"],
            "Foil": ["Gold", "Silver", "Non"],
            "Printing": [1, 2, 3,4],
            "Block": ["Laser", "Normal"],
            "Quantity": [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            "Emboss": ["Yes", "No"],
            "Packing": ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Ice Cream Cup",
          "details": {
            "Size": ["120 ml", "250 ml", "400 ml", "500 ml"],
            "Lid": ["Yes", "No"],
            "Foil": ["Gold", "Silver", "Non"],
            "Printing": [1, 2, 3,4],
            "Block": ["Laser", "Normal"],
            "Quantity": [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            "Emboss": ["Yes", "No"],
            "Packing": ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Pop Corn Cup",
         "details": {
            "Size": ["24", "32", "46", "85", "130"],
            "Lid": ["Yes", "No"],
            "Foil": ["Gold", "Silver", "Non"],
            "Printing": [1, 2, 3,4],
            "Block": ["Laser", "Normal"],
            "Quantity": [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            "Emboss": ["Yes", "No"],
            "Packing": ["1x1000 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Plastic Cup",
      radioOptions: [
        "Plastic Cup PP",
        "Plastic Cup PET",
      ],
      details: [
        {
          "title": "Plastic Cup PP",
          "details": {
            "Size": [8, 10, 12, 14, 16,20 , 22],
            "Lid": ["Yes", "No"],
            "Foil": ['Silver', 'Gold', 'Non'],
            "Printing": [1, 2, 3],
            "Block": ["Laser", "Normal"],
            "Quantity": [5000, 10000, 20000, 30000],
          },
          "other": {
            "Emboss": ["Yes", "No"],
            "Packing": ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Plastic Cup PET",
          "details": {
            "Size": [8, 10, 12, 14, 16,20 , 22],
            "Lid": ["Yes", "No"],
            "Foil": ['Silver', 'Gold', 'Non'],
            "Printing": [1, 2, 3],
            "Block": ["Laser", "Normal"],
            "Quantity": [5000, 10000, 20000, 30000],
          },
          "other": {
            "Emboss": ["Yes", "No"],
            "Packing": ["1x1000 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Various Products",
      radioOptions: [
        "Cup Holder",
        "Sleeve",
        "Facial Tissue Printed",
        "Napkin Tissue Printed",
        "Wet Napkin Printed",
        "Printers Paper",
        "Thermal Paper For Printers"
      ],
      details: [
        {
          "title": "Plastic Cup PET",
          "details": {
            "Size": [8, 10, 12, 14, 16,20 , 22],
            "Lid": ["Yes", "No"],
            "Foil": ['Silver', 'Gold', 'Non'],
            "Printing": [1, 2, 3],
            "Block": ["Laser", "Normal"],
            "Quantity": [5000, 10000, 20000, 30000],
          },
          "other": {
            "Emboss": ["Yes", "No"],
            "Packing": ["1x1000 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
  ];
}
