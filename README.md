CBSTopTabBar
===========

Objective-C control that allows for a top navigation bar like seen in some Android apps.

![ScreenShot](http://i.imgur.com/oUBHFvh.gif)

##Usage

Create your views that you'll be displaying, and pass them into the constructor of the CBSTopTabBar as below.

`CBSTopTabBarController *topBarController = [[CBSTopTabBarController alloc] initWithViewControllers: @[vc1, vc2, vc3]];`

After that, display the top tab bar:

`self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController: topBarController];`

##Demo
Check out the CBSTopTabBarDemo

##To-do

- Allow for scrolling of tab items, for more than 3 sub views.
- Clean up and comment code