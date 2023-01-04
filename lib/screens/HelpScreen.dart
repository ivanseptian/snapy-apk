import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:markaz_snappy/modules/HelpScreen/HelpScreen.dart';

import '../config/assets.dart';
import '../config/colors.dart';

class HelpScreen extends StatelessWidget {
  final HelpScreenController helpScreen;

  const HelpScreen(this.helpScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsValue.logo,
                    height: 25.h,
                    width: 25.w,
                  )
                ],
              ),
              Gap(20.h),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At volutpat diam ut venenatis. Aliquet enim tortor at auctor urna. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar. Est ullamcorper eget nulla facilisi etiam dignissim diam. Et magnis dis parturient montes nascetur ridiculus. Habitant morbi tristique senectus et. Auctor neque vitae tempus quam pellentesque nec. Interdum velit laoreet id donec ultrices tincidunt arcu non. Diam maecenas ultricies mi eget mauris pharetra et ultrices neque. Aliquam sem et tortor consequat. Nibh sed pulvinar proin gravida."
                    "Vitae nunc sed velit dignissim sodales ut eu. Posuere lorem ipsum dolor sit. Rhoncus mattis rhoncus urna neque viverra justo nec. Scelerisque mauris pellentesque pulvinar pellentesque habitant. Pellentesque massa placerat duis ultricies lacus. Mauris sit amet massa vitae tortor condimentum lacinia quis. Praesent tristique magna sit amet purus gravida quis blandit turpis. Enim praesent elementum facilisis leo vel fringilla est. Massa sapien faucibus et molestie ac feugiat sed lectus. Eu mi bibendum neque egestas congue quisque egestas diam. Sit amet facilisis magna etiam tempor. Luctus venenatis lectus magna fringilla urna porttitor. Amet aliquam id diam maecenas ultricies mi eget mauris. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Bibendum neque egestas congue quisque egestas. Est ullamcorper eget nulla facilisi etiam. Auctor eu augue ut lectus arcu bibendum at varius. Euismod in pellentesque massa placerat duis. Nibh tortor id aliquet lectus proin nibh nisl."
                    "In hendrerit gravida rutrum quisque non tellus. Dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Ipsum a arcu cursus vitae congue mauris rhoncus aenean. Eu consequat ac felis donec et odio. Massa vitae tortor condimentum lacinia quis. Tellus at urna condimentum mattis pellentesque id. Interdum velit euismod in pellentesque. Sodales ut etiam sit amet nisl purus in. Nec dui nunc mattis enim. Iaculis nunc sed augue lacus viverra vitae. Sapien faucibus et molestie ac feugiat sed lectus vestibulum. Quis auctor elit sed vulputate. Et sollicitudin ac orci phasellus egestas tellus rutrum. Nisl nisi scelerisque eu ultrices vitae auctor eu. Dui faucibus in ornare quam viverra orci. Ac turpis egestas integer eget. Adipiscing diam donec adipiscing tristique risus nec feugiat in fermentum."
                    "Sed lectus vestibulum mattis ullamcorper. Scelerisque in dictum non consectetur. Dictum fusce ut placerat orci nulla pellentesque dignissim enim. Nunc congue nisi vitae suscipit tellus mauris a diam maecenas. Nunc lobortis mattis aliquam faucibus purus in massa. Auctor augue mauris augue neque gravida in fermentum. Maecenas volutpat blandit aliquam etiam. Vitae sapien pellentesque habitant morbi. Eget mauris pharetra et ultrices neque ornare aenean euismod elementum. Eget est lorem ipsum dolor sit amet consectetur adipiscing elit. Commodo elit at imperdiet dui accumsan sit amet nulla facilisi. Netus et malesuada fames ac turpis egestas integer eget. Ultrices eros in cursus turpis massa tincidunt dui ut ornare. Felis donec et odio pellentesque diam volutpat commodo sed. Pulvinar mattis nunc sed blandit libero."
                    "Feugiat vivamus at augue eget. In ante metus dictum at tempor. Lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Integer vitae justo eget magna fermentum iaculis eu non diam. Tellus in hac habitasse platea dictumst. Proin libero nunc consequat interdum varius sit amet mattis. Arcu cursus vitae congue mauris. Elementum integer enim neque volutpat ac tincidunt vitae. Sapien pellentesque habitant morbi tristique senectus et netus et malesuada. Ornare aenean euismod elementum nisi quis. Ac placerat vestibulum lectus mauris. Enim ut sem viverra aliquet eget sit. Vitae auctor eu augue ut lectus arcu bibendum at. Dolor magna eget est lorem. Condimentum vitae sapien pellentesque habitant."
                    "Magna etiam tempor orci eu lobortis elementum nibh. Ut tortor pretium viverra suspendisse potenti nullam ac tortor. Lobortis mattis aliquam faucibus purus in massa tempor nec. Mauris ultrices eros in cursus turpis massa tincidunt. Ultrices in iaculis nunc sed augue. Elementum nisi quis eleifend quam. Semper auctor neque vitae tempus quam pellentesque. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh sed. Vel pharetra vel turpis nunc eget lorem dolor sed. Diam donec adipiscing tristique risus nec feugiat in. Justo nec ultrices dui sapien eget mi proin sed libero. Dui ut ornare lectus sit amet est placerat in. Interdum posuere lorem ipsum dolor sit amet. Massa tincidunt dui ut ornare lectus. Nisl nunc mi ipsum faucibus vitae aliquet nec. Sed risus ultricies tristique nulla aliquet enim. Nunc vel risus commodo viverra maecenas accumsan. Maecenas accumsan lacus vel facilisis volutpat est velit egestas dui."
                    "Nunc scelerisque viverra mauris in aliquam. Consectetur adipiscing elit ut aliquam. Volutpat sed cras ornare arcu dui. Vulputate ut pharetra sit amet aliquam id diam maecenas. Montes nascetur ridiculus mus mauris vitae ultricies leo integer. Malesuada proin libero nunc consequat interdum varius sit amet mattis. Vel orci porta non pulvinar neque laoreet suspendisse. Orci nulla pellentesque dignissim enim sit amet venenatis urna cursus. Mi ipsum faucibus vitae aliquet nec ullamcorper sit amet. Libero justo laoreet sit amet cursus sit. Augue lacus viverra vitae congue eu. Dolor sit amet consectetur adipiscing. Sodales ut eu sem integer vitae. Natoque penatibus et magnis dis parturient montes nascetur ridiculus. Tempor commodo ullamcorper a lacus vestibulum sed. Senectus et netus et malesuada. Duis ut diam quam nulla. Turpis massa sed elementum tempus egestas sed sed risus pretium. Pulvinar elementum integer enim neque volutpat."
                    "Sed sed risus pretium quam vulputate dignissim suspendisse. Malesuada bibendum arcu vitae elementum curabitur vitae nunc sed. Interdum velit laoreet id donec ultrices tincidunt arcu. Donec et odio pellentesque diam volutpat commodo. At elementum eu facilisis sed odio morbi quis. A iaculis at erat pellentesque adipiscing commodo. Porttitor lacus luctus accumsan tortor posuere ac ut consequat. Imperdiet dui accumsan sit amet nulla. Nam libero justo laoreet sit. Neque laoreet suspendisse interdum consectetur libero id. Magnis dis parturient montes nascetur ridiculus mus. Magnis dis parturient montes nascetur ridiculus mus mauris vitae. Potenti nullam ac tortor vitae purus faucibus ornare suspendisse. Interdum velit laoreet id donec ultrices tincidunt. Fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus."
                    "Lectus magna fringilla urna porttitor rhoncus dolor. Tempus urna et pharetra pharetra massa massa. Aliquet eget sit amet tellus cras adipiscing. Consectetur a erat nam at lectus urna duis convallis. Nunc sed augue lacus viverra vitae congue eu. Id aliquet lectus proin nibh nisl condimentum id venenatis. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Vestibulum lectus mauris ultrices eros in cursus turpis massa. Auctor elit sed vulputate mi. Ut placerat orci nulla pellentesque dignissim. Volutpat commodo sed egestas egestas fringilla phasellus."
                    "Integer enim neque volutpat ac tincidunt vitae semper. Mollis aliquam ut porttitor leo a diam sollicitudin. Enim facilisis gravida neque convallis a cras semper auctor. In arcu cursus euismod quis viverra nibh cras pulvinar. Erat velit scelerisque in dictum non consectetur a. Risus nullam eget felis eget nunc lobortis mattis. Suspendisse interdum consectetur libero id faucibus. Elementum eu facilisis sed odio morbi quis commodo. Rutrum quisque non tellus orci ac auctor augue mauris. Scelerisque eleifend donec pretium vulputate sapien nec. Nisl tincidunt eget nullam non nisi. Cursus euismod quis viverra nibh cras pulvinar mattis nunc sed. Arcu risus quis varius quam quisque. Arcu dictum varius duis at consectetur. Sit amet tellus cras adipiscing enim. Augue interdum velit euismod in pellentesque. Lorem donec massa sapien faucibus et molestie ac. Suspendisse faucibus interdum posuere lorem ipsum dolor sit.",
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
        )
    ));
  }
}