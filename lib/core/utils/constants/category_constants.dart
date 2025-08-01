import 'package:flutter/material.dart';
import 'package:supplier_app/core/utils/models/detailed_category_model.dart';
import 'package:supplier_app/generated/l10n.dart';

class CategoryConstants {
  static List<DetailedCategoryModel> getPrintingCategories(BuildContext context) { 
    return[
    DetailedCategoryModel(
      title: S.of(context).offsetPrint,
      radioOptions: [
        S.of(context).businessCard,
          S.of(context).flyer,
          S.of(context).brochure,
          S.of(context).letterhead,
          S.of(context).envelope,
          S.of(context).notebook,
          S.of(context).invoiceBook,
          S.of(context).receiptVoucher,
          S.of(context).paymentVoucher,
          S.of(context).captainOrder,
          S.of(context).paperSticker,
          S.of(context).pvcSticker,
          S.of(context).menu,
          S.of(context).leatherMenuFolder,
          S.of(context).catalogue,
          S.of(context).businessProfile,
          S.of(context).label,
      ],
      details: [
        {
          "title": "Business Card",
          "details": {
           S.of(context).size: ["5x9", "4.5x8.5"],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).paper: [
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
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).cutting: [S.of(context).shape, S.of(context).normal, S.of(context).curve],
            S.of(context).quantity: [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            S.of(context).foil: [ S.of(context).gold, S.of(context).silver,S.of(context).special, S.of(context).non],
             S.of(context).spotUv: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": false,
        },
        {
          "title": "Flyer",
          "details": {
           S.of(context).size: ["A3", "A4", "A5", "A6"],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).paper: [
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
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).folding: [ "2 fold","3 fold", "4 fold"],
            S.of(context).quantity: [500, 1000, 1500, 2000, 5000, 10000],
          },
          "other": {
            "Dai Cutt": [ S.of(context).yes, S.of(context).no],
            S.of(context).spotUv: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": false,
        },
        {
          "title": "Brochure",
          "details": {
             S.of(context).size: ["A4", "A3", "A5", "A6"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).folding: ["2 fold", "3 fold", "4 fold"],
            S.of(context).quantity: [500, 1000, 1500, 2000, 5000, 10000],
          },
          "other": {
            "Dai Cutt": [ S.of(context).yes, S.of(context).no],
            S.of(context).spotUv: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": false,
        },
        {
          "title": "Letterhead",
          "details": {
            S.of(context).size: ["A4", "A3", "A5", "A6"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).material: [S.of(context).normal, S.of(context).special, "Concord"],
            S.of(context).quantity: [500,1000, 3000,  5000, 10000, 15000],
          },
          "other": {
            S.of(context).foil: [S.of(context).non, S.of(context).silver, S.of(context).gold],
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": false,
        },
        {
          "title": "Envelope",
          "details": {
            S.of(context).size: ["DL", "A4", "A5", "A3"],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).material: ["Hispapel", S.of(context).special, S.of(context).normal],
            S.of(context).folding: ["3 fold", "4 fold", S.of(context).non],
            S.of(context).quantity: [1000, 3000,  5000, 10000, 15000],
          },
          "other": {
            S.of(context).foil: [S.of(context).non, S.of(context).silver, S.of(context).gold],
            S.of(context).emboss: [S.of(context).yes ,"No" ],
          },
          "isRequired": false,
        },
        {
          "title": "Noot Book",
          "details": {
            S.of(context).size: ["A5", "A4", "A6"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).folding: ["3 fold", "4 fold", S.of(context).non],
            S.of(context).quantity: [1000, 2000, 3000, 4000, 5000],
          },
          "other": {
            "Dai Cutt": [S.of(context).non, S.of(context).yes],
            S.of(context).spotUv: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": true,
        },
        {
          "title": "Invoice Book",
          "details": {
             S.of(context).size: ["A4", "A3", "A5", "A6"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).material: ["NCR", S.of(context).normal],
            S.of(context).sheet: ["25 Sheet", "50 Sheet"],
            S.of(context).quantity: [10, 20, 30, 40],
          },
          "other": {
            S.of(context).copy: ["1+1", "1+2", "1+3"],
            S.of(context).creasing: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": false,
        },
        {
          "title": "Reciept Voucher",
          "details": {
            S.of(context).size: ["A4", "A3", "A5", "A6"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).material: ["Ncr" , S.of(context).normal],
            S.of(context).book: ["25 Sheet", "50 Sheet"],
            S.of(context).quantity: [10, 20, 30, 40],
          },
          "other": {
            S.of(context).copy: ["1+1", "1+2", "1+3"],
            S.of(context).creasing: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": false,
        },
        {
          "title": "Payment Voucher",
          "details": {
             S.of(context).size: ["A4", "A3", "A5", "A6"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).material: ["Ncr", S.of(context).normal],
            S.of(context).book: ["25 Sheet", "50 Sheet"],
            S.of(context).quantity: [10, 20, 30, 40],
          },
          "other": {
            S.of(context).copy: ["1+1", "1+2", "1+3"],
            S.of(context).creasing: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": false,
        },
        {
          "title": "Captain Order",
          "details": {
             S.of(context).size: ["A4", "A3", "A5", "A6"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).material: ["Ncr", S.of(context).normal],
            S.of(context).book: ["25 Sheet", "50 Sheet"],
            S.of(context).quantity: [10, 20, 30, 40],
          },
          "other": {
            S.of(context).copy: ["1+1", "1+2", "1+3"],
            S.of(context).creasing: [ S.of(context).yes, S.of(context).no],
          },
          "isRequired": false,
        },
        {
          "title": "Paper Sticker",
          "details": {
             S.of(context).size: ["A4", "A3", "A5", "A6"],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).material: ["Adestor","China"],
            S.of(context).quantity: [5000, 6000, 7000, 8000, 9000, 10000],
          },
          "other": {
            "Dai Cutt": [ S.of(context).yes, S.of(context).no],
            S.of(context).type: ["pcs", S.of(context).sheet],
          },
          "isRequired": true,
        },
        {
          "title": "PVC Sticker",
          "details": {
             S.of(context).size: ["A4", "A6", "A5", "A3"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).quantity: [1000, 5000, 6000, 7000, 8000, 9000, 10000],
          },
          "other": {
            "Dai Cutt": [ S.of(context).yes, S.of(context).no],
            S.of(context).type: ["Pvc", S.of(context).paper],
          },
          "isRequired": true,
        },
        {
          "title": "Menu",
          "details": {
            S.of(context).size: ["A4", "A3", "A5"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).creasing: [ S.of(context).yes, S.of(context).no],
            S.of(context).pages: [20, 30, 40, 50, 60, 70, 80],
            S.of(context).quantity: ["30 set", "40 set", "50 set"],
          },
          "other": {
            "Dai Cutt": [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).gold, S.of(context).silver, S.of(context).non],
          },
          "isRequired": true,
        },
        {
          "title": "Lather Menu / Folder",
          "details": {
            S.of(context).type: ["Lather Menu", "Lather Folder"],
          },
          "other": {},
          "isRequired": true,
        },
        {
          "title": "Catalogue",
          "details": {
             S.of(context).size: ["A4", "A3", "A5"],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).creasing: [ S.of(context).yes, S.of(context).no],
            S.of(context).pages: [20, 30, 40, 50, 60, 70],
            S.of(context).quantity: [1000, 5000, 6000, 7000, 8000, 9000, 10000],
          },
          "other": {
            "Dai Cutt": [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
          },
          "isRequired": true,
        },
        {
          "title": "Business Profile",
          "details": {
             S.of(context).size: ["A4", "A3", "A5"],
            S.of(context).printing: [1, 2, 3],
            S.of(context).paper: [55, 90, 100, 115, 135, 150, 170, 200, 250, 300, 350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt],
            S.of(context).creasing: [S.of(context).yes, "No", S.of(context).non],
            S.of(context).pages: [20, 30, 40, 50, 60, 70],
            S.of(context).quantity: [5000, 6000, 7000, 8000, 9000, 10000],
          },
          "other": {
            "Dai Cutt": [ S.of(context).yes, S.of(context).no],
             S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
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
        S.of(context).pizzaBox, 
        S.of(context).lunchBox,
        S.of(context).mealBox,
        S.of(context).sandwichBox,
        S.of(context).duplexBox

       
      ],
      details: [
        {
          "title": "Pizza Box",
          "details": {
            S.of(context).height: [4,5,6,7,8,9,10],
            S.of(context).width: [23, 28, 33, 35 , 40, 45 , 50 ],
            S.of(context).length: [23, 28, 33, 35 , 40 , 45 , 50],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).carton: ["3 Ply", "5 Ply"],
            S.of(context).outside: [S.of(context).brown, S.of(context).white],
            S.of(context).inside: [S.of(context).brown, S.of(context).white],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            S.of(context).inside_print: ["1 Color", "2 Colors", "3 Colors", "4 Colors", S.of(context).non],
            S.of(context).packing: [50,100],
          },
          "isRequired": true,
        },
        {
          "title": "Lunch Box",
          "details": {
            S.of(context).height: [5, 6, 7, 8, 9],
            S.of(context).width: [25,30,35,40,45,50,55,60],
            S.of(context).length:[25,30,35,40,45,50,55,60],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).carton: ["3 Ply", "5 ply"],
          S.of(context).outside: [S.of(context).brown, S.of(context).white,"duplex"],
            S.of(context).inside: [S.of(context).brown, S.of(context).white],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            S.of(context).inside_print: ["1 Color", "2 Colors", "3 Colors", "4 Colors"],
            S.of(context).packing: [50,100],
          },
          "isRequired": true,
        },
        {
          "title": "Meal Box",
          "details": {
            S.of(context).height: [5, 6, 7, 8, 9],
            S.of(context).width: [25,30,35,40,45,50,55,60],
            S.of(context).length: [25,30,35,40,45,50,55,60],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).carton: ["3 Ply" , "5 ply"],
            S.of(context).outside: [S.of(context).brown, S.of(context).white],
            S.of(context).inside: [S.of(context).brown, S.of(context).white],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            S.of(context).inside_print: ["1 Color", "2 Colors", "3 Colors", "4 Colors"],
            S.of(context).packing: [100],
          },
          "isRequired": true,
        },
        {
          "title": "Sandwich Box",
          "details": {
            S.of(context).height: [5, 6, 7, 8, 9],
            S.of(context).width:[25,30,35,40,45,50,55,60],
            S.of(context).length: [25,30,35,40,45,50,55,60],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).carton: ["3 Ply", "4 ply"],
            S.of(context).outside: [S.of(context).brown, S.of(context).white],
            S.of(context).inside: [S.of(context).brown, S.of(context).white],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            S.of(context).inside_print: ["1 Color", "2 Colors", "3 Colors", "4 Colors"],
            S.of(context).packing: [50,100],
          },
          "isRequired": true,
        },
        {
          "title": "Duplex Box",
          "details": {
            S.of(context).height: [5, 6, 7, 8, 9],
            S.of(context).width: [25,30,35,40,45,50,55,60],
            S.of(context).length: [25,30,35,40,45,50,55,60],
            S.of(context).printing: [1, 2, 3, 4],
            S.of(context).carton: ["3 Ply", "5 ply"],
            S.of(context).outside: [S.of(context).brown, S.of(context).white, "Duplex"],
            S.of(context).inside: [S.of(context).brown, S.of(context).white],
            S.of(context).printing: [S.of(context).offset , "Flexo"],
            S.of(context).quantity: [1000, 3000, 5000, 10000, 15000],
          },
          "other": {
            S.of(context).inside_print: ["1 Color", "2 Colors", "3 Colors", "4 Colors"],
            S.of(context).packing: [50,100],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Paper Boxes",
      radioOptions: [ 
        S.of(context).burgerBox,
        S.of(context).saladBox,
        S.of(context).manakishBox,
        S.of(context).sandwichBox,
        S.of(context).takeAwayBox,
        S.of(context).noodlesBox
      
      ],
      details: [
        {
          "title": "Burger Box",
          "details": {
            S.of(context).type: ["Food Board", "Kraft"],
             S.of(context).size: ["Standerd", "Customize"],
            S.of(context).printing: ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            S.of(context).paper: [250,300,350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).shape: [S.of(context).normal, "Cusotomize"],
            S.of(context).quantity: [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            S.of(context).emboss: [S.of(context).yes, S.of(context).non],
            S.of(context).packing: [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Salad Box",
          "details": {
            S.of(context).type: ["Food Board", "Kraft"],
             S.of(context).size: ["Stander", "Customize"],
            S.of(context).printing: ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            S.of(context).paper: [250,300,350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).quantity: [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            S.of(context).emboss: [S.of(context).yes, S.of(context).non],
            S.of(context).packing: [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Manakish Box",
          "details": {
            S.of(context).type: ["Food Board", "Kraft"],
             S.of(context).size: ["Stander", "Customize"],
            S.of(context).printing: ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            S.of(context).paper: [250,300,350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).shape: [S.of(context).standard,S.of(context).customize],
            S.of(context).quantity: [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            S.of(context).emboss: [S.of(context).yes, S.of(context).non],
            S.of(context).packing: [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Sandwich Box",
          "details": {
               S.of(context).type: ["Food Board", "Kraft"],
             S.of(context).size: ["Stander", "Customize"],
            S.of(context).printing: ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            S.of(context).paper: [250,300,350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).shape: [S.of(context).standard,S.of(context).customize],
            S.of(context).quantity: [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            S.of(context).emboss: [S.of(context).yes, S.of(context).non],
            S.of(context).packing: [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Take Away Box",
         "details": {
               S.of(context).type: ["Food Board", "Kraft"],
             S.of(context).size: ["Stander", "Customize"],
            S.of(context).printing: ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            S.of(context).paper: [250,300,350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).shape: [S.of(context).standard,S.of(context).customize],
            S.of(context).quantity: [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            S.of(context).emboss: [S.of(context).yes, S.of(context).non],
            S.of(context).packing: [ 250, 350,500],
          },
          "isRequired": true,
        },
        {
          "title": "Noodles Box",
          "details": {
               S.of(context).type: ["Food Board", "Kraft"],
             S.of(context).size: ["Stander", "Customize"],
            S.of(context).printing: ["1/0 Color", "2/0 Color", "3/0 Color", "4/0 Color"],
            S.of(context).paper: [250,300,350],
            S.of(context).lamination: [S.of(context).glossy, S.of(context).matt, S.of(context).non],
            S.of(context).shape: [500, 1000, 1500, 2000],
            S.of(context).quantity: [5000, 7000, 10000, 12000, 15000, 17000, 20000],
          },
          "other": {
            S.of(context).emboss: [S.of(context).yes, S.of(context).non],
            S.of(context).packing: [ 250, 350,500],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Wrapping Paper",
      radioOptions: [ 
        S.of(context).sandwichPaper, 
        S.of(context).lShapePaper,
        S.of(context).sandwichPouch,
        S.of(context).wrappingRoll,
        S.of(context).sweetRoll
        
      ],
      details: [
        {
          "title": "Sandwich Paper",
          "details": {
            S.of(context).height: [25, 35, 50],
            S.of(context).width: [25, 35, 50],
            S.of(context).paper: [25, 30, 35, 40, 45, 50,55],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).quantity: [30000, 40000, 50000, 60000, 70000, 80000],
            "Cutting": ["Auto Sel", S.of(context).normal],
          },
          "other": {
            S.of(context).block: [S.of(context).normal, S.of(context).laser],
            S.of(context).packing: [1000, 2000],
          },
          "isRequired": false,
        },
        {
          "title": "L Shape Paper",
          "details": {
            S.of(context).height: [10, 12, 15, 17],
            S.of(context).width: [10, 12, 15, 17],
            S.of(context).paper: [25, 30, 35, 40, 45, 50],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).quantity: [30000, 40000, 50000, 60000, 70000, 80000],
            "Cutting": ["Auto Sel", S.of(context).normal],
          },
          "other": {
            S.of(context).block: [S.of(context).normal, S.of(context).laser],
            S.of(context).packing: [1000, 2000],
          },
          "isRequired": false,
        },
        {
          "title": "Sandwich Pouch",
          "details": {
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).paper: [25, 30, 35, 40, 45, 50],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).quantity: [30000, 40000, 50000, 60000, 70000, 80000],
            "Cutting": ["Auto Sel", S.of(context).normal],
          },
          "other": {
            S.of(context).block: [S.of(context).normal, S.of(context).laser],
            S.of(context).packing: [1000, 2000],
          },
          "isRequired": true,
        },
        {
          "title": "Wrapping Roll",
          "details": { 
             S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).paper: [25, 30, 35, 40, 45, 50],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).quantity: [30000, 40000, 50000, 60000, 70000, 80000],
            "Cutting": ["Auto Sel", S.of(context).normal],
          },
          "other": {
            S.of(context).block: [S.of(context).normal, S.of(context).laser],
            S.of(context).packing: [1000, 2000],
          },
          "isRequired": true,
        },
        {
          "title": "Sweet Roll",
          "details": { 
             S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).paper: [25, 30, 35, 40, 45, 50],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).quantity: [30000, 40000, 50000, 60000, 70000, 80000],
            "Cutting": ["Auto Sel", S.of(context).normal],
          },
          "other": {
            S.of(context).block: ["Laser", S.of(context).laser],
            S.of(context).packing: [1000, 2000],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Coffee Bag",
      radioOptions: [ 
        S.of(context).coffeeBagWithZipper,
        S.of(context).coffeeBagWithFilter,
        S.of(context).plasticCoffeeBag,
        S.of(context).paperCoffeeBag
      
      ],
      details: [
        {
          "title": "Coffee Bag With Zipper",
          "details": {
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).bottom: [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            "PE": [ S.of(context).yes, S.of(context).no],
            S.of(context).cylinder: [S.of(context).steel, S.of(context).normal],
            S.of(context).quantity: [10000, 15000, 20000, 25000],
          },
          "other": {
            S.of(context).spotUv: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["250 pcs", "500 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Coffee Bag With Filter",
          "details": {
           S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).bottom: [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            "PE": [ S.of(context).yes, S.of(context).no],
            S.of(context).cylinder: [S.of(context).steel, S.of(context).normal],
            S.of(context).quantity: [10000, 15000, 20000, 25000],
          },
          "other": {
            S.of(context).spotUv: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["250 pcs", "500 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Paper Coffee Bag ",
          "details": {
           S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).bottom: [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            "PE": [ S.of(context).yes, S.of(context).no],
            S.of(context).cylinder: [S.of(context).steel, S.of(context).normal],
            S.of(context).quantity: [10000, 15000, 20000, 25000],
          },
          "other": {
            S.of(context).spotUv: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["250 pcs", "500 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Plastic Coffee Bag ",
          "details": {
           S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).bottom: [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            "PE": [ S.of(context).yes, S.of(context).no],
            S.of(context).cylinder: [S.of(context).steel, S.of(context).normal],
            S.of(context).quantity: [10000, 15000, 20000, 25000],
          },
          "other": {
            S.of(context).spotUv: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["250 pcs", "500 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Shopping Bag",
      radioOptions: [   

        S.of(context).shoppingBagCardboard, 
        S.of(context).shoppingBagAsRequest
       
      ],
      details: [
        {
          "title": "Shopping Bag CardBoard",
          "details": {
            S.of(context).color: [S.of(context).white, S.of(context).brown],
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).bottom: [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).handle: [S.of(context).paper, "Rope"],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [500, 1000, 1500, 2000],
          },
          "other": {
            S.of(context).printing: [S.of(context).offset, S.of(context).digital],
            S.of(context).packing: ["1*200 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Shopping Bag as Request",
          "details": {
            S.of(context).color: [S.of(context).white, S.of(context).brown],
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).bottom: [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).handle: [S.of(context).paper, "Rope"],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [500, 1000, 1500, 2000],
          },
          "other": {
            S.of(context).printing: [S.of(context).offset, S.of(context).digital],
            S.of(context).packing: ["1*200 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Kraft Paper Bags",
      radioOptions: [ 
        S.of(context).kraftPaperBagsWithTwistedHandle, 
        S.of(context).kraftPaperBagsSquareBottom,
        S.of(context).kraftPaperBagsFlat,
        S.of(context).kraftPaperBagsFlatWithWindow,
       
      ],
      details: [
        {
          "title": "Kraft Paper Bags With Twisted Handle",
          "details": {
            S.of(context).color: [S.of(context).white, S.of(context).brown],
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).bottom: [10, 12, 15, 17,18],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).handle: [S.of(context).paper,],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 5000, 10000],
          },
          "other": {
            S.of(context).printing: [S.of(context).offset, "flexo"],
            S.of(context).packing: [250],
          },
          "isRequired": true,
        },
        {
          "title": "Kraft Paper Bags Square Bottom (SOS)",
           "details": {
            S.of(context).color: [S.of(context).white, S.of(context).brown],
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).bottom: [10, 12, 15, 17,18],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 5000, 10000],
          },
          "other": {
            S.of(context).printing: [S.of(context).offset, "flexo"],
            S.of(context).packing: [250],
          },
          "isRequired": true,
        },
        {
          "title": "Kraft Paper Bags Flat",
           "details": {
            S.of(context).color: [S.of(context).white, S.of(context).brown],
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 5000, 10000],
          },
          "other": {
            S.of(context).printing: [S.of(context).offset, "flexo"],
            S.of(context).packing: [250],
          },
          "isRequired": true,
        },
        {
          "title": "Kraft Paper Bags Flat With Window",
          "details": {
            S.of(context).color: [S.of(context).white, S.of(context).brown],
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 5000, 10000],
          },
          "other": {
            S.of(context).printing: [S.of(context).offset, "flexo"],
            S.of(context).packing: [250],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Canavas Bag",
      radioOptions: [ 
        S.of(context).canvasBagWithHandle,
        S.of(context).canvasBagSquareBottom,
        S.of(context).canvasBagFlat,
       
      ],
      details: [
        {
          "title": "Canavas Bag With Handle",
          "details": {
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).handle: ["Fabric"],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 2000, 5000, 10000],
          },
          "other": {
            S.of(context).printing: [S.of(context).offset, S.of(context).digital],
            S.of(context).packing: [250],
          },
          "isRequired": true,
        },
        {
          "title": "Canavas Bag Square Bottom",
          "details": {
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).handle: ["Fabric"],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity:[1000, 2000, 5000, 10000],
          },
          "other": {
            S.of(context).printing: [S.of(context).offset, S.of(context).digital],
            S.of(context).packing: [250],
          },
          "isRequired": true,
        },
        {
          "title": "Canavas Bag Flat",
          "details": {
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            S.of(context).printing: [1, 2, 3],
            S.of(context).handle: ["Fabric"],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [1000, 2000, 5000, 10000],
          },
          "other": {
            S.of(context).packing: [250],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Plastic Bag",
      radioOptions: [ 
S.of(context).plasticBagHd,
S.of(context).plasticBagLd, 
S.of(context).courierBag
     
      ],
      details: [
        {
          "title": "Plastic Bag Hd",
          "details": {
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            "Gasset": [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).handle: [S.of(context).normal, "banana"],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [250, 300, 500],
          },
          "other": {
            S.of(context).packing: ["50 Kg"],
          },
          "isRequired": true,
        },
        {
          "title": "Plastic Bag LD",
          "details": {
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            "Gasset": [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).handle: [S.of(context).normal, "banana"],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [250, 300, 500],
          },
          "other": {
            S.of(context).packing: ["50 Kg"],
          },
          "isRequired": true,
        },
        {
          "title": "Courier Bag",
          "details": { 
            S.of(context).height: [25, 30, 35, 40, 45],
            S.of(context).width: [25, 30, 35, 40, 45],
            "Gasset": [10, 20, 30],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).handle: [S.of(context).normal, "banana"],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [250, 300, 500],

          },
          "other": {
           S.of(context).packing: ["50 Kg"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Paper Cup",
      radioOptions: [ 
        S.of(context).paperCupSingleWall,
        S.of(context).paperCupDoubleWall,
        S.of(context).paperCupCorrugated,
        S.of(context).iceCreamCup,
        S.of(context).popCornCup
     
      ],
      details: [
        {
          "title": "Paper Cup Single Wall",
          "details": {
             S.of(context).size: [4, 6, 7, 8 , 9,12 ,14,16],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).gold, S.of(context).silver, S.of(context).non],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Paper Cup double Wall",
          "details": {
             S.of(context).size: [4, 6, 7, 8 , 9,12 ,14,16],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).gold, S.of(context).silver, S.of(context).non],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Paper Cup Corrugated",
          "details": {
             S.of(context).size: [4, 6, 7, 8 , 9,12 ,14,16],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).gold, S.of(context).silver, S.of(context).non],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Ice Cream Cup",
          "details": {
             S.of(context).size: ["120 ml", "250 ml", "400 ml", "500 ml"],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).gold, S.of(context).silver, S.of(context).non],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Pop Corn Cup",
         "details": {
             S.of(context).size: ["24", "32", "46", "85", "130"],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).gold, S.of(context).silver, S.of(context).non],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [3000, 4000, 5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Plastic Cup",
      radioOptions: [ 
        S.of(context).plasticCupPp,
        S.of(context).plasticCupPet,
       
      ],
      details: [
        {
          "title": "Plastic Cup PP",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Plastic Cup PET",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3,4],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
    DetailedCategoryModel(
      title: "Various Products",
      radioOptions: [ 
        S.of(context).cupHolder, 
        S.of(context).sleeve,
        S.of(context).facialTissuePrinted,
        S.of(context).napkinTissuePrinted,
        S.of(context).wetNapkinPrinted,
        S.of(context).printersPaper,
        S.of(context).thermalPaperForPrinters
       
      ],
      details: [
        {
          "title": "Cup Holder",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },  
        {
          "title": "Sleve",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Facial Tissue Printed",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Napkin Tissue Printed",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "wet Napkin Printed",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "Printers paper",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
        {
          "title": "thermal paper for prenters",
          "details": {
             S.of(context).size: [8, 10, 12, 14, 16,20 , 22],
            S.of(context).lid: [ S.of(context).yes, S.of(context).no],
            S.of(context).foil: [S.of(context).silver, S.of(context).gold, S.of(context).non],
            S.of(context).printing: [1, 2, 3],
            S.of(context).block: [S.of(context).laser, S.of(context).normal],
            S.of(context).quantity: [5000, 10000, 20000, 30000],
          },
          "other": {
            S.of(context).emboss: [ S.of(context).yes, S.of(context).no],
            S.of(context).packing: ["1x1000 pcs"],
          },
          "isRequired": true,
        },
      ],
    ),
  ];
}
}