
#import "ColorsTableViewController.h"
#import <UIColor+FlatColors.h>

@interface ColorsTableViewController ()
@property (nonatomic, strong) NSArray *colors;
@end

@implementation ColorsTableViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (!self) { return nil; }

    self.colors = @[
                    [UIColor flatTurquoiseColor],
                    [UIColor flatGreenSeaColor],
                    [UIColor flatEmeraldColor],
                    [UIColor flatNephritisColor],
                    [UIColor flatPeterRiverColor],
                    [UIColor flatBelizeHoleColor],
                    [UIColor flatAmethystColor],
                    [UIColor flatWisteriaColor],
                    [UIColor flatWetAsphaltColor],
                    [UIColor flatMidnightBlueColor],
                    [UIColor flatSunFlowerColor],
                    [UIColor flatOrangeColor],
                    [UIColor flatCarrotColor],
                    [UIColor flatPumpkinColor],
                    [UIColor flatAlizarinColor],
                    [UIColor flatPomegranateColor],
                    [UIColor flatCloudsColor],
                    [UIColor flatSilverColor],
                    [UIColor flatConcreteColor],
                    [UIColor flatAsbestosColor],
                    ];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }

    cell.backgroundColor = self.colors[indexPath.row];
    
    return cell;
}

#pragma mark - Status bar

- (BOOL)prefersStatusBarHidden { return YES; }

@end
