//
//  Pedido.h
//  EQ
//
//  Created by Sebastian Borda on 6/12/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cliente, ItemPedido, Vendedor;

@interface Pedido : NSManagedObject

@property (nonatomic, retain) NSNumber * activo;
@property (nonatomic, retain) NSNumber * actualizado;
@property (nonatomic, retain) NSNumber * descuento;
@property (nonatomic, retain) NSString * estado;
@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * importe;
@property (nonatomic, retain) NSString * latitud;
@property (nonatomic, retain) NSString * longitud;
@property (nonatomic, retain) NSNumber * neto;
@property (nonatomic, retain) NSString * observaciones;
@property (nonatomic, retain) NSDate * sincronizacion;
@property (nonatomic, retain) Cliente *cliente;
@property (nonatomic, retain) NSSet *items;
@property (nonatomic, retain) Vendedor *vendedor;
@end

@interface Pedido (CoreDataGeneratedAccessors)

- (void)addItemsObject:(ItemPedido *)value;
- (void)removeItemsObject:(ItemPedido *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
