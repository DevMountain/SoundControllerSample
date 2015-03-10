//
//  SoundEffectPlayer.h
//  Whimmy
//
//  Created by Ben Norris on 2/13/15.
//  Copyright (c) 2015 BSN Design. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const soundForMiscSound = @"Misc";

@interface SoundEffectPlayer : NSObject

+ (void)playSoundWithName:(NSString *)soundName;
+ (void)playAlertWithName:(NSString *)alertName;
+ (void)playSoundWithFile:(NSString *)fileName type:(NSString *)fileType alert:(BOOL)alert;

@end
