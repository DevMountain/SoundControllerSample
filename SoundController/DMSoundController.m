//
//  SoundController.m
//  SoundController
//
//  Created by Caleb Hicks on 11/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DMSoundController.h"

@interface DMSoundController()

@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) AVAudioRecorder *recorder;

@property (strong, nonatomic) NSURL *lastRecordedFile;

@end

@implementation DMSoundController

- (void)recordAudioToTemporaryDirectoryWithLength:(CGFloat)length {
    
    // set up the temporary directory to save the audio file
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
    [self.recorder recordForDuration:length];
    
    self.lastRecordedFile = localURL;
}

- (void)recordAudioToURL:(NSURL *)url withLength:(CGFloat)length {
    
    // set up specific url so we can play it back later
    NSURL *localURL = url;
    self.lastRecordedFile = localURL;
    
    // some settings
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 11025],                    AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless],  AVFormatIDKey,
                              [NSNumber numberWithInt: 2],                          AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMin],          AVEncoderAudioQualityKey,
                              nil];
    
    // create an AVAudioRecorder
    NSError *error;
    self.recorder = [[AVAudioRecorder alloc] initWithURL:localURL settings:settings error:&error];
    
    // record for 5 seconds
    [self.recorder recordForDuration:length];
    
}

- (void)playAudioFileAtURL:(NSURL *)url {
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    self.player.numberOfLoops = 1;
    [self.player play];
}

- (void)playLastRecordedFile {
    [self playAudioFileAtURL:self.lastRecordedFile];
}

@end
