//
//  SCLContact.m
//  TableViewSimpleContactList
//
//  Created by Rafael Ferreira on 1/10/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "SCLContact.h"

@implementation SCLContact

- (instancetype)initWithName:(NSString *)name andPhone:(NSString *)mobilePhone {
    self = [super init];
    
    if (self) {
        _name = name;
        _mobilePhone = mobilePhone;
    }
    
    return self;
}

@end
