//
//  MMAbstractViewController.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "MMAbstractViewController.h"

@implementation MMAbstractViewController


#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - transition

- (void)performTransitionToNextViewController:(UIViewController *)nextViewController animated:(BOOL)animated {
  [self.navigationController pushViewController:nextViewController animated:animated];
}

- (void)performTransitionToPreviousViewControllerWithAnimated:(BOOL)animated {
  [self.navigationController popViewControllerAnimated:animated];
}

- (void)performTransitionToPreviousViewController:previousViewController
                                         animated:(BOOL)animated {
  [self.navigationController popToViewController:previousViewController
                                        animated:animated];
}

- (void)performTransitionToRootViewControllerWithAnimated:(BOOL)animated {
  [self.navigationController popToRootViewControllerAnimated:animated];
}


#pragma mark - handle error

- (void)handleError:(NSError *)error withTag:(NSInteger)tag {
  [UIAlertView showAlertWithError:error
                         delegate:self
                              tag:tag];
}

- (void)handleError:(NSError *)error {
  [self handleError:error withTag:MMAlertViewTagError];
}

#pragma mark - indicator

- (void)showIndicator {
  [self showIndicator:nil];
}

- (void)showIndicator:(NSString *)text {
  MMIndicatorView *indicatorView = [self.view.window viewWithTagFromSubviews:MMUIViewTagIndicator];
  
  if (indicatorView == nil) {
    indicatorView = [[[MMIndicatorView alloc] 
                      initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
    [indicatorView setTag:MMUIViewTagIndicator];
    [self.view.window addSubview:indicatorView];
  }
  
  [indicatorView startIndicatorAnimation:text];
}

- (void)hideIndicator {
  MMIndicatorView *indicatorView = [self.view.window viewWithTagFromSubviews:MMUIViewTagIndicator];
  [indicatorView stopIndicatorAnimation];
}

#pragma mark -

- (void)dealloc {
  [self setMmContext:nil];
  [super dealloc];
}

@synthesize mmContext=mmContext_;

@end
