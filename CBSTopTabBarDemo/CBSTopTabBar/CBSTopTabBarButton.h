//
//  CBSTopTabBarButton.h
//  CBSTopTabBarDemo
//
//  Created by Claude Sutterlin on 7/29/14.
//  Copyright (c) 2014 Coffee Bean Studios LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBSTopTabBarController.h"

typedef NS_ENUM(NSInteger, CBSTopTabBarButtonStyle) {
    CBSTopTabBarButtonStylePlain = 0,
    CBSTopTabBarButtonStyleDivider
};

@interface CBSTopTabBarButton : UIButton

@property (nonatomic, strong) UIColor *foreColor;
@property (nonatomic, assign) float dividerWidth;
@property (nonatomic, assign) CBSTopTabBarButtonStyle buttonStyle;
@property (nonatomic, weak) CBSTopTabBarController *tabBar;

- (id) initWithFrame: (CGRect) frame inTabBar: (CBSTopTabBarController *) tabBar withStyle: (CBSTopTabBarButtonStyle) buttonStyle;
- (void) setViewController: (UIViewController *) viewController atIndex: (NSInteger) index;

@end
