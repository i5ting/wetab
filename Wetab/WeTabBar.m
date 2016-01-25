#import "WeTabBar.h"
#import "WeTabBarItem.h"

#define kTagGap     5000

@interface WeTabBar ()

@property (nonatomic, strong) WeTabBarItem * selItem;

@property (nonatomic, assign) BOOL isClick;

@end


@implementation WeTabBar {
    
    CGRect m_tabBarRect;
}

@synthesize showTopline;

#pragma mark - Life cycle

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self config:WE_VIEWCONTROLLER_FRAME];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self config:WE_VIEWCONTROLLER_FRAME];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self config:frame];
    }
    
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    [self addItems];
}


#pragma mark - Private Methods

- (void)config:(CGRect)rect {
    
    self.backgroundColor = [UIColor whiteColor];
    
    m_tabBarRect = rect;
}

- (void)setShowTopline:(BOOL)flag{
//    self.showTopline = flag;
    if (flag) {
        UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WE_SCREEN_WIDTH, 1)];
        topLine.image = [UIImage imageNamed:@"tabbar_top"];
        [self addSubview:topLine];
    }
}

- (void)addItems {
    
    CGFloat buttonWidth = WE_SCREEN_WIDTH/_tabBarItems.count;
    CGFloat tabBarHeight = m_tabBarRect.size.height;
    
    for (int i=0; i<_tabBarItems.count; ++i) {
        
        WeTabBarItem * item = [_tabBarItems objectAtIndex:i];
        item.frame = CGRectMake(i * buttonWidth, 0, buttonWidth, tabBarHeight);
        item.tag = i + kTagGap;
        
        if (i == 0) {
            [item selectedItemWithoutAnimation];
            self.selItem = item;
        } else {
            [item deselectedItemWithoutAnimation];
        }
        
        [item addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:item];
    }
}


#pragma mark - event response
- (void)itemSelected:(WeTabBarItem *)sender {
    WeTabBarItem * item = sender;
    
    if (self.selItem == item) return;
    
    NSInteger currentIndex = self.selItem.tag - kTagGap;
    
    _tabBarItemSelected(item.tag - kTagGap, currentIndex);
}


#pragma mark - getter and setter

/*** setter ***/
- (void)setTabBarItems:(NSArray *)tabBarItems {
    
    _tabBarItems = tabBarItems;
    
    [tabBarItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[WeTabBarItem class]]) {
            WeTabBarItem * item = (WeTabBarItem *)obj;
            if (obj == 0) {
                item.selected = YES;
            }
            
            item.tag = idx + kTagGap;
            [item addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:item];
        }
    }];
}

- (void)selectItemAtIndex:(CGFloat)progress {

    NSInteger tag = (NSInteger)progress + kTagGap;
    CGFloat rate = progress - tag + kTagGap;
    WeTabBarItem *currentItem = (WeTabBarItem *)[self viewWithTag:tag];
    WeTabBarItem *nextItem = (WeTabBarItem *)[self viewWithTag:tag+1];
    
    if (rate == 0.0) {
        rate = 1.0;
        self.selItem.rate = 0;
        self.selItem = currentItem;
        self.selItem.rate = 1;
        return;
    }
    
    currentItem.rate = 1-rate;
    nextItem.rate = rate;
}

- (void)hide
{
    self.frame = CGRectMake(0, 0, 0, 0);
    self.hidden = YES;
}

- (void)show
{
    self.frame = WE_VIEWCONTROLLER_FRAME;
    self.hidden = NO;
}

@end
