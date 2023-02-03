import 'dart:ffi';

import 'package:ffigen_demo/swift_api_bindings.dart';

Future<void> main() async {
  /// Addition
  // SwiftLibrary swiftLibrary =
  //     SwiftLibrary(DynamicLibrary.open('lib/libsaddition.dylib'));
  // await Future.delayed(Duration.zero);
  // final obj = Addition.new1(swiftLibrary);
  // final result = obj.addWithA_b_(5, 10);
  // print(result);
  //

  /// audio player example

  SwiftLibrary swiftLibrary = SwiftLibrary(DynamicLibrary.open(
      '/Users/ujas/StudioProjects/ffigen_demo/ios/Runner/libsaudioplayer.dylib'));
  await Future.delayed(Duration.zero);
  final player = AudioPlayer.new1(swiftLibrary);
  player.playWithPath_(NSString(
      swiftLibrary, '/Users/ujas/StudioProjects/ffigen_demo/assets/audio.mp3'));
  print('player started');
  await Future.delayed(
    const Duration(seconds: 5),
    () => player.stop(),
  );
  print('player stopped');
}
