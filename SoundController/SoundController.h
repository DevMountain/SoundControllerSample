//
//  SoundController.h
//  SoundController
//
//  Created by Caleb Hicks on 11/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundController : NSObject

- (void)recordAudioToTemporaryDirectory;
- (void)recordAudioToURL:(NSURL *)url;

- (void)playAudioFileAtURL:(NSURL *)url;
- (void)playLastRecordedFile;

@end
