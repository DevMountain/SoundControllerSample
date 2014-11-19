//
//  SoundController.m
//  SoundController
//
//  Created by Caleb Hicks on 11/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "SoundController.h"
#import <AVFoundation/AVFoundation.h>

@interface SoundController()

@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) AVAudioRecorder *recorder;

@property (strong, nonatomic) NSURL *lastRecordedFile;

@end

@implementation SoundController

- (void)recordAudioToTemporaryDirectory{
    NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.m4a"];
    NSURL *localURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    
    // some settings (low quality)
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 11025],                    AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless],  AVFormatIDKey,
                              [NSNumber numberWithInt: 2],                          AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMedium],          AVEncoderAudioQualityKey,
                              nil];
    
    // create a AVAudioRecorder
    NSError *error;
    self.recorder = [[AVAudioRecorder alloc] initWithURL:localURL settings:settings error:&error];
    
    // record for 5 seconds
    [self.recorder recordForDuration:5];
    
    self.lastRecordedFile = localURL;
}

- (void)recordAudioToURL:(NSURL *)url {
    
    NSURL *localURL = url;
    self.lastRecordedFile = localURL;
    
    
    // some settings
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 11025],                    AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless],  AVFormatIDKey,
                              [NSNumber numberWithInt: 2],                          AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMin],          AVEncoderAudioQualityKey,
                              nil];
    
    // create a AVAudioRecorder
    NSError *error;
    self.recorder = [[AVAudioRecorder alloc] initWithURL:localURL settings:settings error:&error];
    
    // record for 5 seconds
    [self.recorder recordForDuration:5];
    
}

- (void)playAudioFileAtURL:(NSURL *)url {
    
    NSURL *localURL = url;
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:localURL error:nil];
    
    self.player.numberOfLoops = 1;
    
    [self.player play];
}

- (void)playLastRecordedFile {
    [self playAudioFileAtURL:self.lastRecordedFile];
}

@end
