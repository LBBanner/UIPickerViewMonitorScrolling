//
//  UIPickerView+ScrollingMonitor.m
//  ICEPickerViewScrollingMonitor
//
//  Created by 凌斌 on 16/10/31.
//  Copyright © 2016年 ling. All rights reserved.
//

#import "UIPickerView+ScrollingMonitor.h"

@implementation UIView (ScrollingMonitor)

- (BOOL)anySubViewScrolling {
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        if (scrollView.dragging || scrollView.decelerating) {
            return YES;
        }
    }
    for (UIView *subView in self.subviews) {
        if ([subView anySubViewScrolling]) {
            return YES;
        }
    }
    return NO;
}

@end

@implementation UIPickerView (ScrollingMonitor)

- (void)isScrolling:(void(^)(BOOL scrolling))handler {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkIfScrolling:) userInfo:handler repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)checkIfScrolling:(NSTimer *)timer {
    void(^block)(BOOL scrolling) = (void(^)(BOOL scrolling))timer.userInfo;
    BOOL result = [self anySubViewScrolling];
    if (!result) {
        [timer invalidate];
        timer = nil;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        block(result);
    });
}

@end
