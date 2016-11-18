//
//  GARespondableLabel.m
//  GAHealthKitMaster
//
//  Created by GikkiAres on 4/27/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

#import "GARespondableLabel.h"

@interface GARespondableLabel ()


@end

@implementation GARespondableLabel

@synthesize placeholder = _placeholder;

#pragma mark - 1 SystemCycle

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
            [self commonInit];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    [self commonInit];
  }
  return self;
}

- (instancetype)init {
  self = [super init];
  if (self) {
      [self commonInit];
  }
  return self;
}

- (void)commonInit {
    self.userInteractionEnabled = YES;
}

- (void)drawRect:(CGRect)rect {
  if (self.text.length) {
    [super drawRect:rect];
  }else{
    //采用画的方式得到placeholder文字,这样有利于判断究竟有没有输入文字;
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = self.font;
    attr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
#define kOriginX 0
      CGRect placeholderBounds = [self.placeholder boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil];
      CGRect placeholderFrame = CGRectMake(kOriginX, (rect.size.height-placeholderBounds.size.height)/2, placeholderBounds.size.width, placeholderBounds.size.height);
    [self.placeholder drawInRect:placeholderFrame withAttributes:attr];
  }
}




- (void)prepareForInterfaceBuilder {
  [self setNeedsDisplay];
}


#pragma mark -2 BasicFunc
- (void)setText:(NSString *)text {
  [self setNeedsDisplay];
  [super setText:text];
}


//- (void)setPlaceholder:(NSString *)placeholder {
//  _placeholder = placeholder;
//    NSLog(@"1");
//}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self becomeFirstResponder];
}


- (BOOL) becomeFirstResponder {
    BOOL result =  [super becomeFirstResponder];
    if ([_delegate respondsToSelector:@selector(gaRespondableLabelClicked:)]) {
        [_delegate gaRespondableLabelClicked:self];
    }
    return result;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
