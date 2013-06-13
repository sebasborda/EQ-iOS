//
//  ZonaEnvio.h
//  EQ
//
//  Created by yo on 6/9/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cliente;

@interface ZonaEnvio : NSManagedObject

@property (nonatomic, retain) NSNumber * activo;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * codigo;
@property (nonatomic, retain) NSSet *clientes;
@end

@interface ZonaEnvio (CoreDataGeneratedAccessors)

- (void)addClientesObject:(Cliente *)value;
- (void)removeClientesObject:(Cliente *)value;
- (void)addClientes:(NSSet *)values;
- (void)removeClientes:(NSSet *)values;

@end
