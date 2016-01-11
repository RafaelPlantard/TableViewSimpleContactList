//
//  SCLContact.h
//  TableViewSimpleContactList
//
//  Created by Rafael Ferreira on 1/10/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Foundation/Foundation.h>

/*! @brief Contact model of data. */
@interface SCLContact : NSObject

/*! @brief Contact's name. */
@property (nonatomic, retain) NSString *name;

/*! @brief Mobile phone for this contact. */
@property (nonatomic, retain) NSString *mobilePhone;

/*! @brief A custom init for initialization for this object with a name and phone. */
- (instancetype)initWithName:(NSString *)name andPhone:(NSString *)mobilePhone;

@end
