//
//  ItemPedido.h
//  EQ
//
//  Created by yo on 6/9/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Articulo, Pedido;

@interface ItemPedido : NSManagedObject

@property (nonatomic, retain) NSNumber * cantidad;
@property (nonatomic, retain) Pedido *pedido;
@property (nonatomic, retain) Articulo *articulo;

@end
