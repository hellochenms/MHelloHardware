//
//  ViewController.m
//  MHelloHardware
//
//  Created by Chen,Meisong on 2017/9/25.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "ViewController.h"
#import "LogDurationHelper.h"
#import "XOR.h"
#import "Oscillator.h"
#import "RS.h"

@interface ViewController ()
@property (nonatomic) Oscillator *oscillator;
@property (nonatomic) RS *rs;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - XOR
- (IBAction)onTapXOR:(id)sender {
    [[LogDurationHelper sharedInstance] beginTimeLog];
    XOR *xor = [XOR new];
    [xor inputA:YES inputB:YES outputCallback:^(BOOL output) {
        NSLog(@"【MH】output:%d  %s", output, __func__);
        [[LogDurationHelper sharedInstance] endTimeLog];
    }];
}

#pragma mark - Osci
- (IBAction)onTapOsciStart:(id)sender {
    [self.oscillator shutdown];
    self.oscillator = [Oscillator new];
    [self.oscillator start];
}

- (IBAction)onTapOsciShutdown:(id)sender {
    [self.oscillator shutdown];
}

#pragma mark - RS
- (IBAction)onTapRSStart:(id)sender {
    [self.rs shutdown];
    self.rs = [RS new];
    [self.rs start];
}

- (IBAction)onTapR:(id)sender {
    [self.rs r];
}

- (IBAction)onTapS1:(id)sender {
    [self.rs s:YES];
}

- (IBAction)onTapS0:(id)sender {
    [self.rs s:NO];
}

- (IBAction)onTapRSShutdown:(id)sender {
    [self.rs shutdown];
}


@end
