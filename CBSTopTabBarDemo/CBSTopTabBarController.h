//
//  CPTMainTabsViewController.h
//  Capptivate
//
//  Created by Claude Sutterlin on 6/12/14.
//  Copyright (c) 2014 CoffeeBeanStudios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBSTopTabBarController : UIViewController

- (id) initWithViewControllers: (NSArray *) viewControllers;

@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) IBOutlet UIView *menuBar;

@end
