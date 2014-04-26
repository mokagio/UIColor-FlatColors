
#import "BigColorTableViewCell.h"

@interface UIColor (Intensity)
- (NSInteger)overallIntensity;
@end

@implementation UIColor (Intensity)

// See http://stackoverflow.com/questions/3942878/how-to-decide-font-color-in-white-or-black-depending-on-background-color
- (NSInteger)overallIntensity
{
    CGFloat red, blue, green, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];

    NSInteger intensity = (red * 255 * 0.299 + green * 255 * 0.578 + blue * 255 * 0.114);
    return intensity;
}

@end

@interface BigColorTableViewCell ()
@property (nonatomic, strong) UILabel *colorNameLabel;
@end

@implementation BigColorTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) { return nil; }

    self.colorNameLabel = [[UILabel alloc] init];
    self.colorNameLabel.font = [UIFont systemFontOfSize:18];
    self.colorNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.colorNameLabel];

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat height = self.frame.size.height;
    self.colorNameLabel.frame = CGRectMake(0,
                                           self.frame.size.height - height,
                                           self.frame.size.width,
                                           height);
}

#pragma mark - 

- (void)setColor:(UIColor *)color
{
    self.backgroundColor = color;

    // side-effect
    if ([color overallIntensity] < 186) {
        self.colorNameLabel.textColor = [UIColor whiteColor];
    } else {
        self.colorNameLabel.textColor = [UIColor blackColor];
    }
}

- (void)setColorName:(NSString *)colorName
{
    self.colorNameLabel.text = [colorName lowercaseString];
}

- (UIColor *)colorForName:(NSString *)name
{
    NSString *sanitizedName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString = [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    
    UIColor *color = nil;
    if([UIColor respondsToSelector:NSSelectorFromString(selectorString)]) {
        color = [UIColor performSelector:NSSelectorFromString(selectorString)];
    }
    
    return color;
}

@end
