//
//  CPTMainTabsViewController.m
//  Capptivate
//
//  Created by Claude Sutterlin on 6/12/14.
//  Copyright (c) 2014 CoffeeBeanStudios. All rights reserved.
//

#import "CBSTopTabBarController.h"

@interface CBSTopTabBarController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIButton *latestButton;
@property (weak, nonatomic) IBOutlet UIButton *patternsButton;
@property (weak, nonatomic) IBOutlet UIButton *componentsButton;

@property (strong, nonatomic) IBOutlet NSMutableArray *menuButtons;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *indicatorView;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (nonatomic) NSInteger selectedTab;

@end

@implementation CBSTopTabBarController

- (id) init{
    self = [super init];
    if (self) {
        // Custom initialization
        [self setupUI];
    }
    return self;
}

- (id) initWithViewControllers: (NSArray *) viewControllers{
    self = [super init];
    if (self) {
        [self setupUI];
        
        self.viewControllers = viewControllers;
    }
    return self;
}

- (void) setupUI{
    [self.view setClipsToBounds: YES];
    
    _menuBar = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width,  40)];
    [self.view addSubview: _menuBar];
    
    _indicatorView = [[UIView alloc] initWithFrame: CGRectMake(0, _menuBar.bounds.size.height-5, _menuBar.bounds.size.width/3, 5)];
    [_menuBar addSubview: _indicatorView];
    
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle: UIPageViewControllerTransitionStyleScroll
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:nil];
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    _pageViewController.view.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40);
    _pageViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self addChildViewController: _pageViewController];
    [self.view addSubview: _pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _menuBar.backgroundColor = [UIColor colorWithRed:0.19 green:0.19 blue:0.19 alpha:1];
    _indicatorView.backgroundColor = [UIColor colorWithRed:0.25 green:0.84 blue:0.74 alpha:1];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) tabButtonsTouched:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [self setSelectedTab:btn.tag];
}

- (void) setViewControllers:(NSArray *)viewControllers{
    _viewControllers = viewControllers;

    UIButton *menuButton;
    _menuButtons = [[NSMutableArray alloc] init];
    int index = 0;
    float buttonWidth = self.view.bounds.size.width / 3;
    for (UIViewController *vc in _viewControllers){
        CGRect frame = CGRectMake(index * buttonWidth, 0, buttonWidth, _menuBar.bounds.size.height - _indicatorView.bounds.size.height);
        menuButton = [[UIButton alloc] initWithFrame: frame];
        [menuButton setTitle: vc.title forState: UIControlStateNormal];
        [menuButton addTarget: self action:@selector(tabButtonsTouched:) forControlEvents: UIControlEventTouchUpInside];
        menuButton.tag = index;
        [_menuBar addSubview: menuButton];
        index++;
        
        [_menuButtons addObject: menuButton];
    }

    [self setSelectedTab: 0];
}

- (void) setSelectedTab:(NSInteger)selectedTab{
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    
    if (_selectedTab > selectedTab){
        direction = UIPageViewControllerNavigationDirectionReverse;
    }


    _selectedTab = selectedTab;
    
    UIViewController *vc = [self.viewControllers objectAtIndex: selectedTab];
    
    [_pageViewController setViewControllers:@[vc]
                                  direction:direction
                                   animated: YES
                                 completion:^(BOOL completed) {
                                
                                 }];
    
    [self animateMenuBar: _selectedTab];
}

- (void) animateMenuBar: (NSInteger) selectedTab{
    int fontSize = 14;
    
    switch (selectedTab) {
        case 0:
            _latestButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Regular" size:fontSize];
            [_latestButton setTitleColor: [UIColor colorWithRed:0.25 green:0.84 blue:0.74 alpha:1] forState:UIControlStateNormal];
            _patternsButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Thin" size:fontSize];
            [_patternsButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
            _componentsButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Thin" size:fontSize];
            [_componentsButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
            break;
            
        case 1:
            _patternsButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Regular" size:fontSize];
            [_patternsButton setTitleColor: [UIColor colorWithRed:0.25 green:0.84 blue:0.74 alpha:1] forState:UIControlStateNormal];
            _latestButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Thin" size:fontSize];
            [_latestButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
            _componentsButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Thin" size:fontSize];
            [_componentsButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
            break;
            
        case 2:
            _componentsButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Regular" size:fontSize];
            [_componentsButton setTitleColor: [UIColor colorWithRed:0.25 green:0.84 blue:0.74 alpha:1] forState:UIControlStateNormal];
            _patternsButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Thin" size:fontSize];
            [_patternsButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
            _latestButton.titleLabel.font = [UIFont fontWithName:@"Raleway-Thin" size:fontSize];
            [_latestButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    CGRect menuFrame = self.menuBar.bounds;
    int xOffset = self.menuBar.frame.size.width / 3;
    CGRect indicatorFrame = CGRectMake(xOffset*selectedTab, menuFrame.size.height-5, xOffset, 5);
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.frame = indicatorFrame;
    }];
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllers indexOfObject: viewController];
    index++;
    if (index < _viewControllers.count){
        return [_viewControllers objectAtIndex: index];
    }
    else{
        return nil;
    }
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllers indexOfObject: viewController];
    index--;
    
    if (index< _viewControllers.count){
        return [_viewControllers objectAtIndex: index];
    }
    else{
        return nil;
    }
}

#pragma mark - UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    UIViewController *viewController = _pageViewController.viewControllers[0];
    
    // Select tab
    NSUInteger index = [_viewControllers indexOfObject:viewController];
    [self animateMenuBar: index];
}


@end
