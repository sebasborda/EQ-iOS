//
//  Vendedor.h
//  EQ
//
//  Created by yo on 6/9/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cliente, CtaCte, Pedido, Usuario, Venta;

@interface Vendedor : NSManagedObject

@property (nonatomic, retain) NSNumber * activo;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * codigo;
@property (nonatomic, retain) Usuario *usuario;
@property (nonatomic, retain) NSSet *pedidos;
@property (nonatomic, retain) NSSet *clienteVendedor;
@property (nonatomic, retain) NSSet *venta;
@property (nonatomic, retain) NSSet *clienteCobrador;
@property (nonatomic, retain) NSSet *ctaCte;
@end

@interface Vendedor (CoreDataGeneratedAccessors)

- (void)addPedidosObject:(Pedido *)value;
- (void)removePedidosObject:(Pedido *)value;
- (void)addPedidos:(NSSet *)values;
- (void)removePedidos:(NSSet *)values;

- (void)addClienteVendedorObject:(Cliente *)value;
- (void)removeClienteVendedorObject:(Cliente *)value;
- (void)addClienteVendedor:(NSSet *)values;
- (void)removeClienteVendedor:(NSSet *)values;

- (void)addVentaObject:(Venta *)value;
- (void)removeVentaObject:(Venta *)value;
- (void)addVenta:(NSSet *)values;
- (void)removeVenta:(NSSet *)values;

- (void)addClienteCobradorObject:(Cliente *)value;
- (void)removeClienteCobradorObject:(Cliente *)value;
- (void)addClienteCobrador:(NSSet *)values;
- (void)removeClienteCobrador:(NSSet *)values;

- (void)addCtaCteObject:(CtaCte *)value;
- (void)removeCtaCteObject:(CtaCte *)value;
- (void)addCtaCte:(NSSet *)values;
- (void)removeCtaCte:(NSSet *)values;

@end
