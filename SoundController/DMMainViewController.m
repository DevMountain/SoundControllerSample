//
//  ViewController.m
//  SoundController
//
//  Created by Caleb Hicks on 11/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DMMainViewController.h"
#import "DMSoundController.h"
#import "DMSoundEffectPlayer.h"

@interface DMMainViewController ()

@property (nonatomic, strong) DMSoundController *soundController;

@end

@implementation DMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.soundController = [DMSoundController new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordAudioButton:(id)sender {
    [self.soundController recordAudioToTemporaryDirectoryWithLength:5.0];
}

- (IBAction)playAudioButton:(id)sender {
    [self.soundController playLastRecordedFile];
}

- (IBAction)playEverythingIsAwesome:(id)sender {
    
    NSURL *urlForAwesome = [[NSBundle mainBundle] URLForResource:@"song" withExtension:@"mp3"];
    
    [self.soundController playAudioFileAtURL:urlForAwesome];
}

- (IBAction)playSound:(id)sender {
    [DMSoundEffectPlayer playSoundWithName:soundForMiscSound];
}

- (IBAction)playAlert:(id)sender {
    [DMSoundEffectPlayer playAlertWithName:soundForMiscSound];
}

@end
