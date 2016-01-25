//单例宏定义
#define WE_DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;


//#if (!__has_feature(objc_arc)) \
//todo:把【aa new】也放到里面
#define WE_DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

//获取屏幕 宽度、高度
#define WE_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define WE_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define WE_TABBAR_HEIGHT       49
#define WE_VIEWCONTROLLER_FRAME CGRectMake(0, WE_SCREEN_HEIGHT-TabBarHeight, WE_SCREEN_WIDTH, TabBarHeight)

#import <UIKit/UIKit.h>
#import "WeTabBar.h"
#import "WeTabBarController.h"
#import "WeTabBarItem.h"

