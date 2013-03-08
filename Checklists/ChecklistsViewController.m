#import "ChecklistsViewController.h"

@interface ChecklistsViewController ()<UITableViewDataSource,
UITableViewDelegate>
@property(strong, nonatomic)NSMutableArray *items;
@end

@implementation ChecklistsViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.items = [[NSMutableArray alloc] init];
    NSArray *titles = @[@"Walk the dog", @"Feed the cat", @"Feed the zombie", @"Feed the cat the zombie"];
    for (NSString *title in titles) {
        NSMutableDictionary *item = [@{@"title": title, @"isChecked": @"NO"} mutableCopy];
        [self.items addObject:item];
    }
}
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    NSDictionary *item = self.items[indexPath.row];
    cell.textLabel.text = item[@"title"];
    cell.accessoryType = [item[@"isChecked"] isEqual: @"YES"] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}
-(void)         tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
