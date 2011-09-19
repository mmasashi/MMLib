//
//  UITestsViewController.m
//  UITests
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "UITestsViewController.h"

@implementation UITestsViewController

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self performSelector:@selector(showIndicator:) withObject:@"テスト中" afterDelay:0.01f];
  [self performSelector:@selector(hideIndicator) withObject:nil afterDelay:3.0f];
}

@end
