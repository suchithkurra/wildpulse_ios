import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WildPulse/utils/color_util.dart';
import 'package:WildPulse/utils/theme_util.dart';
import 'package:WildPulse/widgets/anim.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class YouTubeVideo extends StatefulWidget {
  const YouTubeVideo({super.key,this.isMute=false,this.videoUrl,this.hidecontrols=false,this.isFull=false,this.height,this.isPlay=false,this.isShare=false});
  final String? videoUrl;
  final double? height;
  final bool isMute;
  final bool isPlay,isShare,isFull,hidecontrols;

  @override
  State<YouTubeVideo> createState() => _YouTubeVideoState();
}

class _YouTubeVideoState extends State<YouTubeVideo> {
  late YoutubePlayerController controller;
  
  bool playControl=false;
  bool isPlayerReady = false;
  
  var isFullscreen;
  
  bool _muted=false;

  @override
  void initState() { 
  super.initState();
   _muted = widget.isMute;
  final videoId = YoutubePlayer.convertUrlToId(
      widget.videoUrl.toString(),
    );
   controller = YoutubePlayerController(
    initialVideoId: videoId.toString(),
    flags:  YoutubePlayerFlags(
        mute: widget.isMute,
        autoPlay: widget.isPlay ? true :false,
        disableDragSeek: true,
        loop: true,
        isLive: false,
        hideControls: widget.hidecontrols,
        forceHD: false,
        enableCaption: true,
    )
   );
  //  controller.addListener(players);
  }

  // void players() {
  //   if (controller.value.isReady) {
  //     controller.play();
  //   }
  // }
 @override
  void deactivate() {
   controller.pause();
    super.deactivate();
  }


  @override
  void dispose() {
  //  controller.removeListener(players);
   controller.pause();
   controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('---------------------object--------------');
    return Stack(
      children: [
        YoutubePlayerBuilder(
              builder: (BuildContext context , Widget child) { 
          return VisibilityDetector(
                  key:ObjectKey( widget.videoUrl.toString()),
                  onVisibilityChanged: (visibility) {
                    var visiblePercentage = visibility.visibleFraction * 100;
                  ///  print(visiblePercentage);
                   if (visiblePercentage < 1 && controller.value.isReady) {
                    if(widget.isMute==false){  
                      controller.mute();
                      }
                     widget.isPlay==true ? controller.play() : controller.pause();
                      //pausing  functionality
                    }else if (mounted &&  controller.value.isReady) {
                    
                       controller.play();
                      if(widget.isMute==false){  
                      controller.unMute();
                      }
                      if (widget.isShare == true) {
                      if(widget.isMute==false){  
                      controller.mute();
                      }
                       controller.pause();
                    } 
                   }
                  },
                  child:  Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(widget.isFull?0 :20),
                      child: Stack(
                      children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(widget.isFull ? 0 :20),
                         child: SizedBox(
                              width: size(context).width,
                              height: widget.height ?? height10(context)*25,
                              child:PageStorage(
                                //  key: PageStorageKey('${widget.videoUrl}${widget.hashCode.toString()}'),
                                  bucket: PageStorageBucket(),
                                 child: RepaintBoundary(
                                   child:child)
                                ),
                              ),
                       ),
                        //    playControl == false  ?  SizedBox() :  Positioned(
                        //   left: size(context).width/3,
                        //   top: (widget.height ?? 250) /2.75,
                        //   child: PlayPause(controller: controller)),
                        //  Positioned(
                        // bottom: 12,
                        // left: 12,  
                        // child: 
                        // SvgPicture.asset('assets/svg/fullscreen.svg'))
                      ],
                     ),
                    )
                );
           },   onEnterFullScreen: () {
            isFullscreen = true;
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);
            Future.delayed(const Duration(milliseconds: 300), () {
              controller.play();
          });
          
            setState(() { });
          },
          onExitFullScreen: () {
            isFullscreen = false;
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            Future.delayed(const Duration(milliseconds: 300), () {
            controller.play();
          });
            setState(() { });
          },
           player:  YoutubePlayer(
              // thumbnail: CachedNetworkImage(imageUrl: controller.value.,fit:BoxFit.cover),
            progressIndicatorColor: Theme.of(context).primaryColor,
            bufferIndicator:const CircularProgressIndicator(),
            controller: controller,
          
          
            ),
        ),
         Positioned(
          right:16,
          top:16,
           child: IconButton(
                 icon: Icon(_muted ? Icons.volume_off : Icons.volume_up,size:30),
                 onPressed: controller.value.isReady
              ? () {
                  _muted
                      ? controller.unMute()
                      : controller.mute();
                  setState(() {
                    _muted = !_muted;
                  });
                }
              : null,
               ),
         ),
      ],
    );
  }
}

class PlayPause extends StatelessWidget {
  const PlayPause({
    super.key,
    required this.controller,
  });

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white.withOpacity(0.5),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 12,
                    spreadRadius: -2,
                    color: Colors.black26
                  )
                ]
              ),
              child: AnimateIcon(
                child: controller.value.isPlaying ?
                 const Icon(Icons.play_arrow_rounded,
                size: 50,
                color: Colors.white,
                ): const Icon(Icons.pause_rounded,
                size: 50,
                color: Colors.white,
                ),
              ),
            )),
        ),
      ),
    );
  }
}