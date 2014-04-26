
#import "ColorsTableViewController.h"
#import "BigColorTableViewCell.h"
#import <UIColor+FlatColors.h>

@interface ColorsTableViewController ()
@property (nonatomic, strong) NSArray *colors;
@end

@implementation ColorsTableViewController

static NSString * const cellIdentifier = @"CellIdentifier";

- (NSArray *)colors
{
    if(!_colors) {
        _colors = @[
                   @"Turquoise",
                   @"Green Sea",
                   @"Emerald",
                   @"Nephritis",
                   @"Peter River",
                   @"Belize Hole",
                   @"Amethyst",
                   @"Wisteria",
                   @"Wet Asphalt",
                   @"Midnight Blue",
                   @"Sun Flower",
                   @"Orange",
                   @"Carrot",
                   @"Pumpkin",
                   @"Alizarin",
                   @"Pomegranate",
                   @"Clouds",
                   @"Silver",
                   @"Concrete",
                   @"Asbestos",
                   ];
    }
    
    return _colors;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[BigColorTableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BigColorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    NSString *name = self.colors[indexPath.row];
    [cell setColorName:name];
    [cell setColor:[self colorForName:name]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

#pragma mark - Status bar

- (BOOL)prefersStatusBarHidden { return YES; }

#pragma mark - 

- (UIColor *)colorForName:(NSString *)name
{
    NSString *sanitizedName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString = [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    Class colorClass = [UIColor class];
    return [colorClass performSelector:NSSelectorFromString(selectorString)];
}

@end
