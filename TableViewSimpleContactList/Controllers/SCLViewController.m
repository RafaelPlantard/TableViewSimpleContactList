//
//  ViewController.m
//  TableViewSimpleContactList
//
//  Created by Rafael Ferreira on 1/10/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "SCLViewController.h"
#import "SCLContact.h"

static NSString *const ContactCacheIdCell = @"ContactCacheId";

@interface SCLViewController ()

@end

@implementation SCLViewController

- (void)loadContactList {
    NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"ContactsList" ofType:@"plist"];
    
    NSDictionary *contactFromPList = [NSDictionary dictionaryWithContentsOfFile:pListPath];
    
    NSArray *contactListFromDictionary = [contactFromPList objectForKey:@"contacts"];
    
    contactsList = [NSMutableArray new];
    
    for (NSDictionary *data in contactListFromDictionary) {
        NSString *name = [data objectForKey:@"name"];
        NSString *mobilePhone = [data objectForKey:@"mobilePhone"];
        
        SCLContact *c = [[SCLContact alloc] initWithName:name andPhone:mobilePhone];
        
        [contactsList addObject:c];
    }
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [contactsList removeObjectAtIndex:indexPath.row];
    
    [_contactsTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SCLContact *c = [contactsList objectAtIndex:indexPath.row];
    
    NSString *message = [NSString stringWithFormat:@"Name: %@ \nMobile phone: %@", c.name, c.mobilePhone];
    
    UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"continue" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Contact details" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:continueAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    [_contactsTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    [_contactsTableView setEditing:editing animated:animated];
}

#pragma mark - UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_contactsTableView dequeueReusableCellWithIdentifier:ContactCacheIdCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ContactCacheIdCell];
    }
    
    SCLContact *c = [contactsList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = c.name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return contactsList.count;
}

#pragma mark - UIViewController methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self loadContactList];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

@end