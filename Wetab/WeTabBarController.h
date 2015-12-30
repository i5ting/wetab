#import <UIKit/UIKit.h>
#import "WeTab.h"

@class WeTabBar;

@interface WeTabBarController : UIViewController

DEFINE_SINGLETON_FOR_HEADER(WeTabBarController)

/**< 视图控制器集合 */
@property (nonatomic, copy)   NSArray * viewControllers;

/**< 设置选中的item */
@property (nonatomic, assign) NSInteger selectedIndex;

/**< 选中的视图控制器 */
@property(nonatomic, strong)  UIViewController * selectedViewController;

/**< tabBar */
@property(nonatomic, strong) WeTabBar * tabBar;

/**< 设置选中的item */
@property (nonatomic, assign) BOOL enableScroll;

/**< 设置选中的item */
@property (nonatomic, assign) BOOL showTopline;


- (void)hide;
- (void)show;

@end