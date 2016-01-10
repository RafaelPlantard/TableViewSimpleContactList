//
//  ViewController.h
//  TableViewSimpleContactList
//
//  Created by Rafael Ferreira on 1/10/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! @brief The view controller for home view on app. */
@interface SCLViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *contactsList;
}

/*! @brief The contact list table view component. */
@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;

@end