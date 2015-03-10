//
//  SoundController.h
//  SoundController
//
//  Created by Caleb Hicks on 11/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundController : NSObject

- (void)recordAudioToTemporaryDirectoryWithLength:(CGFloat)length;
- (void)recordAudioToURL:(NSURL *)url withLength:(CGFloat)length;

- (void)playAudioFileAtURL:(NSURL *)url;
- (void)playLastRecordedFile;

@end
