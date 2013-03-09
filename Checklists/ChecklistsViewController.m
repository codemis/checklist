#import "ChecklistsViewController.h"

@interface ChecklistsViewController()
  <UITableViewDataSource,UITableViewDelegate>
@property(strong, nonatomic)NSMutableArray *items;
@end

@implementation ChecklistsViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.items = [[NSMutableArray alloc] init];
    NSArray *titles = @[@"Walk the dog", @"Feed the cat", @"Feed the zombie",
                        @"Feed the cat the zombie",@"Wash the dog",
                        @"Feed the dog",@"Walk the cat",@"Walk the zombie",
                        @"Wash the zombie",@"Wash the cat",@"Water the lawn",
                        @"Mow the lawn",@"Wash the car",@"Take out the trash"];
    for (NSString *title in titles) { // Why is this curly brace on this line?
        NSMutableDictionary *item = [@{@"title": title,
                                     @"isChecked": @NO} mutableCopy];
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
    UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    NSMutableDictionary *item = self.items[indexPath.row];
    cell.textLabel.text = item[@"title"];
    cell.accessoryType = [item[@"isChecked"] boolValue] ?
      UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}
-(void)         tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.items[indexPath.row][@"isChecked"] = @YES;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        self.items[indexPath.row][@"isChecked"] = @NO;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
