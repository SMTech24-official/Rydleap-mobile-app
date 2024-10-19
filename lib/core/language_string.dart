import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "language": "Language",
          // privacy setting
          "privacy": "Privacy",
          "location": "Location",
          "data_sharing_with_partners": "Data Sharing with Partners",
          "ad_personalization": "Ad Personalization",
          "only_me": "Only Me",
          "friends": "Friends",
          "public": "Public",
          "activity_status": "Activity Status",
          "save": "Save",
          "partners": "Partners",
          "ride_history": "Ride history",
         
          // language
          "selective_language": "Selective Language",
          "english": "English",
          "spanish": "Spanish",
          "portuguese": "Portuguese",
          "french": "French",
          // support request send
          "your_support_request_has_been_sent":
              "Your support request has been sent",
          "expected_response_time:24_hours": "Expected response time: 24 hours",
          // email_support
          "email_support": "Email Support",
          "issue_type": "Issue Type",
          "suscription": "Description",
          "yobject": "Subject",
          "deu_can_upload_PNG/JPG/MOV": "You can upload PNG/JPG/MOV",
          "upload": "Upload",
          "send": "Send",
          //registration
          "get_otp": "Get OTP",
          "privacy_policy": "Privacy Policy",
          "or_sign_in_with": "Or sign in with",
          "sign_google": "Sign in with Google",
          "sign_apple": "Sign in with Apple",
          "sign_facebook": "Sign in with facebook",
          //login
          "log_in": "Log In",
          "remember_me": "Remember me",
          "phone_or_email": "Phone or email",
          "password": "Password",
          "forgotten_password": "Forgotten password?",
          "confirm": "Confirm",
          "email_or_phone":
              "Enter your email or phone and password to continue with Rydleap",
          //forgot_screen
          "forgot_password": "Forgot Password?",
          "email":
              "Enter your email to reclaim your password to continue with Rydleap",
          "h_email": "Email",
          //otp_2
          "digit_title": "Enter 4-digit code otp",
          "code_title": "Your code was sent to +(1) xxxx-xxxx",
          "resend_code": "Resend code",
          "otp_sent": "OTP sent",
          "error": "Error",
          //payment_option_screen
          'payment_options': 'Payment options',
          "cash_after_reaching": "Cash after reaching",
          'add_payment_method': 'Add Payment method',
          'edit': 'Edit',
          'promo_Code': 'Promo Code',
          "continue": "Continue",
          "cash": "Cash",
          //PromotionOffersScreen
          "promotion_and_offers": "Promotion and Offers",
          "active_promotions": "Active Promotions",
          "promo_title_1": "Promo Title 1",
          "save_20%_on_your_next_ride": "Save 20% on your next ride",
          "expiration": "Expiration:",
          "promo_title_2": "Promo Title 2",
          "5_off_your_next_3_rides": "5 off your next 3 rides",
          "redeem_a_promo_code": "Canjear un código promocional",
          "redeem": "Redeem",

          //profile
          "about_me": "About me ",
          "settings": "Settings",
          "promotion_offers": "Promotion and offers",
          "change_password": "Change Password",
          "payment_methods": "Payment Methods",
       
          "report_problem": "Report a Problem",
          "contact_us": "Contact us",
          "balance": "Balance",
          "cash_out": "Cash out",
          "drive_history": "Drive History",
          "notifiactions": "Notifications",

          //add account
          "account_holder": "Account Holder",
          "routing_number": "Routing Number",
          "bank_account_number": "Bank Account Number",
          "date_of_birth": "Date of Birth",
          "adress": "Adress",
          "zipcode": "Zipcode",
          "submit": "Submit",
          "error_routing_number": "Routing Number needs to br in 8-digits",

          //calender
          "reset": "Reset",
          "done": "Done",

          //success
          "success_mag": " Your Bank Account has been successfully linked.",

          //Driver Registration
          "driver_registration": "Driver Registration",
          "add_your_vehicle": "Add your vehicle",
          "vehicle_title":
              "Your vehicle must be 2005 or newer and at least 4 doors and not salvaged.",
          "make": "Make",
          "model": "Model",
          "year": "Year",
          "color": "Color",
          "licence_plate_number": "Licence Plate Number",
          "take_Photo_your_driver’s_licence":
              "Take a Photo of your Driver’s Licence",
          "make_sure_driver_before_warring_mag":
              "Make sure your Driver’s Licence is not expired.Please click a clearer photo and avoid using flash",
          "make_sure_driver_After_warring_mag":
              "Submit this image if you think it's readable or tap on re-upload button to upload another one.",
          "take_photo_vehicle_registration_sticker_warring_mag":
              "Submit this image if you think it's readable or tap on re-upload button to upload another one.",
          "take_photo_after_vehicle_registration_sticker_warring_mag":
              "Submit this image if you think it's readable or tap on re-upload button to upload another one.",
          "take_a_photo_of_your_driver’s_insurance": "",

          // cashout your earnings
          "we_owe_you": "We owe you",
          "bank_of_america": "Bank of America",
          "earnings": "Earnings",
          "withdrawal_fee": "Withdrawal fee",
          "total": "Total",
          "cashout": "Cash Out",
          // cash out success
          "cashed_out_successfully!": "Cashed out Successfully!",
          "your_money_should_be_available_after_2-3_hours":
              "Your money should be available after 2 - 3 hours",
          // password change
          "current_password": "Current Password",
          "new_password": "New Password",
          "your_has_been_change_successfully!":
              "Your has been change successfully!",
          // enter name email(sign in)
          "create_your_password": "Create your Password",
          "ensure_your_password_is_strong_and_meets_the_criteria.":
              "Ensure your password is strong and meets the criteria.",
          "re-password": "Re-password",
          "confirm_password": "Confirm password",
          "passwords_do_not_match.": "Passwords do not match.",
          "at_least_8_characters": "At least 8 characters",
          "includes_a_number": "Includes a number",
          "includes_a_special_character": "Includes a special character",
          "strong": "Strong",
          "weak": "Weak",
          // enter name email
          "by_signing_up_with_Rydleap_you_agree_to_our ":
              "By signing up with Rydleap you agree to our ",
          "terms_and_conditions ": "Terms and Conditions",
          "i’m_not_a_robot": "I’m not a robot",
          // your location
          "are_you_in_los_angeles?": "Are you in Los Angeles?",
          "yes_i_am": "Yes,I am",
          // delete payment method
          "are_you_sure_you_want_to_delete_this_Payment_method?":
              "Are you sure you want to delete this Payment method?",
          "no": "No",
          "yes": "Yes",
          // ratings
          "ratings": "Ratings",
          // pay pal
          "pay_pal": "Pay Pal",
          "use_pay_pal_for_quick_and_secure_payments":
              "Use Pay Pal for quick and secure payments",
          "link_pay_pal": "Link Pay Pal",
          // paypal confirmed
          " your_pay_pal_has_been_successfully_linked.":
              " Your Pay Pal has been successfully linked.",
          // apple pay
          "apple_pay": "Apple Pay",
          "use_apple_pay_for_quick_and_secure_payments":
              "Use Apple Pay for quick and secure payments",
          "link_apply_pay": "Link Apply Pay",
          // apple pay confirmed
          "your_apple_pay_has_been_successfully_linked._you_can_now_use_it_for_quick_and_secure_payments.":
              " Your Apple Pay has been successfully linked. You can now use it for quick and secure payments.",
          // google pay error
          "cancel": "Cancel",
          "retry": "Retry",
          // google pay
          "google_pay": "Google Pay",
          "use_google_pay_for_quick_and_secure_payments":
              "Use Google Pay for quick and secure payments",
          "link_google_pay": "Link Google Pay",
          // google pay confirmed
          " your_google_pay_has_been_successfully_linked._you_can_now_use_it_for_quick_and_secure_payments.":
              " Your Google Pay has been successfully linked. You can now use it for quick and secure payments.",
          // safety tips
          "safety_tips": "Safety Tips",
          "introduction": "Introduction",
          "your_safety_is_our_top_priority.follow_these_tips_to_ensure_a_safe_and_secure_ride_experience":
              "Your safety is our top priority. Follow these tips to ensure a safe and secure ride experience. ",
          "verify_your_ride": "Verify Your Ride",
          "always_check_the_driver’s_photo,_vehicle_make,_and_license_plate_before_getting_in.":
              "Always check the driver’s photo, vehicle make, and license plate before getting in.",
          "share_your_trip_details": "Share your Trip Details",
          "use_the_app_to_share_your_trip_details_with_a_friend_or_family_member.":
              "Use the app to share your trip details with a friend or family member.",
          "sit_in_the_back_seat": "Sit in the Back Seat",
          "for_sefety_and_confort,_always_sit_in_the_back_seat.":
              "For sefety and confort, always sit in the back seat.",
          "trust_your_instincts": "Trust Your Instincts",
          "if_something_doesn’t_feel_right,_trust_your_instincts_and_exit_the_vehicle.":
              "If something doesn’t feel right, trust your instincts and exit the vehicle.",
          "keep_personal_information_private":
              "Keep Personal Information Private",
          "don’t_share_personal_information_with_the_driver.":
              "Don’t share personal information with the driver.",
          "back": "Back",
          "report": "Report",
          // logout confirmation
          "are_you_sure_you_want_to_log_out?":
              "Are you sure you want to Log Out?",
          "wait": "Wait",
          "log_out": "Log out",
          // privacy setting saved
          "saved": "Saved",
          // Terms and Policies
          "terms_and_policies": "Terms and Policies",
          "term_of_service_privacy_policy": "Terms of Service,\nPrivacy Policy",
          "1_terms_and_conditions": "1. Terms and Conditions",
          "1_privacy_policy": "1. Privacy Policy",
          "i_agree_with_the_Terms_and_conditions":
              "I agree with the Terms and Conditions",
          "i_agree_with_the_privacy_policy": "I agree with the Privacy Policy",
          "decline": "Decline",
          "accept": "Accept",
          // Share ride details
          "share_via": "Share Via",
          "pre_filled_message": "Pre-filled Message",
          "i_just_completed_a_trip_from_123_main_st_to_456_elm_st_on_2023-07-20_at_14.30_the_total_fare_was_20.00.":
              "I just completed a trip from 123 Main St to 456 Elm St on 2023-07-20 at 14.30 The total fare was 20.00.",
          // Trip Summary
          "trip_summary": "Trip Summary",
          "dropoff": "Dropoff",
          "time": "Time",
          "fare_breakdown": "Fare Breakdown",
          "base_fare": "Base Fare:",
          "distance": "Distance",
          "surcharges": "Surcharges:",
          "rate_our_driver": "Rate our Driver",
          "share_my_ride": "Share my Ride!",
          // Ratings
          "rate_your_ride": "Rate your Ride",
          "rate_your_driver": "Rate your Driver",
          "your_rating_will_help_other_rydleap_users":
              "Your Rating will help other Rydleap users",
          // Redeem success
          "promo_code_success": "Promo code success!",
          "your_code_is_successfully_redeemed.":
              "Your code is successfully redeemed",
          // Add card
          "add_card": "Add Card",
          "card_number": "Card Number",
          "please_enter_number_only": "Please enter number only",
          "exp._date": "Exp. Date",
          "cvv": "CVV",
          "nickname_(optional)": "Nickname (Optional)",
          "e.g_peace_unity": "e.g Peace Unity",
          // Schedule a ride (Done)
          "your_ride_is_scheduled": "Your Ride is scheduled!",
          // Schedule a ride
          "schedule_your_ride": "Schedule Your Ride",
          "select_time_and_date": "Select time and date",
          "schedule_ride": "Schedule Ride",
          // Request a ride
          "riquest a ride": "Riquest a ride",
          "economy": "Economy",
          "premium": "Premium",
          "shared": "Shared",
          "ride_request": "Ride Request",
          // Home
          "hello": "Hello",
          "pickup_location": "Pickup location",
          "enter_dropoff": "Enter Dropoff",
          "home": "Home",
          "office": "Office",
          // Location access
          'we_need_access_to_your_location_to_show_you_nearby_drivers_and_provide_accurate_pickup_points':
              "We need access to your location to show you nearby drivers and provide accurate pickup points.",
          "maybe_later": "Maybe Later",
          // Notification access
          "we_need_permission to send you notifications for ride updates. promotions,and more.":
              "We need permission t send you notifications for ride updates. promotions,and more.",
          // Support request send
          "support_request_send": "Your support request has been sent.",
          "expected_response_time": "Expected response time: 24 hours",
          // Email Support
          "discription": "Discription",
          "you_can_upload": "You can upload PNG/JPG/MOV",
          // Call Support
          "phone_number": "Phone number",
          // Contact support
          "contact_support": "Contact Support",
          "call_support": "Call support",
          // Notifications
          "all": "ALL",
          "unread": "Unread",
          "todays": "Todays",
          "new": "New",
          // Ride History
          "search_history": "Search History",
          "your_previous_ride_with_redleap_drivers":
              "Your previous ride with redleap drivers",
          "date": "Date",
          "pickup": "Pickup",
          "drop-off": "Drop-off",
          "fare": "Fare",
          "status": "Status",
          "driver": "Driver",
          "vehicle": "Vehicle",
          // Report a problem
          "driver_behavior": "Driver behavior",
          "vehicle_condition": "Vehicle Condition",
          "payment_issue": "Payment issue",
          "lost_item": "Lost item",
          "other": "Other",
          "next": "Next",
          // Profile Settings
          "accounts": "Accounts",
          "notifications": "Notifications",
          "messages": "Messages",
          // About me
          "promotions_and_offers": "Promotions and offers",
        }, //=====================================================================================================================================================
        //========================================================================================================================================================
        //========================================================================================================================================================
        'es_ES': {
          // Spanish
          "language": "Idioma",
          // privacy setting
          "privacy": "Privacy",
          "location": "Location",
          "data_sharing_with_partners": "Data Sharing with Partners",
          "ad_personalization": "Ad Personalization",
          "only_me": "Only Me",
          "friends": "Friends",
          "public": "Public",
          "activity_status": "Activity Status",
          "save": "Save",
          "partners": "Fogonadura",
          "ride_history": "Historia del viaje",
          
          // language
          "selective_language": "Selective Language",
          "english": "English",
          "spanish": "Spanish",
          "portuguese": "Portuguese",
          "french": "French",
          // support request send
          "your_support_request_has_been_sent":
              "Your support request has been sent",
          "expected_response_time:24_hours": "Expected response time: 24 hours",
          // email_support
          "email_support": "Email Support",
          "issue_type": "Issue Type",
          "subject": "Subject",
          "description": "Description",
          "you_can_upload_PNG/JPG/MOV": "You can upload PNG/JPG/MOV",
          "upload": "Upload",
          "send": "Send",
          //registration
          "get_otp": "Obtener OTP",
          "privacy_policy": "política de privacidad",
          "or_sign_in_with": "O inicia sesión con",
          "sign_google": "Iniciar sesión con Google",
          "sign_apple": "Iniciar sesión con Apple",
          "sign_facebook": "Iniciar sesión con facebook",
          //login
          "log_in": "Acceso",
          "remember_me": "Acuérdate de mí",
          "phone_or_email": "Teléfono o correo electrónico",
          "password": "Contraseña",
          "forgotten_password": "Forgotten password?",
          "confirm": "Confirmar",
          "email_or_phone":
              "Enter your email or phone and password to continue with Rydleap",
          //forgot_screen
          "forgot_password": "Has olvidado tu contraseña?",
          "email":
              "Enter your email to reclaim your password to continue with Rydleap",
          "h_email": "Email",
          //otp_2
          "digit_title": "Ingrese el código de 4 dígitos otp",
          "code_title": "Su código fue enviado a +(1) xxxx-xxxx",
          "resend_code": "Reenviar código",
          "otp_sent": "OTP enviado",
          "error": "Error",
          //payment_option_screen
          'payment_options': 'Opciones de pago',
          "cash_after_reaching": "Efectivo después de llegar",
          'add_payment_method': 'Agregar método de pago',
          'edit': 'Editar',
          'promo_Code': 'Código promocional',
          "continue": "Continuar",
          "cash": "Dinero",
          //PromotionOffersScreen
          "promotion_and_offers": "Promotion and Offers",
          "active_promotions": "Active Promotions",
          "promo_title_1": "Promo Title 1",
          "save_20%_on_your_next_ride": "Save 20% on your next ride",
          "expiration": "Expiration:",
          "promo_title_2": "Promo Title 2",
          "5_off_your_next_3_rides": "5 off your next 3 rides",
          "redeem_a_promo_code": "Canjear un código promocional",
          "redeem": "Redeem",
          //profile
          "about_me": "About me ",
          "settings": "Settings",
          "promotion_offers": "Promotion and offers",
          "change_password": "Change Password",
          "payment_methods": "Payment Methods",
          
          "report_problem": "Report a Problem",
          "contact_us": "Contact us",
          "balance": "Balance",
          "cash_out": "Cash out",
          "drive_history": "Drive History",
          "notifiactions": "Notifications",
          //add account
          "account_holder": "Account Holder",
          "routing_number": "Routing Number",
          "bank_account_number": "Bank Account Number",
          "date_of_birth": "Date of Birth",
          "adress": "Adress",
          "zipcode": "Zipcode",
          "submit": "Submit",
          "error_routing_number": "Routing Number needs to br in 8-digits",
          //calender
          "reset": "Reset",
          "done": "Done",
          //success
          "success_mag": " Your Bank Account has been successfully linked.",
          //Driver Registration
          "driver_registration": "Driver Registration",
          "add_your_vehicle": "Add your vehicle",
          "vehicle_title":
              "Your vehicle must be 2005 or newer and at least 4 doors and not salvaged.",
          "make": "Make",
          "model": "Model",
          "year": "Year",
          "color": "Color",
          "licence_plate_number": "Licence Plate Number",
          "take_Photo_your_driver’s_licence":
              "Take a Photo of your Driver’s Licence",
          "make_sure_driver_before_warring_mag":
              "Make sure your Driver’s Licence is not expired.Please click a clearer photo and avoid using flash",
          "make_sure_driver_After_warring_mag":
              "Submit this image if you think it's readable or tap on re-upload button to upload another one.",
          "take_photo_vehicle_registration_sticker_warring_mag":
              "Submit this image if you think it's readable or tap on re-upload button to upload another one.",
          "take_photo_after_vehicle_registration_sticker_warring_mag":
              "Submit this image if you think it's readable or tap on re-upload button to upload another one.",
          "take_a_photo_of_your_driver’s_insurance": "",
          // cashout your earnings
          "we_owe_you": "Nosotros te debemos",
          "bank_of_america": "banco de america",
          "earnings": "Ganancias",
          "withdrawal_fee": "Tarifa de retiro",
          "total": "Total",
          "cashout": "Retiro de efectivo",
          // cash out success
          "cashed_out_successfully!": "¡Retiro exitoso!",
          "your_money_should_be_available_after_2-3_hours":
              "Su dinero debería estar disponible después de 2 a 3 horas.",
          // password change
          "current_password": "Contraseña actual",
          "new_password": "Nueva contraseña",
          "your_has_been_change_successfully!": "¡Tu cambio ha sido exitoso!",
          // enter name email(sign in)
          "create_your_password": "Crea tu contraseña",
          "ensure_your_password_is_strong_and_meets_the_criteria.":
              "Asegúrese de que su contraseña sea segura y cumpla con los criterios.",
          "re-password": "Volver a contraseña",
          "confirm_password": "Confirmar Contraseña",
          "passwords_do_not_match.": "Las contraseñas no coinciden.",
          "at_least_8_characters": "Al menos 8 caracteres",
          "includes_a_number": "Incluye un número",
          "includes_a_special_character": "Incluye un personaje especial.",
          "strong": "Fuerte",
          "weak": "Débil",
          // enter name email
          "by_signing_up_with_Rydleap_you_agree_to_our ":
              "Al registrarse con Rydleap, acepta nuestro",
          "terms_and_conditions ": "Términos y condiciones",
          "i’m_not_a_robot": "no soy un robot",
          // your location
          "are_you_in_los_angeles?": "¿Estás en Los Ángeles?",
          "yes_i_am": "Sí, lo soy",
          // delete payment method
          "are_you_sure_you_want_to_delete_this_Payment_method?":
              "¿Está seguro de que desea eliminar este método de pago?",
          "no": "No",
          "yes": "Sí",
          // ratings
          "ratings": "Calificaciones",
          // pay pal
          "pay_pal": "PayPal",
          "use_pay_pal_for_quick_and_secure_payments":
              "Utilice Pay Pal para pagos rápidos y seguros",
          "link_pay_pal": "Enlace Paypal",
          // paypal confirmed
          " your_pay_pal_has_been_successfully_linked.":
              "Tu Pay Pal ha sido vinculado exitosamente.",
          // apple pay
          "apple_pay": "pago de manzana",
          "use_apple_pay_for_quick_and_secure_payments":
              "Utilice Apple Pay para pagos rápidos y seguros",
          "link_apply_pay": "Enlace Apple Pay",
          // apple pay confirmed
          "your_apple_pay_has_been_successfully_linked._you_can_now_use_it_for_quick_and_secure_payments.":
              "Tu Apple Pay se ha vinculado correctamente. Ahora puedes usarlo para pagos rápidos y seguros.",
          // google pay error
          "cancel": "Cancelar",
          "retry": "Rever",
          // google pay
          "google_pay": "pago de google",
          "use_google_pay_for_quick_and_secure_payments":
              "Utilice Google Pay para pagos rápidos y seguros",
          "link_google_pay": "Vincular Google Pay",
          // google pay confirmed
          " your_google_pay_has_been_successfully_linked._you_can_now_use_it_for_quick_and_secure_payments.":
              " Su Google Pay se ha vinculado correctamente. Ahora puedes usarlo para pagos rápidos y seguros.",
          // safety tips
          "safety_tips": "Consejos de seguridad",
          "introduction": "Introducción",
          "your_safety_is_our_top_priority.follow_these_tips_to_ensure_a_safe_and_secure_ride_experience":
              "Su seguridad es nuestra principal prioridad. Siga estos consejos para garantizar una experiencia de viaje segura. ",
          "verify_your_ride": "Verifica tu viaje",
          "always_check_the_driver’s_photo,_vehicle_make,_and_license_plate_before_getting_in.":
              "Siempre verifique la fotografía del conductor, la marca del vehículo y la matrícula antes de subir.",
          "share_your_trip_details": "Comparte los detalles de tu viaje",
          "use_the_app_to_share_your_trip_details_with_a_friend_or_family_member.":
              "Utilice la aplicación para compartir los detalles de su viaje con un amigo o familiar.",
          "sit_in_the_back_seat": "Siéntate en el asiento trasero",
          "for_sefety_and_confort,_always_sit_in_the_back_seat.":
              "Por seguridad y comodidad, siéntese siempre en el asiento trasero.",
          "trust_your_instincts": "Confía en tus instintos",
          "if_something_doesn’t_feel_right,_trust_your_instincts_and_exit_the_vehicle.":
              "Si algo no le parece bien, confíe en sus instintos y salga del vehículo.",
          "keep_personal_information_private":
              "Mantenga la información personal privada",
          "don’t_share_personal_information_with_the_driver.":
              "No comparta información personal con el conductor.",
          "back": "Atrás",
          "report": "Informe",
          // logout confirmation
          "are_you_sure_you_want_to_log_out?":
              "¿Estás seguro de que quieres cerrar sesión?",
          "wait": "Esperar",
          "log_out": "Finalizar la sesión",
          // privacy setting saved
          "saved": "Guardado",
          // Terms and Policies
          "terms_and_policies": "Términos y políticas",
          "term_of_service_privacy_policy":
              "Términos de servicio,\nPolítica de privacidad",
          "1_terms_and_conditions": "1. Términos y condiciones",
          "1_privacy_policy": "1. Política de Privacidad",
          "i_agree_with_the_Terms_and_conditions":
              "Estoy de acuerdo con los Términos y Condiciones",
          "i_agree_with_the_privacy_policy":
              "Estoy de acuerdo con la Política de Privacidad",
          "decline": "Rechazar",
          "accept": "Aceptar",
          // Share ride details
          "share_via": "Compartir vía",
          "pre_filled_message": "Mensaje precargado",
          "i_just_completed_a_trip_from_123_main_st_to_456_elm_st_on_2023-07-20_at_14.30_the_total_fare_was_20.00.":
              "Acabo de completar un viaje desde 123 Main St hasta 456 Elm St el 20 de julio de 2023 a las 14:30. La tarifa total fue de 20,00.",
          // Trip Summary
          "trip_summary": "Resumen del viaje",
          "dropoff": "Dejar",
          "time": "Tiempo",
          "fare_breakdown": "Desglose de tarifas",
          "base_fare": "Tarifa básica:",
          "distance": "Distancia:",
          "surcharges": "Recargos:",
          "rate_our_driver": "Califica a nuestra conductora",
          "share_my_ride": "¡Comparte mi viaje!",
          // Ratings
          "rate_your_ride": "Califica tu viaje",
          "rate_your_driver": "Califica a tu conductor",
          "your_rating_will_help_other_rydleap_users":
              "Tu calificación ayudará a otras usuarios de Rydleap.",
          // Redeem success
          "promo_code_success": "¡Éxito del código promocional!",
          "your_code_is_successfully_redeemed.":
              "Su código se canjeó exitosamente",
          // Add card
          "add_card": "Agregar tarjeta",
          "card_number": "Número de tarjeta",
          "please_enter_number_only": "Por favor ingrese solo el número",
          "exp._date": "Exp. Fecha",
          "cvv": "CVV",
          "nickname_(optional)": "Apodo (opcional)",
          "e.g_peace_unity": "por ejemplo, unidad de paz",
          // Schedule a ride (Done)
          "your_ride_is_scheduled": "¡Tu viaje está programado!",
          // Schedule a ride
          "schedule_your_ride": "Programe su viaje",
          "select_time_and_date": "Seleccione hora y fecha",
          "schedule_ride": "Programar viaje",
          // Request a ride
          "riquest a ride": "Solicitar un viaje",
          "economy": "Economía",
          "premium": "De primera calidad",
          "shared": "Compartida",
          "ride_request": "Solicitud de viaje",
          // Home
          "hello": "Hola",
          "pickup_location": "Ubicación de recogida",
          "enter_dropoff": "Ingresar entrega",
          "home": "Hogar",
          "office": "Oficina",
          // Notification access
          "we_need_permission to send you notifications for ride updates. promotions,and more.":
              "Necesitamos permiso para enviarle notificaciones sobre actualizaciones de viajes. promociones y más.",
          // Location access
          'we_need_access_to_your_location_to_show_you_nearby_drivers_and_provide_accurate_pickup_points':
              "Necesitamos acceso a su ubicación para mostrarle los conductores cercanos y brindarle puntos de recogida precisos.",
          "maybe_later": "Quizás más tarde",
          // Support request send
          "support_request_send": "Su solicitud de soporte ha sido enviada.",
          "expected_response_time": "Tiempo de respuesta esperado: 24 horas",
          // Email Support
          "discription": "Descripción",
          "you_can_upload": "Puedes subir PNG/JPG/MOV",
          // Call Support
          "phone_number": "Número de teléfono",
          // Contact support
          "contact_support": "Contactar con soporte",
          "call_support": "Llame a soporte",
          // Notifications
          "all": "TODO",
          "unread": "No leído",
          "todays": "hoy",
          "new": "Nueva",
          // Ride History
          "search_history": "Historial de búsqueda",
          "your_previous_ride_with_redleap_drivers":
              "Tu viaje anterior con conductores redleap",
          "date": "Fecha",
          "pickup": "Levantar",
          "drop-off": "Dejar",
          "fare": "Tarifa",
          "status": "Estado",
          "driver": "Conductora",
          "vehicle": "Vehículo",
          // Report a problem
          "driver_behavior": "Comportamiento del conductor",
          "vehicle_condition": "Condición del vehículo",
          "payment_issue": "Problema de pago",
          "lost_item": "Objeto perdido",
          "other": "Otro",
          "next": "Próximo",
          // Profile Settings
          "accounts": "Cuentas",
          "notifications": "Notificaciones",
          "messages": "Mensajes",
          // About me
          "promotions_and_offers": "promociones y ofertas",
        }, //=======================================================================================================================================================
        //=======================================================================================================================================================
        'pt_PT': {
          // Portuguese
          "language": "Língua",
          // privacy setting
          "privacy": "Privacidade",
          "location": "Localização",
          "data_sharing_with_partners":
              "Compartilhamento de dados com parceiros",
          "ad_personalization": "Personalização de anúncios",
          "only_me": "Só eu",
          "friends": "Amigos",
          "public": "Público",
          "activity_status": "Status da atividade",
          "save": "Salvar",
          "partners": "Parceiros",
          "ride_history": "História do passeio",
          
          // language
          "selective_language": "Linguagem Seletiva",
          "english": "Inglês",
          "spanish": "espanhol",
          "portuguese": "Português",
          "french": "Francês",
          // support request send
          "your_support_request_has_been_sent":
              "Sua solicitação de suporte foi enviada",
          "expected_response_time:24_hours":
              "Tempo de resposta esperado: 24 horas",
          // email_support
          "email_support": "Suporte por e-mail",
          "issue_type": "Tipo de problema",
          "subject": "assunto",
          "description": "descrição",
          "you_can_upload_PNG/JPG/MOV": "Você pode fazer upload de PNG/JPG/MOV",
          "upload": "carregar",
          "send": "enviar",
          //registration
          "get_otp": "Obter OTP",
          "privacy_policy": "política de Privacidade",
          "or_sign_in_with": "Ou faça login com",
          "sign_google": "Faça login com o Google",
          "sign_apple": "Faça login com a Apple",
          "sign_facebook": "Faça login com o Facebook",
          //login
          "log_in": "Conecte-se",
          "remember_me": "Lembre de mim",
          "phone_or_email": "Telefone ou e-mail",
          "password": "Senha",
          "forgotten_password": "Esqueceu a senha?",
          "confirm": "Confirmar",
          "email_or_phone":
              "Digite seu e-mail ou telefone e senha para continuar com Rydleap",
          //forgot_screen
          "forgot_password": "Esqueceu sua senha?",
          "email":
              "Digite seu e-mail para recuperar sua senha e continuar com Rydleap",
          "h_email": "E-mail",
          //otp_2
          "digit_title": "Digite o código de 4 dígitos otp",
          "code_title": "Seu código foi enviado para +(1) xxxx-xxxx",
          "resend_code": "Reenviar código",
          "otp_sent": "OTP enviado",
          "error": "Erro",
          //payment_option_screen
          'payment_options': 'Opções de pagamento',
          "cash_after_reaching": "Dinheiro depois de chegar",
          'add_payment_method': 'Adicionar forma de pagamento',
          'edit': 'Editar',
          'promo_Code': 'Código promocional',
          "continue": "Continuar",
          "cash": "Dinheiro",
          //PromotionOffersScreen
          "promotion_and_offers": "Promoção e ofertas",
          "active_promotions": "Promoções Ativas",
          "promo_title_1": "Título promocional 1",
          "save_20%_on_your_next_ride": "Economize 20% em sua próxima viagem",
          "expiration": "Expiração",
          "promo_title_2": "Título promocional 2",
          "5_off_your_next_3_rides":
              "5 de desconto nas suas próximas 3 viagens",
          "redeem_a_promo_code": "Resgatar um código promocional",
          "redeem": "Resgatar",
          //profile
          "about_me": "About me",
          "settings": "Settings",
          "promotion_offers": "Promotion and offers",
          "change_password": "Change Password",
          "payment_methods": "Payment Methods",
          
          "report_problem": "Report a Problem",
          "contact_us": "Contact us",
          "balance": "Balance",
          "cash_out": "Cash out",
          "drive_history": "Drive History",
          "notifiactions": "Notifications",
          //add accout
          "account_holder": "Titular da conta",
          "routing_number": "Número de roteamento",
          "bank_account_number": "Número da conta bancária",
          "date_of_birth": "Data de nascimento",
          "adress": "Endereço",
          "zipcode": "CEP",
          "submit": "Enviar",
          "error_routing_number":
              "O número de roteamento precisa ter 8 dígitos",
          //calender
          "reset": "Reset",
          "done": "Feito",
          //success
          "success_mag": " Sua conta bancária foi vinculada com sucesso.",
          //Driver Registration
          "driver_registration": "Registro de motorista",
          "add_your_vehicle": "Adicione seu veículo",
          "vehicle_title":
              "Seu veículo deve ser ano 2005 ou mais recente e ter pelo menos 4 portas e não ser recuperado.",
          "make": "Fazer",
          "model": "Modelo",
          "year": "Ano",
          "color": "Cor",
          "licence_plate_number": "Número da matrícula",
          "take_Photo_your_driver’s_licence":
              "Tire uma foto da sua carteira de motorista",
          "make_sure_driver_before_warring_mag":
              "Certifique-se de que sua carteira de motorista não esteja vencida. Clique em uma foto mais nítida e evite usar flash",
          "make_sure_driver_After_warring_mag":
              "Envie esta imagem se achar que é legível ou toque no botão reenviar para enviar outra.",
          "take_photo_vehicle_registration_sticker":
              "Envie esta imagem se achar que é legível ou toque no botão reenviar para enviar outra.",
          // cashout your earnings
          "we_owe_you": "Nós devemos a você",
          "bank_of_america": "Banco da América",
          "earnings": "Ganhos",
          "withdrawal_fee": "Taxa de retirada",
          "total": "Total",
          "cashout": "Sacar",
          // cash out success
          "cashed_out_successfully!": "Saqueado com sucesso!",
          "your_money_should_be_available_after_2-3_hours":
              "Seu dinheiro deverá estar disponível após 2 a 3 horas",
          // password change
          "current_password": "Senha atual",
          "new_password": "Nova Senha",
          "your_has_been_change_successfully!":
              "Sua mudança foi realizada com sucesso!",
          // enter name email(sign in)
          "create_your_password": "Crie sua senha",
          "ensure_your_password_is_strong_and_meets_the_criteria.":
              "Certifique-se de que sua senha seja forte e atenda aos critérios.",
          "re-password": "Nova senha",
          "confirm_password": "Confirme sua senha",
          "passwords_do_not_match.": "As senhas não coincidem.",
          "at_least_8_characters": "Pelo menos 8 caracteres",
          "includes_a_number": "Inclui um número",
          "includes_a_special_character": "Inclui um personagem especial",
          "strong": "Forte",
          "weak": "Fraco",
          // enter name email
          "by_signing_up_with_Rydleap_you_agree_to_our ":
              "Ao se inscrever no Rydleap você concorda com nosso",
          "terms_and_conditions ": "Termos e Condições",
          "i’m_not_a_robot": "Eu não sou um robô",
          // your location
          "are_you_in_los_angeles?": "Você está em Los Angeles?",
          "yes_i_am": "Sim eu sou",
          // delete payment method
          "are_you_sure_you_want_to_delete_this_Payment_method?":
              "Tem certeza de que deseja excluir esta forma de pagamento?",
          "no": "Não",
          "yes": "Sim",
          // ratings
          "ratings": "Avaliações",
          // pay pal
          "pay_pal": "PayPal",
          "use_pay_pal_for_quick_and_secure_payments":
              "Use Pay Pal para pagamentos rápidos e seguros",
          "link_pay_pal": "Vincular Paypal",
          // paypal confirmed
          " your_pay_pal_has_been_successfully_linked.":
              "Seu Pay Pal foi vinculado com sucesso.",
          // apple pay
          "apple_pay": "Apple Pagar",
          "use_apple_pay_for_quick_and_secure_payments":
              "Use o Apple Pay para pagamentos rápidos e seguros",
          "link_apply_pay": "Vincular Apple Pay",
          // apple pay confirmed
          "your_apple_pay_has_been_successfully_linked._you_can_now_use_it_for_quick_and_secure_payments.":
              " Seu Apple Pay foi vinculado com sucesso. Agora você pode usá-lo para pagamentos rápidos e seguros.",
          // google pay error
          "cancel": "Cancelar",
          "retry": "Tentar novamente",
          // google pay
          "google_pay": "Google Pay",
          "use_google_pay_for_quick_and_secure_payments":
              "Use o Google Pay para pagamentos rápidos e seguros",
          "link_google_pay": "Vincular Google Pay",
          // google pay confirmed
          " your_google_pay_has_been_successfully_linked._you_can_now_use_it_for_quick_and_secure_payments.":
              " Seu Google Pay foi vinculado com sucesso. Agora você pode usá-lo para pagamentos rápidos e seguros.",
          // safety tips
          "safety_tips": "Dicas de segurança",
          "introduction": "Introdução",
          "your_safety_is_our_top_priority.follow_these_tips_to_ensure_a_safe_and_secure_ride_experience":
              "Sua segurança é nossa principal prioridade. Siga estas dicas para garantir uma experiência de viagem segura e protegida. ",
          "verify_your_ride": "Verifique sua viagem",
          "always_check_the_driver’s_photo,_vehicle_make,_and_license_plate_before_getting_in.":
              "Verifique sempre a foto do motorista, a marca do veículo e a placa antes de entrar.",
          "share_your_trip_details": "Compartilhe os detalhes da sua viagem",
          "use_the_app_to_share_your_trip_details_with_a_friend_or_family_member.":
              "Use o aplicativo para compartilhar os detalhes da sua viagem com um amigo ou familiar.",
          "sit_in_the_back_seat": "Sente-se no banco de trás",
          "for_sefety_and_confort,_always_sit_in_the_back_seat.":
              "Para maior segurança e conforto, sente-se sempre no banco traseiro.",
          "trust_your_instincts": "Confie nos seus instintos",
          "if_something_doesn’t_feel_right,_trust_your_instincts_and_exit_the_vehicle.":
              "Se algo não parecer certo, confie nos seus instintos e saia do veículo.",
          "keep_personal_information_private":
              "Mantenha as informações pessoais privadas",
          "don’t_share_personal_information_with_the_driver.":
              "Não compartilhe informações pessoais com o motorista.",
          "back": "Voltar",
          "report": "Relatório",
          // logout confirmation
          "are_you_sure_you_want_to_log_out?":
              "Tem certeza de que deseja sair?",
          "wait": "Espere",
          "log_out": "Sair",
          // privacy setting saved
          "saved": "Salvo",
          // Terms and Policies
          "terms_and_policies": "Termos e Políticas",
          "term_of_service_privacy_policy":
              "Termos de Serviço,\nPolítica de Privacidade",
          "1_terms_and_conditions": "1. Termos e Condições",
          "1_privacy_policy": "1. Política de Privacidade",
          "i_agree_with_the_Terms_and_conditions":
              "Concordo com os Termos e Condições",
          "i_agree_with_the_privacy_policy":
              "Concordo com a Política de Privacidade",
          "decline": "Declínio",
          "accept": "Aceitar",
          // Share ride details
          "share_via": "Compartilhar via",
          "pre_filled_message": "Mensagem pré-preenchida",
          "i_just_completed_a_trip_from_123_main_st_to_456_elm_st_on_2023-07-20_at_14.30_the_total_fare_was_20.00.":
              "Acabei de completar uma viagem de 123 Main St para 456 Elm St em 20/07/2023 às 14h30. A tarifa total foi 20h00.",
          // Trip Summary
          "trip_summary": "Resumo da viagem",
          "dropoff": "Desistência",
          "time": "Tempo",
          "fare_breakdown": "Divisão de tarifas",
          "base_fare": "Tarifa básica:",
          "distance": "Distância:",
          "surcharges": "Sobretaxas:",
          "rate_our_driver": "Avalie nosso motorista",
          "share_my_ride": "Compartilhe meu passeio!",
          // Ratings
          "rate_your_ride": "Avalie seu passeio",
          "rate_your_driver": "Avalie seu motorista",
          "your_rating_will_help_other_rydleap_users":
              "Sua classificação ajudará outros usuários do Rydleap",
          // Redeem success
          "promo_code_success": "Sucesso no código promocional!",
          "your_code_is_successfully_redeemed.":
              "Seu código foi resgatado com sucesso",
          // Add card
          "add_card": "Adicionar cartão",
          "card_number": "Número do cartão",
          "please_enter_number_only": "Por favor insira apenas o número",
          "exp._date": "Exp. Data",
          "cvv": "CVV",
          "nickname_(optional)": "Apelido (opcional)",
          "e.g_peace_unity": "por exemplo, Unidade de Paz",
          // Schedule a ride (Done)
          "your_ride_is_scheduled": "Seu passeio está agendado!",
          // Schedule a ride
          "schedule_your_ride": "Agende sua viagem",
          "select_time_and_date": "Selecione hora e data",
          "schedule_ride": "Agendar passeio",
          // Request a ride
          "riquest a ride": "Solicite uma carona",
          "economy": "Economia",
          "premium": "Prêmio",
          "shared": "Compartilhada",
          "ride_request": "Solicitação de viagem",
          // Home
          "hello": "Olá",
          "pickup_location": "Local de retirada",
          "enter_dropoff": "Entrar na entrega",
          "home": "Lar",
          "office": "Escritório",
          // Notification access
          "we_need_permission to send you notifications for ride updates. promotions,and more.":
              "Precisamos de permissão para enviar notificações sobre atualizações de viagens. promoções e muito mais.",
          // Location access
          'we_need_access_to_your_location_to_show_you_nearby_drivers_and_provide_accurate_pickup_points':
              "Precisamos de acesso à sua localização para mostrar motoristas próximos e fornecer pontos de coleta precisos.",
          "maybe_later": "Talvez mais tarde",
          // Support request send
          "support_request_send": "Sua solicitação de suporte foi enviada.",
          "expected_response_time": "Tempo de resposta esperado: 24 horas",
          // Email Support
          "discription": "Descrição",
          "you_can_upload": "Você pode fazer upload de PNG/JPG/MOV",
          // Call Support
          "phone_number": "Número de telefone",
          // Contact support
          "contact_support": "Contate o suporte",
          "call_support": "Ligue para o suporte",
          // Notifications
          "all": "TODOS",
          "unread": "Não lido",
          "todays": "Hoje",
          "new": "Nova",
          // Ride History
          "search_history": "Histórico de pesquisa",
          "your_previous_ride_with_redleap_drivers":
              "Sua viagem anterior com motoristas redleap",
          "date": "Data",
          "pickup": "Escolher",
          "drop-off": "Desembarque",
          "fare": "Tarifa",
          "status": "Status",
          "driver": "Motorista",
          "vehicle": "Veículo",
          // Report a problem
          "driver_behavior": "Comportamento do motorista",
          "vehicle_condition": "Condição do veículo",
          "payment_issue": "Problema de pagamento",
          "lost_item": "Item perdido",
          "other": "Outro",
          "next": "Próximo",
          // Profile Settings
          "accounts": "Contas",
          "notifications": "Notificações",
          "messages": "Mensagens",
          // About me
          "promotions_and_offers": "promoções e ofertas",
        }, // ==================================================================================================================================================
        // ==================================================================================================================================================
        // ==================================================================================================================================================
        'fr_FR': {
          // French
          "language": "Langue",
          // privacy setting
          "privacy": "Confidentialité",
          "location": "Emplacement",
          "data_sharing_with_partners":
              "Partage de données avec les partenaires",
          "ad_personalization": "Personnalisation des annonces",
          "only_me": "Seulement moi",
          "friends": "Amis",
          "public": "Public",
          "activity_status": "Statut d'activité",
          "save": "Sauvegarder",
          "partners": "Partenaires",
          "ride_history": "Historique du trajet",
          // language
          "selective_language": "Langue sélective",
          "english": "Anglais",
          "spanish": "espagnol",
          "portuguese": "portugais",
          "french": "Français",
          // support request send
          "your_support_request_has_been_sent":
              "Votre demande d'assistance a été envoyée",
          "expected_response_time:24_hours":
              "Délai de réponse attendu : 24 heures",
          // email_support
          "email_support": "Assistance par e-mail",
          "issue_type": "Type de problème",
          "subject": "sujette",
          "description": "description",
          "you_can_upload_PNG/JPG/MOV": "Vous pouvez télécharger PNG/JPG/MOV",
          "upload": "télécharger",
          "send": "envoyer",
          //registration
          "get_otp": "Obtenir OTP",
          "privacy_policy": "politique de confidentialité",
          "or_sign_in_with": "Ou connectez-vous avec",
          "sign_google": "Connectez-vous avec Google",
          "sign_apple": "Connectez-vous avec Apple",
          "sign_facebook": "Connectez-vous avec Facebook",
          //login
          "log_in": "Se connecter",
          "remember_me": "ConnexionSe souvenir de moi",
          "phone_or_email": "Téléphone ou email",
          "password": "Mot de passe",
          "forgotten_password": "Mot de passe oublié ?",
          "confirm": "Confirmer",
          "email_or_phone":
              "Entrez votre e-mail ou votre téléphone et votre mot de passe pour continuer avec Rydleap",
          //forgot_screen
          "forgot_password": "Mot de passe oublié ?",
          "email":
              "Entrez votre e-mail pour récupérer votre mot de passe pour continuer avec Rydleap",
          "h_email": "E-mail",
          //otp_2
          "digit_title": "Entrez le code à 4 chiffres otp",
          "code_title": "Votre code a été envoyé au +(1) xxxx-xxxx",
          "resend_code": "Renvoyer le code",
          "otp_sent": "OTP envoyé",
          "error": "Erreur",
          //payment_option_screen
          'payment_options': 'Options de paiement',
          "cash_after_reaching": "En espèces après avoir atteint",
          'add_payment_method': 'Ajouter un mode de paiement',
          'edit': 'Modifier',
          'promo_Code': 'Code promotionnel',
          "continue": 'Continuer',
          "cash": "Espèces",
          //PromotionOffersScreen
          "promotion_and_offers": "Promotions et offres",
          "active_promotions": "Promotions actives",
          "promo_title_1": "Titre promotionnel 1",
          "save_20%_on_your_next_ride":
              "Économisez 20 % sur votre prochain trajet",
          "expiration": "Expiration",
          "promo_title_2": "Titre promotionnel 2",
          "5_off_your_next_3_rides":
              "5 de réduction sur vos 3 prochains trajets",
          "redeem_a_promo_code": "Utiliser un code promotionnel",
          "redeem": "Racheter",
          //profile
          "about_me": "About me",
          "settings": "Settings",
          "promotion_offers": "Promotion and offers",
          "change_password": "Change Password ",
          "payment_methods": "Payment Methods",
          
          "report_problem": "Report a Problem",
          "contact_us": "Contact us",
          "balance": "Balance",
          "cash_out": "Cash out",
          "drive_history": "Drive History",
          "notifiactions": "Notifications",
          //add accout

          "account_holder": "Titulaire du compte",
          "routing_number": "Numéro d'acheminement",
          "bank_account_number": "Numéro de compte bancaire",
          "date_of_birth": "Data de nascimento",
          "adress": "Adresse",
          "zipcode": "Code postal",
          "submit": "Soumettre",
          "error_routing_number":
              "Le numéro de routage doit contenir 8 chiffres",
          //calender
          "reset": "Reset",
          "done": "Fait",
          //success
          "success_mag": "Votre compte bancaire a été lié avec succès.",
          //Driver Registration
          "driver_registration": "Inscription du conducteur",
          "add_your_vehicle": "Ajoutez votre véhicule",
          "vehicle_title":
              "Votre véhicule doit être de 2005 ou plus récent et avoir au moins 4 portes et non récupéré.",
          "make": "Faire",
          "model": "Modèle",
          "year": "Année",
          "color": "Couleur",
          "licence_plate_number": "Numéro de plaque d'immatriculation",
          "take_Photo_your_driver’s_licence":
              "Prenez une photo de votre permis de conduire",
          "make_sure_driver_before_warring_mag":
              "Assurez-vous que votre permis de conduire n'est pas expiré. Veuillez cliquer sur une photo plus claire et éviter d'utiliser le flash.",
          "make_sure_driver_After_warring_mag":
              "Soumettez cette image si vous pensez qu'elle est lisible ou appuyez sur le bouton de ré-télécharger pour en télécharger une autre.",
          "take_photo_vehicle_registration_sticker":
              "Soumettez cette image si vous pensez qu'elle est lisible ou appuyez sur le bouton de ré-télécharger pour en télécharger une autre.",
          // cashout your earnings
          "we_owe_you": "Nous vous devons ",
          "bank_of_america": "Banque d'Amérique",
          "earnings": "Gains",
          "withdrawal_fee": "Frais de retrait",
          "total": "Total",
          "cashout": "Encaissement",
          // cash out success
          "cashed_out_successfully!": "Encaissé avec succès !",
          "your_money_should_be_available_after_2-3_hours":
              "Votre argent devrait être disponible après 2 à 3 heures",
          // password change
          "current_password": "Mot de passe actuel",
          "new_password": "Nouveau mot de passe",
          "your_has_been_change_successfully!":
              "Votre changement a été réussi !",
          // enter name email(sign in)
          "create_your_password": "Créez votre mot de passe",
          "ensure_your_password_is_strong_and_meets_the_criteria.":
              "Assurez-vous que votre mot de passe est fort et répond aux critères.",
          "re-password": "Re-mot de passe",
          "confirm_password": "Confirmez le mot de passe",
          "passwords_do_not_match.": "Les mots de passe ne correspondent pas.",
          "at_least_8_characters": "Au moins 8 caractères",
          "includes_a_number": "Comprend un numéro",
          "includes_a_special_character": "Comprend un caractère spécial",
          "strong": "Fort",
          "weak": "Faible",
          // enter name email
          "by_signing_up_with_Rydleap_you_agree_to_our ":
              "En vous inscrivant sur Rydleap, vous acceptez notre",
          "terms_and_conditions ": "Termes et conditions",
          "i’m_not_a_robot": "je ne suis pas un robot",
          // your location
          "are_you_in_los_angeles?": "Êtes-vous à Los Angeles?",
          "yes_i_am": "Oui je suis",
          // delete payment method
          "are_you_sure_you_want_to_delete_this_Payment_method?":
              "Êtes-vous sûr de vouloir supprimer ce mode de paiement ?",
          "no": "Non",
          "yes": "Oui",
          // ratings
          "ratings": "Notes",
          // pay pal
          "pay_pal": "Paypal",
          "use_pay_pal_for_quick_and_secure_payments":
              "Utilisez Pay Pal pour des paiements rapides et sécurisés",
          "link_pay_pal": "Lien Paypal",
          // paypal confirmed
          " your_pay_pal_has_been_successfully_linked.":
              " Votre Pay Pal a été lié avec succès.",
          // apple pay
          "apple_pay": "Apple Payer",
          "use_apple_pay_for_quick_and_secure_payments":
              "Utilisez Apple Pay pour des paiements rapides et sécurisés",
          "link_apply_pay": "Associer Apple Pay   ",
          // apple pay confirmed
          "your_apple_pay_has_been_successfully_linked._you_can_now_use_it_for_quick_and_secure_payments.":
              " Votre Apple Pay a été lié avec succès. Vous pouvez désormais l'utiliser pour des paiements rapides et sécurisés.",
          // google pay error
          "cancel": "Annuler",
          "retry": "Réessayer",
          // google pay
          "google_pay": "Google Payer",
          "use_google_pay_for_quick_and_secure_payments":
              "Utilisez Google Pay pour des paiements rapides et sécurisés",
          "link_google_pay": "Associer Google Pay",
          // google pay confirmed
          " your_google_pay_has_been_successfully_linked._you_can_now_use_it_for_quick_and_secure_payments.":
              " Votre Google Pay a été associé avec succès. Vous pouvez désormais l'utiliser pour des paiements rapides et sécurisés.",
          // safety tips
          "safety_tips": "Conseils de sécurité",
          "introduction": "Introduction",
          "your_safety_is_our_top_priority.follow_these_tips_to_ensure_a_safe_and_secure_ride_experience":
              "Votre sécurité est notre priorité absolue. Suivez ces conseils pour garantir une expérience de conduite sûre et sécurisée. ",
          "verify_your_ride": "Vérifiez votre trajet",
          "always_check_the_driver’s_photo,_vehicle_make,_and_license_plate_before_getting_in.":
              "Vérifiez toujours la photo du conducteur, la marque du véhicule et la plaque d’immatriculation avant de monter.",
          "share_your_trip_details": "Partagez les détails de votre voyage",
          "use_the_app_to_share_your_trip_details_with_a_friend_or_family_member.":
              "Utilisez l'application pour partager les détails de votre voyage avec un ami ou un membre de votre famille.",
          "sit_in_the_back_seat": "Asseyez-vous sur la banquette arrière",
          "for_sefety_and_confort,_always_sit_in_the_back_seat.":
              "Pour plus de sécurité et de confort, asseyez-vous toujours sur la banquette arrière.",
          "trust_your_instincts": "Faites confiance à votre instinct",
          "if_something_doesn’t_feel_right,_trust_your_instincts_and_exit_the_vehicle.":
              "Si quelque chose ne va pas, faites confiance à votre instinct et sortez du véhicule.",
          "keep_personal_information_private":
              "Gardez les informations personnelles privées",
          "don’t_share_personal_information_with_the_driver.":
              "Ne partagez pas d’informations personnelles avec le conducteur.",
          "back": "Dos",
          "report": "Rapport",
          // logout confirmation
          "are_you_sure_you_want_to_log_out?":
              "Êtes-vous sûr de vouloir vous déconnecter ?",
          "wait": "Attendez",
          "log_out": "Se déconnecter",
          // privacy setting saved
          "saved": "Enregistré",
          // Terms and Policies
          "terms_and_policies": "Conditions et politiques",
          "term_of_service_privacy_policy":
              "Conditions d'utilisation,\nPolitique de confidentialité",
          "1_terms_and_conditions": "1. Conditions générales",
          "1_privacy_policy": "1. Politique de confidentialité",
          "i_agree_with_the_Terms_and_conditions":
              "J'accepte les termes et conditions",
          "i_agree_with_the_privacy_policy":
              "J'accepte la politique de confidentialité",
          "decline": "Déclin",
          "accept": "Accepter",
          // Share ride details
          "share_via": "Partager via",
          "pre_filled_message": "Message pré-rempli",
          "i_just_completed_a_trip_from_123_main_st_to_456_elm_st_on_2023-07-20_at_14.30_the_total_fare_was_20.00.":
              "Je viens de terminer un voyage du 123 Main St au 456 Elm St le 20/07/2023 à 14h30. Le tarif total était de 20,00.",
          // Trip Summary
          "trip_summary": "Résumé du voyage",
          "dropoff": "Dépôt",
          "time": "Temps",
          "fare_breakdown": "Répartition des tarifs",
          "base_fare": "Tarif de base:",
          "distance": "Distance:",
          "surcharges": "Suppléments:",
          "rate_our_driver": "Évaluez notre chauffeur",
          "share_my_ride": "Partagez mon trajet!",
          // Ratings
          "rate_your_ride": "Évaluez votre trajet",
          "rate_your_driver": "Évaluez votre chauffeur",
          "your_rating_will_help_other_rydleap_users":
              "Votre note aidera les autres utilisateurs de Rydleap",
          // Redeem success
          "promo_code_success": "Réussissez votre code promotionnel!",
          "your_code_is_successfully_redeemed.":
              "Votre code a été utilisé avec succès",
          // Add card
          "add_card": "Ajouter une carte",
          "card_number": "Numéro de carte",
          "please_enter_number_only": "Veuillez saisir uniquement le numéro",
          "exp._date": "Exp. Date",
          "cvv": "CVV",
          "nickname_(optional)": "Surnom (facultatif)",
          "e.g_peace_unity": "par exemple, unité de paix",
          // Schedule a ride (Done)
          "your_ride_is_scheduled": "Votre balade est programmée!",
          // Schedule a ride
          "schedule_your_ride": "Planifiez votre trajet",
          "select_time_and_date": "Sélectionnez l'heure et la date",
          "schedule_ride": "Planifier le trajet",
          // Request a ride
          "riquest a ride": "Demander un trajet",
          "economy": "Économie",
          "premium": "Prime",
          "shared": "Commune",
          "ride_request": "Demande de trajet",
          // Home
          "hello": "Bonjour",
          "pickup_location": "Lieu de prise en charge",
          "enter_dropoff": "Entrez le dépôt",
          "home": "Maison",
          "office": "Bureau",
          // Notification access
          "we_need_permission to send you notifications for ride updates. promotions,and more.":
              "Nous avons besoin d'une autorisation pour vous envoyer des notifications pour les mises à jour des trajets. promotions, et plus encore.",
          // Location access
          'we_need_access_to_your_location_to_show_you_nearby_drivers_and_provide_accurate_pickup_points':
              "Nous avons besoin d'accéder à votre position pour vous montrer les chauffeurs à proximité et vous fournir des points de prise en charge précis.",
          "maybe_later": "Peut-être plus tard",
          // Support request send
          "support_request_send": "Votre demande d'assistance a été envoyée.",
          "expected_response_time": "Délai de réponse attendu : 24 heures",
          // Email Support
          "discription": "Description",
          "you_can_upload": "Vous pouvez télécharger PNG/JPG/MOV",
          // Call Support
          "phone_number": "Numéro de téléphone",
          // Contact support
          "contact_support": "Contacter l'assistance",
          "call_support": "Appeler l'assistance",
          // Notifications
          "all": "TOUTE",
          "unread": "Non lu",
          "todays": "Aujourd'hui",
          "new": "Nouvelle",
          // Ride History
          "search_history": "Historique de recherche",
          "your_previous_ride_with_redleap_drivers":
              "Votre précédent trajet avec les chauffeurs Redleap",
          "date": "Date",
          "pickup": "Ramasser",
          "drop-off": "Dépôt",
          "fare": "Tarif",
          "status": "Statut",
          "driver": "Conductrice",
          "vehicle": "Véhicule",
          // Report a problem
          "driver_behavior": "Comportement du conducteur",
          "vehicle_condition": "État du véhicule",
          "payment_issue": "Problème de paiement",
          "lost_item": "Objet perdu",
          "other": "Autre",
          "next": "Suivant",
          // Profile Settings
          "accounts": "Comptes",
          "notifications": "Notifications",
          "messages": "Messages",
          // About me
          "promotions_and_offers": "promotions et offres",
        },
      };
}
