import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/models/category_model.dart';
import 'package:supplier/generated/l10n.dart';
import 'package:flutter/material.dart';


class AppConst {

static const supaBaseStorageBacketName = "trade-license";
static const supabaseUrl = "https://elsuheplnbqvqnqkxpfi.supabase.co";
static const websiteUrl = 'https://www.supplieruae.com';

static const socialMediaLinks =[ 
  "https://www.facebook.com/supplieruae1/", 
  "https://www.instagram.com/supplieruae/", 
  "https://www.linkedin.com/company/supplieruae/?viewAsMember=true",
  "mailto:info@supplieruae.com"
]; 
static const  socialMediaIcons = [ 
  AssetsConstants.facebookIcon, 
  AssetsConstants.instagramIcon,
  AssetsConstants.linkedInIcon,
  AssetsConstants.gmailIcon,
];


static List<String> homeCategoryStrings(BuildContext context) {
    return [
      S.of(context).printing,
      S.of(context).fast_print,
      S.of(context).packaging,
      S.of(context).signage,
      S.of(context).uniform,
      S.of(context).gift_items,
    ];
  }
  

  static String getDate() {
    final day = DateTime.now().day.toString().padLeft(2, "0");
    final month = DateTime.now().month.toString().padLeft(2, "0");
    final year = DateTime.now().year.toString().padLeft(2, "0");
    return "$day-$month-$year";
  }

// static List<String> homeCategoryString(BuildContext context) {
//     final localizations = AppLocalizaStions.of(context)!;
//     return [
//       localizations.printing,
//       localizations.digital,
//       localizations.packaging,
//       localizations.signage,
//       localizations.uniform,
//       localizations.gift_items,
//     ];
//   }
//   static final chatMessagesExamples = [
//     MessageModel(
//         message: "Hello This is Test Message", time: "2:13", isSender: true),
//     MessageModel(message: "I'm Muhammed Ashraf", time: "2:09", isSender: true),
//     MessageModel(message: "Test ", time: "9:00", isSender: false),
//     MessageModel(message: "This is Message", time: "2:13", isSender: true),
//     MessageModel(
//         message: "Hello This is Test Message", time: "4:44", isSender: false),
//     MessageModel(
//         message: "Hello Hello Hello Hello ", time: "3:11", isSender: true),
//     MessageModel(
//         message: " is this Test Message?", time: "2:13", isSender: false),
//     MessageModel(
//         message: "Test me Test Me Test  ", time: "2:13", isSender: false),
//     MessageModel(
//         message: "Dummy Dummy Dummy Dummy Dummy Dummy ",
//         time: "5:22",
//         isSender: true),
//     MessageModel(message: "01002011850", time: "10:45", isSender: false),
//     MessageModel(
//         message: "Text Message Message Message ", time: "6:20", isSender: true),
//   ];
  static List<String> uaeCities = [
    'Abu Dhabi',
    'Dubai',
    'Sharjah',
    'Ajman',
    'Fujairah',
    'Ras Al Khaimah',
    'Umm Al Quwain',
    'Al Ain',
    'Khor Fakkan',
    'Dibba Al-Fujairah',
  ];
  static String getQuotationConditionText(BuildContext context, int index) {
    switch (index) {
      case 1:
        return S.of(context).quotation_condition_1;
      case 2:
        return S.of(context).quotation_condition_2;
      case 3:
        return S.of(context).quotation_condition_3;
      case 4:
        return S.of(context).quotation_condition_4;
      case 5:
        return S.of(context).quotation_condition_5;
      case 6:
        return S.of(context).quotation_condition_6;
      case 7:
        return S.of(context).quotation_condition_7;
      default:
        return '';
    }
  }


  static List<String> settingsText(BuildContext context) {
    return [
      S.of(context).account,
      S.of(context).terms_and_conditions,
      S.of(context).our_website,
      S.of(context).delete_account,
      S.of(context).log_out,
    ];
  }

  static List<String> settingsIcon = [
    AssetsConstants.profileIcon,
    AssetsConstants.termsIcon,
    AssetsConstants.websiteIcon,
    AssetsConstants.deleteIcon,
    AssetsConstants.logOutIcon,
  ];
  static List<Color> settingsIconColor = [
    ColorConsatnts.primary,
    ColorConsatnts.black,
    const Color.fromARGB(255, 8, 79, 138),
    Colors.red,
    const Color.fromARGB(255, 43, 136, 212),
  ];

  static List<String> packagingNames(BuildContext context) => [
        S.of(context).carton,
        S.of(context).molded_fiber_products,
        S.of(context).tissue_products,
        S.of(context).foam_products,
        S.of(context).aluminium_products,
        S.of(context).plastic_products,
        S.of(context).hygiene_and_protection,
        S.of(context).paper_products,
        S.of(context).wooden_products,
      ];

  static List<List<CategoryModel>> categoryModel(BuildContext context) {
    return [
      [
        CategoryModel(
            image: "assets/images/printing/offsetN.jpeg",
            title: S.of(context).offset_print,
            index: 0),
        CategoryModel(
            image: "assets/images/printing/cartonBoxsN.jpeg",
            title: S.of(context).carton_boxes,
            index: 1),
        CategoryModel(
            image: "assets/images/printing/paperBoxsN.jpeg",
            title: S.of(context).paper_boxes,
            index: 2),
        CategoryModel(
            image: "assets/images/printing/wrappingPaperN.jpeg",
            title: S.of(context).wrapping_paper,
            index: 3),
        CategoryModel(
            image: "assets/images/printing/coffee bag.jpeg",
            title: S.of(context).coffee_bags,
            index: 4),
        CategoryModel(
            image: "assets/images/printing/shoppingBagN.jpeg",
            title: S.of(context).shopping_bags,
            index: 5),
        CategoryModel(
            image: "assets/images/printing/PaperBagN.jpeg",
            title: S.of(context).paper_bags,
            index: 6),
        CategoryModel(
            image: "assets/images/printing/CanavasBagN.jpeg",
            title: S.of(context).canvas_bags,
            index: 7),
        CategoryModel(
            image: "assets/images/printing/Plastic Bag.jpeg",
            title: S.of(context).plastic_bags,
            index: 8),
        CategoryModel(
            image: "assets/images/printing/paper cup.jpeg",
            title: S.of(context).paper_cups,
            index: 9),
        CategoryModel(
            image: "assets/images/printing/plastic cup.jpeg",
            title: S.of(context).plastic_cups,
            index: 10),
        CategoryModel(
            image: "assets/images/printing/Diverse.jpeg",
            title: S.of(context).diverse_digital,
            index: 11),
      ],
      [
        CategoryModel(
            image: "assets/images/Digital/Brochure.jpeg",
            title: S.of(context).brochure,
            index: 0),
        CategoryModel(
            image: "assets/images/Digital/catalog.jpeg",
            title: S.of(context).catalogue,
            index: 1),
        CategoryModel(
            image: "assets/images/Digital/digital card.jpeg",
            title: S.of(context).digital_cards,
            index: 2),
        CategoryModel(
            image: "assets/images/Digital/Flyer.jpeg",
            title: S.of(context).flyers,
            index: 3),
        CategoryModel(
            image: "assets/images/Digital/small shopping bag.png",
            title: S.of(context).small_shopping_bag,
            index: 4),
        CategoryModel(
            image: "assets/images/Digital/Stickers.jpg",
            title: S.of(context).stickers,
            index: 5),
        CategoryModel(
            image: "assets/images/Digital/diverse.jpeg",
            title: S.of(context).diverse_digital,
            index: 6),
      ],
      [
        CategoryModel(
            image: "assets/images/Packaging/carton.jpeg",
            title: S.of(context).carton,
            index: 0),
        CategoryModel(
            image: "assets/images/Packaging/Fiber Products-01.png",
            title: S.of(context).molded_fiber_products,
            index: 1),
        CategoryModel(
            image: "assets/images/Packaging/Tissue-01.png",
            title: S.of(context).tissue_products,
            index: 2),
        CategoryModel(
            image: "assets/images/Packaging/Foam Products-01.png",
            title: S.of(context).foam_products,
            index: 3),
        CategoryModel(
            image: "assets/images/Packaging/Aluminum Products-01.png",
            title: S.of(context).aluminium_products,
            index: 4),
        CategoryModel(
            image: "assets/images/Packaging/plastic.jpeg",
            title: S.of(context).plastic_products,
            index: 5),
        CategoryModel(
            image: "assets/images/Packaging/Hygiene Products-01.png",
            title: S.of(context).hygiene_and_protection,
            index: 6),
        CategoryModel(
            image: "assets/images/Packaging/Paper Products-01.png",
            title: S.of(context).paper_products,
            index: 7),
        CategoryModel(
            image: "assets/images/Packaging/wooden Products-01.png",
            title: S.of(context).wooden_products,
            index: 8),
      ],
      [
        CategoryModel(
            image: "assets/images/Signage/2D signage.jpeg",
            title: S.of(context).two_d_signage,
            index: 0),
        CategoryModel(
            image: "assets/images/Signage/3D signage.jpeg",
            title: S.of(context).three_d_signage,
            index: 1),
        CategoryModel(
            image: "assets/images/Signage/Digital Screen.jpeg",
            title: S.of(context).digital_screen,
            index: 2),
        CategoryModel(
            image: "assets/images/Signage/exhibition stand.jpeg",
            title: S.of(context).exhibition_stand,
            index: 3),
        CategoryModel(
            image: "assets/images/Signage/Flag.jpeg",
            title: S.of(context).flags,
            index: 4),
        CategoryModel(
            image: "assets/images/Signage/flix signage.jpeg",
            title: S.of(context).flex_signage,
            index: 5),
        CategoryModel(
            image: "assets/images/Signage/large format sticker.jpeg",
            title: S.of(context).large_format_sticker,
            index: 6),
        CategoryModel(
            image: "assets/images/Signage/pop up.jpeg",
            title: S.of(context).pop_up,
            index: 7),
        CategoryModel(
            image: "assets/images/Signage/roll up.jpeg",
            title: S.of(context).rollup,
            index: 8),
        CategoryModel(
            image: "assets/images/Signage/side signage.jpeg",
            title: S.of(context).side_signage,
            index: 9),
        CategoryModel(
            image: "assets/images/Signage/diverse.jpeg",
            title: S.of(context).diverse_digital,
            index: 10),
      ],
      [
        CategoryModel(
            image: "assets/images/Unifoarm/Chef Cap.jpeg",
            title: S.of(context).chef_cap,
            index: 0),
        CategoryModel(
            image: "assets/images/Unifoarm/Chef Jacket.jpeg",
            title: S.of(context).chef_jacket,
            index: 1),
        CategoryModel(
            image: "assets/images/Unifoarm/full set.jpg",
            title: S.of(context).full_set,
            index: 2),
        CategoryModel(
            image: "assets/images/Unifoarm/shirt.jpeg",
            title: S.of(context).shirt,
            index: 3),
        CategoryModel(
            image: "assets/images/Unifoarm/suit.jpeg",
            title: S.of(context).suit,
            index: 4),
        CategoryModel(
            image: "assets/images/Unifoarm/T-shirt.jpeg",
            title: S.of(context).t_shirt,
            index: 5),
        CategoryModel(
            image: "assets/images/Unifoarm/trouser.jpeg",
            title: S.of(context).trouser,
            index: 6),
        CategoryModel(
            image: "assets/images/Unifoarm/diverse.jpeg",
            title: S.of(context).diverse_digital,
            index: 7),
      ],
      [
        CategoryModel(
            image: "assets/images/Gift Items/agenda.jpeg",
            title: S.of(context).agenda,
            index: 0),
        CategoryModel(
            image: "assets/images/Gift Items/flash memory.jpeg",
            title: S.of(context).flash_memory,
            index: 1),
        CategoryModel(
            image: "assets/images/Gift Items/ID Card.jpeg",
            title: S.of(context).id_cards,
            index: 2),
        CategoryModel(
            image: "assets/images/Gift Items/Lanyard.jpeg",
            title: S.of(context).lanyard,
            index: 3),
        CategoryModel(
            image: "assets/images/Gift Items/mobile cover.jpeg",
            title: S.of(context).mobile_cover,
            index: 4),
        CategoryModel(
            image: "assets/images/Gift Items/Mouse Pad.jpeg",
            title: S.of(context).mouse_pad,
            index: 5),
        CategoryModel(
            image: "assets/images/Gift Items/Mug.jpeg",
            title: S.of(context).mugs,
            index: 6),
        CategoryModel(
            image: "assets/images/Gift Items/Pen.jpeg",
            title: S.of(context).pen,
            index: 7),
        CategoryModel(
            image: "assets/images/Gift Items/Trophy.jpeg",
            title: S.of(context).trophy,
            index: 8),
        CategoryModel(
            image: "assets/images/Gift Items/umbrella.jpeg",
            title: S.of(context).umbrella,
            index: 9),
        CategoryModel(
            image: "assets/images/Gift Items/Wooden-Stand-.jpeg",
            title: S.of(context).wooden_stand,
            index: 10),
        CategoryModel(
            image: "assets/images/Gift Items/Wristband.jpeg",
            title: S.of(context).wristband,
            index: 11),
        CategoryModel(
            image: "assets/images/Gift Items/Diverse.jpeg",
            title: S.of(context).diverse_digital,
            index: 12),
      ],
    ];
  }
}
