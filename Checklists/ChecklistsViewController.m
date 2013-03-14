#import "ChecklistsViewController.h"
#import "ChecklistsItem.h"

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
        ChecklistsItem *item = [[ChecklistsItem alloc] init];
        item.text = title;
        item.checked = NO;
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
    ChecklistsItem *item = self.items[indexPath.row];
    cell.textLabel.text = item.text;
    cell.accessoryType = item.isChecked ?
      UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}
-(void)         tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ChecklistsItem *item = self.items[indexPath.row];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        item.checked = YES;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        item.checked = NO;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
