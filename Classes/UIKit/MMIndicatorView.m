//
//  MMIndicatorView.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "MMIndicatorView.h"

@implementation MMIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
      // set parameter
      [self setUserInteractionEnabled:YES];
      [self setBackgroundColor:[UIColor colorWithRed:0.0f
                                               green:0.0f 
                                                blue:0.0f 
                                               alpha:0.8f]];
      
      // IndicatorView
      {
        UIActivityIndicatorView *av = [[[UIActivityIndicatorView alloc] 
                                       initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite]
                                       autorelease];
        [av setCenter:CGPointMake(frame.size.width / 2, frame.size.height / 2)];
        //CGRect fr = [av frame];
        //fr.size = CGSizeMake(40, 40);
        //[av setFrame:fr];
        [av setHidden:NO];
        [av setAlpha:1.0f];
        [self addSubview:av];
        [self setIndicatorView:av];
      }
      
      // Label
      {
        UILabel *lb = [[[UILabel alloc] initWithFrame:
                       CGRectMake(0, frame.size.height/2+45, 
                                  frame.size.width, 40)] autorelease];
        [lb setBackgroundColor:[UIColor clearColor]];
        [lb setTextColor:[UIColor whiteColor]];
        [lb setAdjustsFontSizeToFitWidth:YES];
        [lb setTextAlignment:UITextAlignmentCenter];
        [self setTextLabel:lb];
        
        [self addSubview:lb];
      }
      
      //[self.indicatorView setAlpha:0.0f];
    }
    return self;
}


- (void)startIndicatorAnimation:(NSString *)titleText {
  [self setAlpha:1.0f];
  [[self textLabel] setText:titleText];
  [[self indicatorView] startAnimating];
}

- (void)startIndicatorAnimation {
  [self startIndicatorAnimation:nil];
}

- (void)stopIndicatorAnimation {
  [self setAlpha:0.0f];
  [[self textLabel] setText:nil];
  [[self indicatorView] stopAnimating];
}

- (void)dealloc {
  [self.indicatorView stopAnimating];
  [self.indicatorView removeFromSuperview];
  [self setIndicatorView:nil];
  
  [self.textLabel removeFromSuperview];
  [self setTextLabel:nil];
  
  [super dealloc];
}

@synthesize indicatorView=indicatorView_;
@synthesize textLabel=textLabel_;

@end

