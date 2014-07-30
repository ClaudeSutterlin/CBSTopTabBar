//
//  CBSTopTabBarButton.m
//  CBSTopTabBarDemo
//
//  Created by Claude Sutterlin on 7/29/14.
//  Copyright (c) 2014 Coffee Bean Studios LLC. All rights reserved.
//

#import "CBSTopTabBarButton.h"

@implementation CBSTopTabBarButton

- (id) initWithFrame: (CGRect) frame inTabBar: (CBSTopTabBarController *) tabBar withStyle: (CBSTopTabBarButtonStyle) buttonStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _foreColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.20];
        _dividerWidth = 1.5f;
        _buttonStyle = buttonStyle;
        _tabBar = tabBar;
    }
    return self;
}

- (void) setViewController: (UIViewController *) viewController atIndex: (NSInteger) index{
    self.tag = index;
    
    if (viewController.tabBarItem){
        if ((_tabBar.tabBarStyle==CBSTopTabBarStyleImageAndTitle)||
            (_tabBar.tabBarStyle==CBSTopTabBarStyleTitle)){
            [self setTitle: viewController.tabBarItem.title forState: UIControlStateNormal];
        }
        
        if ((viewController.tabBarItem.image)&&((_tabBar.tabBarStyle==CBSTopTabBarStyleImage)||
                                    (_tabBar.tabBarStyle==CBSTopTabBarStyleImageAndTitle))){
            [self setImage: viewController.tabBarItem.image forState:UIControlStateNormal];
        }
    }
    else{
        [self setTitle: viewController.title forState: UIControlStateNormal];
    }

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (_buttonStyle == CBSTopTabBarButtonStyleDivider){
        //Get the current drawing context
        CGContextRef context = UIGraphicsGetCurrentContext();
        //Set the line color and width
        CGContextSetStrokeColorWithColor(context, _foreColor.CGColor);
        CGContextSetLineWidth(context, _dividerWidth);
        //Start a new Path
        CGContextBeginPath(context);
        
        // offset lines up - we are adding offset to font.leading so that line is drawn right below the characters and still characters are visible.
        CGContextMoveToPoint(context, self.bounds.size.width - _dividerWidth, 10.0f);
        CGContextAddLineToPoint(context, self.bounds.size.width - _dividerWidth, self.bounds.size.height - 10.0f);
        
        //Close our Path and Stroke (draw) it
        CGContextClosePath(context);
        CGContextStrokePath(context);
    }
}


@end
