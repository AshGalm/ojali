<image src="https://firebasestorage.googleapis.com/v0/b/ojalistore.appspot.com/o/cover.png?alt=media&token=de6911c9-ff59-4d3a-83f9-c34d3f32c4e5"
 width=1000
 height=450
 />
# :convenience_store:	 Ojali

Donwload [MEGA](https://mega.nz/file/fzIXjC6L#11LzlPA4eUgkngUeOe2CoQeDDxkvRZfJ0Q0gLvZsMH4)

### About the app
##### :information_source:	 The Ojali application is an application that specializes in booking food orders and facilitating reservations
---

### :framed_picture: Screens
<div> 
<image src="https://firebasestorage.googleapis.com/v0/b/ojalistore.appspot.com/o/lightMode%2FScreenshot_%D9%A2%D9%A0%D9%A2%D9%A3%D9%A0%D9%A5%D9%A0%D9%A9-%D9%A1%D9%A2%D9%A0%D9%A8%D9%A2%D9%A6.jpg?alt=media&token=c2e6204e-42c8-435a-af59-bca0c0ac333e" 
       width=300 height=460
       />
  <image src="https://firebasestorage.googleapis.com/v0/b/ojalistore.appspot.com/o/lightMode%2FSimulator%20Screenshot%20-%20iPhone%2014%20Pro%20Max%20-%202023-05-09%20at%2017.08.20.png?alt=media&token=3bd0763c-e7b9-4e94-971d-c574e37334ef"  width=300 height=460/>
</div>
<div> 
<image src="https://firebasestorage.googleapis.com/v0/b/ojalistore.appspot.com/o/lightMode%2F1.png?alt=media&token=094e351b-280f-4518-ad16-38f76a6c1b34" width=300 height=460 />
  <image src="https://firebasestorage.googleapis.com/v0/b/ojalistore.appspot.com/o/lightMode%2F2.png?alt=media&token=aac81947-5da6-4174-8740-235a54213d31" width=300 height=460 />
</div>

---

### :star2:	 Features
##### :star:	 Responsive application :fire:	:heavy_check_mark:	
##### :star: Multi-language support [ar-en] :ab:	  :heavy_check_mark:	
##### :star: Ability to order and view order :pizza:	 :heavy_check_mark:	
##### :star: Light mode and dark mode :first_quarter_moon:	:heavy_check_mark:	
##### :star: Ability to display branches  :heavy_check_mark:	
##### :star: Filtering categories :mag:	:heavy_check_mark:	
##### :star: Recovery your account :technologist:	:heavy_check_mark:	
##### :star: reporting bugs :mailbox_with_mail:	:heavy_check_mark:	
---


### :toolbox:	dependencies

#####  flutter_localizations
 ##### cupertino_icons
#####  google_fonts
#####  pin_code_fields
#####  another_flushbar
#####  fluttertoast
#####  url_launcher
#####  font_awesome_flutter
#####  shared_preferences
#####  http
#####  provider
#####  introduction_screen
#####  carousel_slider
#####  cloud_firestore
#####  firebase_auth
#####  firebase_core
---

### :toolbox:	dev_dependencies
##### flutter_launcher_icons

---

### :hammer_and_pick:	other tools
##### notion.so
##### microsoft to do

---

# :writing_hand: App Tree

<pre>
assets/
┣ introscreen/
┃ ┣ intro1.png
┃ ┣ intro2.png
┃ ┗ intro3.png
┣ ogbranches/
┃ ┣ Rhabi.jpg
┃ ┣ salmen.jpg
┃ ┣ t1.jpg
┃ ┗ t2.jpg
┣ done.png
┣ food.jpg
┣ icon.png
┣ logo.png
┣ logo2.png
┣ nofood.png
┣ play_store_512.png
┣ send.png
┗ setting.png
</pre>

<pre>
lib/
┣ helpers/
┃ ┗ const.dart
┣ l10n/
┃ ┣ app_ar.arb
┃ ┗ app_en.arb
┣ models/
┃ ┣ branches_model.dart
┃ ┣ category_model.dart
┃ ┣ order_model.dart
┃ ┣ product_model.dart
┃ ┣ report_model.dart
┃ ┗ user_model.dart
┣ providers/
┃ ┣ branches_provider.dart
┃ ┣ cart_provider.dart
┃ ┣ dark_theme_provider.dart
┃ ┣ order_provider.dart
┃ ┣ prodcut_provider.dart
┃ ┣ setting_provider.dart
┃ ┗ user_provider.dart
┣ screens/
┃ ┣ auth_screens/
┃ ┃ ┣ intro_screen.dart
┃ ┃ ┣ login_screen.dart
┃ ┃ ┣ otp_screen.dart
┃ ┃ ┣ sing_up_screen.dart
┃ ┃ ┣ splash_screen.dart
┃ ┃ ┗ verification_screen.dart
┃ ┣ handling_screens/
┃ ┃ ┣ no_data_screen.dart
┃ ┃ ┣ order_succed.dart
┃ ┃ ┣ otp_screen.dart
┃ ┃ ┣ res_succed.dart
┃ ┃ ┗ send_data_screen.dart
┃ ┣ main_screens/
┃ ┃ ┣ cart_screen.dart
┃ ┃ ┣ home_screen.dart
┃ ┃ ┣ inform_screen.dart
┃ ┃ ┣ order_screen.dart
┃ ┃ ┣ our_branches_screen.dart
┃ ┃ ┣ reset_password_screen.dart
┃ ┃ ┣ setting_screen.dart
┃ ┃ ┣ store_screen.dart
┃ ┃ ┗ tabs_screen.dart
┃ ┗ sub_screens/
┃   ┣ food_details_screen.dart
┃   ┣ order_details_screen.dart
┃   ┗ user_setting_screen.dart
┣ widgets/
┃ ┣ clickable_widgets/
┃ ┃ ┣ branches_card.dart
┃ ┃ ┣ clickacble_text_widget.dart
┃ ┃ ┣ filter_button.dart
┃ ┃ ┣ food_card.dart
┃ ┃ ┣ main_button.dart
┃ ┃ ┣ order_card.dart
┃ ┃ ┣ small_card.dart
┃ ┃ ┗ switch_mode.dart
┃ ┣ dialogs/
┃ ┃ ┗ custom_flushbar_widget.dart
┃ ┣ input_widgets/
┃ ┃ ┣ addres_field_widget.dart
┃ ┃ ┗ text_field_widget.dart
┃ ┣ static_widgets/
┃ ┃ ┣ carousel_widget.dart
┃ ┃ ┣ intro_card.dart
┃ ┃ ┗ welcome_card_widget.dart
┃ ┗ cart_widget.dart
┣ firebase_options.dart
┗ main.dart
</pre>

## Installation +  Run The app

### Getting Started by
```
git pub
```










