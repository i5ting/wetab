#define kAnimateRate    0.1

@implementation WeTabBarItem

#pragma mark - life cycle

+ (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
 
    WeTabBarItem * item = [[WeTabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    return item;
}

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    
    self = [super init];
    if (self) {
        
        [self addSubview:self.normalImageView];
        [self addSubview:self.selectedImageView];
        [self addSubview:self.titleLabel];
        
        self.titleLabel.text = title;
        self.normalImageView.image = image;
        self.selectedImageView.image = selectedImage;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    CGSize titleSize = self.titleLabel.frame.size;
    
    self.normalImageView.frame = CGRectMake(0, 0, 22, 22);
    self.selectedImageView.frame = CGRectMake(0, 0, 22, 22);
    
    CGSize imageSize = self.normalImageView.image.size;
    if (imageSize.width != 0 && imageSize.height != 0) {
        CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 3 - titleSize.height - imageSize.height / 2 - 5;
        self.normalImageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
        self.selectedImageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
        
    } else {
        CGPoint imageViewCenter = self.normalImageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
        imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
        self.normalImageView.center = imageViewCenter;
        self.selectedImageView.center = imageViewCenter;
    }
    
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2,
                                      CGRectGetHeight(self.frame) - 3 - titleSize.height / 2);
    self.titleLabel.center = labelCenter;
}


/** 取消选中动画 */
- (void)deselectedItemWithoutAnimation {

    self.rate = 0.0;
    self.itemSelected = NO;
}

/** 选中动画 */
- (void) selectedItemWithoutAnimation {
    
    self.rate = 1.0;
    self.itemSelected = YES;
}


#pragma mark - getter and setter

/*** getter ***/
- (UIImageView *)normalImageView {
    
    if (!_normalImageView) {
        _normalImageView = [[UIImageView alloc] init];
        _normalImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _normalImageView;
}

- (UIImageView *)selectedImageView {
    
    if (!_selectedImageView) {
        _selectedImageView = [[UIImageView alloc] init];
        _selectedImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _selectedImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (void)setItemSelected:(BOOL)itemSelected {
    
    _itemSelected = itemSelected;

    if (self.isItemSelected) {
        if (self.rate < 1.0f) {
            self.rate = 1.0f;
        }
    } else {
        if (self.rate > 0.0f) {
            self.rate = 0.0f;
        }
    }
}

// 设置rate,并刷新标题状态
- (void)setRate:(CGFloat)rate{
    _rate = rate;
    
    self.normalImageView.alpha = 1 - _rate;
    self.selectedImageView.alpha = _rate;
}

@end
