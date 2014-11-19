//
//  ViewController.m
//  SoundController
//
//  Created by Caleb Hicks on 11/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "SoundController.h"

@interface ViewController ()

@property (nonatomic, strong) SoundController *soundController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.soundController = [SoundController new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordAudioButton:(id)sender {
    [self.soundController recordAudioToTemporaryDirectory];
}

- (IBAction)playAudioButton:(id)sender {
    [self.soundController playLastRecordedFile];
}

@end
