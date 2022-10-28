import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';

class player_controller extends GetxController {
  AudioPlayer player = AudioPlayer();
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  bool isplaying = false;
  var data = Get.arguments;
  String? appbartitle;
  String? soundsimage;
  String? soundsname;
  String? soundspath;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    appbartitle = data[0];
    soundsimage = data[1];
    soundsname = data[2];
    soundspath = data[3];
    player.setAsset(soundspath!);
    player.positionStream.listen((event) {
      update();
    });
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.pause();
    player.dispose();
    super.dispose();
  }

  playpauseonTap() {
    if (!isplaying) {
      player.play();
      isplaying = true;
      update();
    } else {
      player.pause();
      isplaying = false;
      update();
    }
  }

  Future<void> audiotoggele() async {
    if (isplaying) {
      await player.pause();
    } else {
      // await player.play();
    }
  }
}
