//
//  ItemTVC.m
//  NSUserDefaultsExample
//
//  Created by Mollie on 1/18/15.
//

#import "ItemTVC.h"

@interface ItemTVC ()

@property NSMutableArray *array;

@end

@implementation ItemTVC

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.array = [[defaults arrayForKey:@"array"] mutableCopy];

}

- (IBAction)addItem:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.array count] == 0) {
        self.array = [[NSMutableArray alloc] init];
    }
    
    [self.array addObject:[NSDate date]];
    [defaults setObject:self.array forKey:@"array"];
    [self.tableView reloadData];

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDate *item = self.array[indexPath.row];
    cell.textLabel.text = [item description];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [self.array removeObjectAtIndex:indexPath.row];
        [defaults setObject:self.array forKey:@"array"];
        [self.tableView reloadData];
        
    }
    
}

@end