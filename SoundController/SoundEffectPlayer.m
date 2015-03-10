//
//  SoundEffectPlayer.m
//  Whimmy
//
//  Created by Ben Norris on 2/13/15.
//  Copyright (c) 2015 BSN Design. All rights reserved.
//

#import "SoundEffectPlayer.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation SoundEffectPlayer

+ (void)playSoundWithName:(NSString *)soundName {
    [self playSoundWithFile:soundName type:nil alert:NO];
}

+ (void)playAlertWithName:(NSString *)alertName {
    [self playSoundWithFile:alertName type:nil alert:YES];
}

+ (void)playSoundWithFile:(NSString *)fileName type:(NSString *)fileType alert:(BOOL)alert {
    if (!fileType) {
        fileType = @"caf";
    }
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:soundFile], &soundID);
    
    if (alert) {
        AudioServicesPlayAlertSound(soundID);
    } else {
        AudioServicesPlaySystemSound(soundID);
    }
}

@end
