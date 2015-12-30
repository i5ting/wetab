#import <UIKit/UIKit.h>
#import "WeTab.h"

typedef void (^WeTabBarItemSelected)( NSInteger selectedIndex, NSInteger currentIndex);

@interface WeTabBar : UIView

/**> tabBar上的按钮 */
@property (nonatomic, copy) NSArray * tabBarItems;

/**> */
@property (nonatomic, strong) WeTabBarItemSelected tabBarItemSelected;

@property (nonatomic, assign) BOOL showTopline;

- (void)selectItemAtIndex:(CGFloat)index;

- (void)hide;

- (void)show;

@end
