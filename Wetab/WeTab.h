//单例宏定义
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;


//#if (!__has_feature(objc_arc)) \
//todo:把【aa new】也放到里面
#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}


#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)instance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)instance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}


// 获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define tabBarColorSelected RGB(40, 205, 105)
#define tabBarColor RGB(102, 102, 102)

#define XbmColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//定义字体的大小
#define TextFont(f) [UIFont systemFontOfSize:f]

//从6适配5的比例系数
#define WIDTH_BIG_QUOTIETY  375/320

//从5适配6的比例系数
#define WIDTH_SMALL_QUOTIETY  320/375

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


//自定义颜色 ColorWihtRGB(r,g,b,a)
#define ColorWihtRGB(r,g,b,a) [UIColor  colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#define TEXTFONT(r)   [UIFont fontWithName:@"Helvetica" size:r]
#define IsIOS7        ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)
#define StatusBar           20
#define NavigationbarHeight 44
#define TopBarHeight        64
#define TabBarHeight        49
#define TEXTFONT(r)   [UIFont fontWithName:@"Helvetica" size:r]
#define MainTableView (tableView != washCarTableView && tableView != sortTableView && tableView != shaiXuanTableView && tableView != leftTab && tableView != rightTab)




#import "WeTabBar.h"
#import "WeTabBarController.h"
#import "WeTabBarItem.h"

