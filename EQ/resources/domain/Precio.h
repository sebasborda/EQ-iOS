//
//  Precio.h
//  EQ
//
//  Created by yo on 6/9/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Articulo;

@interface Precio : NSManagedObject

@property (nonatomic, retain) NSNumber * importe;
@property (nonatomic, retain) NSString * numero;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) Articulo *articulo;

@end
