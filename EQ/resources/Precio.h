//
//  Precio.h
//  EQ
//
//  Created by Sebastian Borda on 6/12/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Articulo;

@interface Precio : NSManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * importe;
@property (nonatomic, retain) NSString * numero;
@property (nonatomic, retain) Articulo *articulo;

@end
