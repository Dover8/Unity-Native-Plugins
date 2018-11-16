//
//  NativeVolume.h
//
//
//  Created by Ben MacKinnon on 02/07/2018.
//

#ifndef NativeVolume_h
#define NativeVolume_h
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

struct Observation {
    NSString * _Nullable VolumeKey = @"outputVolume";
    int * _Nullable Context = 0;
};

@interface VolumeController : NSObject
{
    AVAudioSession *audioSession;
    Observation observation;
}

-(void)setNativeVolume:(float)val;
-(float)getNativeVolume;

@end
#endif /* NativeVolume_h */
