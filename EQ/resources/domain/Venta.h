//
//  Venta.h
//  EQ
//
//  Created by yo on 6/9/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Articulo, Cliente, Vendedor;

@interface Venta : NSManagedObject

@property (nonatomic, retain) NSNumber * cantidad;
@property (nonatomic, retain) NSString * comprobante;
@property (nonatomic, retain) NSNumber * actualizado;
@property (nonatomic, retain) NSString * empresa;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * fecha;
@property (nonatomic, retain) NSNumber * importe;
@property (nonatomic, retain) Cliente *cliente;
@property (nonatomic, retain) Articulo *articulos;
@property (nonatomic, retain) Vendedor *vendedor;

@end
