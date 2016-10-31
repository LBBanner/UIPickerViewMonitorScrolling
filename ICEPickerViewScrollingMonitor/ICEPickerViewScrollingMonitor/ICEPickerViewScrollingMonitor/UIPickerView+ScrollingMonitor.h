//
//  UIPickerView+ScrollingMonitor.h
//  ICEPickerViewScrollingMonitor
//
//  Created by 凌斌 on 16/10/31.
//  Copyright © 2016年 ling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ScrollingMonitor)
- (BOOL)anySubViewScrolling;
@end

@interface UIPickerView (ScrollingMonitor)
- (void)isScrolling:(void(^)(BOOL scrolling))handler;
@end
