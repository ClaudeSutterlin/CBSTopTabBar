//
//  CPTMainTabsViewController.h
//  Capptivate
//
//  Created by Claude Sutterlin on 6/12/14.
//  Copyright (c) 2014 CoffeeBeanStudios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CBSTopTabBarStyle) {
    CBSTopTabBarStyleImage = 0,
    CBSTopTabBarStyleTitle,
    CBSTopTabBarStyleImageAndTitle
};

@interface CBSTopTabBarController : UIViewController

- (id) initWithViewControllers: (NSArray *) viewControllers;

@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) IBOutlet UIScrollView *menuBar;
@property (nonatomic, assign) CBSTopTabBarStyle tabBarStyle;

@end
