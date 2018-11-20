//
//  NativeVolume.mm
//
//
//  Created by Ben MacKinnon on 02/07/2018.
//

#import "NativeVolume.h"

@implementation VolumeController

- (instancetype)init
{
    self = [super init];
    audioSession = [AVAudioSession sharedInstance];
    
    [audioSession setActive:true error:nil];
    [self startObservingAudioChanges];
    UnitySendMessage("Video Player", "SystemVolumeUpdateNotification", "Started Audio Session");
    
    return self;
}


-(void) startObservingAudioChanges
{
    [audioSession addObserver:self forKeyPath:observation.VolumeKey options:NSKeyValueObservingOptionNew context:observation.Context];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == observation.Context)
    {
        if (keyPath == observation.VolumeKey)
        {
            NSString * volumeString = [NSString stringWithFormat:@"%f", [audioSession outputVolume]];
            UnitySendMessage("Video Player", "SystemVolumeUpdateNotification", [volumeString cStringUsingEncoding:NSUTF8StringEncoding]);
        }
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void) setNativeVolume:(float)val
{
    MPVolumeView *volumeView = [[MPVolumeView alloc] init];
    UISlider *volumeSlider = nil;
    
    //find the slider
    for(UIView *view in volumeView.subviews)
    {
        if ([view isKindOfClass:[UISlider class]])
        {
            volumeSlider = (UISlider *)view;
            break;
        }
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        volumeSlider.value = val;
    });
}

- (float)getNativeVolume
{
    return [audioSession outputVolume];
}

@end

static VolumeController* delegate = nil;


// When native code plugin is implemented in .mm / .cpp file, then functions
// should be surrounded with extern "C" block to conform C function naming rules
extern "C" {
    
    void _SetVolume(float value)
    {
        if (delegate == nil)
        {
            delegate = [[VolumeController alloc] init];
        }
        [delegate setNativeVolume:value];
    }
    
    float _GetVolume()
    {
        if (delegate == nil)
        {
            delegate = [[VolumeController alloc] init];
        }
        return [delegate getNativeVolume];
    }
    
}
