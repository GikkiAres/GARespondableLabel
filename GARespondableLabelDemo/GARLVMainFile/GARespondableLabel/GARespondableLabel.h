//
//  GARespondableLabel.h
//  GAHealthKitMaster
//
//  Created by GikkiAres on 4/27/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

//具有IBInspectable的属性值更改的时候都会重新调用xib显示的函数.

#import <UIKit/UIKit.h>
@class GARespondableLabel;
@protocol GARespondableLabelDelegate <NSObject>

- (void)gaRespondableLabelClicked:(GARespondableLabel *)label;

@end

IB_DESIGNABLE
@interface GARespondableLabel : UILabel

@property (nonatomic, strong) UIView *inputView;
@property (nonatomic,strong) IBInspectable NSString *placeholder;
@property (nonatomic, weak) id<GARespondableLabelDelegate> delegate;

@end
