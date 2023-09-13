import 'package:get/get.dart';
import 'package:hollywood_hair/screen/all_products/all_product_binder.dart';
import 'package:hollywood_hair/screen/all_products/all_product_screen.dart';
import 'package:hollywood_hair/screen/auth_screen/forgot_password/forgot_password_binding.dart';
import 'package:hollywood_hair/screen/auth_screen/forgot_password/forgot_password_screen.dart';
import 'package:hollywood_hair/screen/auth_screen/new_password/new_password_binding.dart';
import 'package:hollywood_hair/screen/auth_screen/new_password/new_password_screen.dart';
import 'package:hollywood_hair/screen/auth_screen/otp/otp_binding.dart';
import 'package:hollywood_hair/screen/auth_screen/otp/otp_screen.dart';
import 'package:hollywood_hair/screen/auth_screen/signIn/signIn_binding.dart';
import 'package:hollywood_hair/screen/auth_screen/signIn/signIn_screen.dart';
import 'package:hollywood_hair/screen/auth_screen/signUp/signUp_binding.dart';
import 'package:hollywood_hair/screen/auth_screen/signUp/signUp_screen.dart';
import 'package:hollywood_hair/screen/base/base_home_binding.dart';
import 'package:hollywood_hair/screen/base/base_home_screen.dart';
import 'package:hollywood_hair/screen/base/booking/book_appointment/book_appointment_binding.dart';
import 'package:hollywood_hair/screen/base/booking/book_appointment/book_appointment_screen.dart';
import 'package:hollywood_hair/screen/base/booking/booking_confirm/booking_confirm_binding.dart';
import 'package:hollywood_hair/screen/base/booking/booking_confirm/booking_confirm_screen.dart';
import 'package:hollywood_hair/screen/base/booking/booking_form/booking_form_binding.dart';
import 'package:hollywood_hair/screen/base/booking/booking_form/booking_form_screen.dart';
import 'package:hollywood_hair/screen/base/home_screen/search_product/search_product_binding.dart';
import 'package:hollywood_hair/screen/base/home_screen/search_product/search_product_screen.dart';
import 'package:hollywood_hair/screen/base/profile/address/address_binding.dart';
import 'package:hollywood_hair/screen/base/profile/address/address_screen.dart';
import 'package:hollywood_hair/screen/base/profile/my_order/my_order_binding.dart';
import 'package:hollywood_hair/screen/base/profile/my_order/my_order_screen.dart';
import 'package:hollywood_hair/screen/base/profile/settings/change_password/change_password_binding.dart';
import 'package:hollywood_hair/screen/base/profile/settings/change_password/change_password_screen.dart';
import 'package:hollywood_hair/screen/base/profile/settings/contact/contact_binding.dart';
import 'package:hollywood_hair/screen/base/profile/settings/contact/contact_screen.dart';
import 'package:hollywood_hair/screen/base/profile/settings/edit_profile/edit_profile_binding.dart';
import 'package:hollywood_hair/screen/base/profile/settings/edit_profile/edit_profile_screen.dart';
import 'package:hollywood_hair/screen/base/profile/settings/faq/faq_binding.dart';
import 'package:hollywood_hair/screen/base/profile/settings/faq/faq_screen.dart';
import 'package:hollywood_hair/screen/base/profile/settings/languages/languages_binding.dart';
import 'package:hollywood_hair/screen/base/profile/settings/languages/languages_screen.dart';
import 'package:hollywood_hair/screen/base/profile/settings/my_appointment/my_appointment_binding.dart';
import 'package:hollywood_hair/screen/base/profile/settings/my_appointment/my_appointment_screen.dart';
import 'package:hollywood_hair/screen/base/profile/settings/setting_binding.dart';
import 'package:hollywood_hair/screen/base/profile/settings/setting_screen.dart';
import 'package:hollywood_hair/screen/base/profile/settings/static/static_binding.dart';
import 'package:hollywood_hair/screen/base/profile/settings/static/static_screen.dart';
import 'package:hollywood_hair/screen/favourite_screen/favourite_binder.dart';
import 'package:hollywood_hair/screen/favourite_screen/favourite_screen.dart';
import 'package:hollywood_hair/screen/notification/notification_binding.dart';
import 'package:hollywood_hair/screen/notification/notification_screen.dart';
import 'package:hollywood_hair/screen/product_details/product_details_binding.dart';
import 'package:hollywood_hair/screen/product_details/product_details_screen.dart';
import 'package:hollywood_hair/screen/splash/splash_binding.dart';
import 'package:hollywood_hair/screen/splash/splash_screen.dart';

import 'app_pages.dart';

class AppRoutes {
  static var transitionDuration = const Duration(
    milliseconds: 550,
  );

  static final pages = [
    GetPage(
      name: AppPages.initialPage,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppPages.signInScreen,
      page: () => SignInScreen(),
      binding: SignINBinding(),
    ),
    GetPage(
      name: AppPages.signUpScreen,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppPages.forgotScreen,
      page: () => ForgotPasswordScreen(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: AppPages.otpScreen,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppPages.newPasswordScreen,
      page: () => NewPasswordScreen(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: AppPages.baseScreen,
      page: () => BaseHomeScreen(),
      binding: BaseHomeBinding(),
    ),
    GetPage(
      name: AppPages.settingScreen,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppPages.languagesScreen,
      page: () => LanguageScreen(),
      binding: LanguagesBinding(),
    ),
    GetPage(
      name: AppPages.staticScreen,
      page: () => StaticScreen(),
      binding: StaticBinding(),
    ),
    GetPage(
      name: AppPages.contactScreen,
      page: () => ContactScreen(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppPages.faqScreen,
      page: () => FaqScreen(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: AppPages.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppPages.addAddressScreen,
      page: () => AddressScreen(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: AppPages.notificationScreen,
      page: () => NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppPages.bookingFormScreen,
      page: () => BookingFormScreen(),
      binding: BookingFormBinding(),
    ),
    GetPage(
      name: AppPages.bookingAppointmentScreen,
      page: () => BookAppointmentScreen(),
      binding: BookAppointmentBinding(),
    ),   GetPage(
      name: AppPages.confirmBookingScreen,
      page: () => BookingConfirmScreen(),
      binding: BookingConfirmBinding(),
    ),
    GetPage(
      name: AppPages.myAppointmentScreen,
      page: () => MyAppointmentScreen(),
      binding: MyAppointmentBinding(),
    ),
    GetPage(
      name: AppPages.favouriteScreen,
      page: () => FavouriteScreen(),
      binding: FavouriteBinding(),
    ),

    GetPage(
      name: AppPages.allProductScreen,
      page: () => AllProductScreen(),
      binding: AllProductBinding(),
    ),

    GetPage(
      name: AppPages.allProductDetailsScreen,
      page: () => ProductDetailsScreen(),
      binding:ProductDetailsBinding(),
    ),


    GetPage(
      name: AppPages.myOrderScreen,
      page: () => MyOrderScreen(),
      binding:MyOrderBinding(),
    ),

    GetPage(
      name: AppPages.changePasswordScreen,
      page: () => ChangePasswordScreen(),
      binding:ChangePasswordBinding(),
    ),

    GetPage(
      name: AppPages.searchProductScreen,
      page: () => SearchProductScreen(),
      binding:SearchProductBinding(),
    ),


  ];
}
