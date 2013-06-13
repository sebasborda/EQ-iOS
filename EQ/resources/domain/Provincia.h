//
//  Provincia.h
//  EQ
//
//  Created by yo on 6/9/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cliente;

@interface Provincia : NSManagedObject

@property (nonatomic, retain) NSNumber * activo;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * codigo;
@property (nonatomic, retain) NSSet *zonaClientes;
@end

@interface Provincia (CoreDataGeneratedAccessors)

- (void)addZonaClientesObject:(Cliente *)value;
- (void)removeZonaClientesObject:(Cliente *)value;
- (void)addZonaClientes:(NSSet *)values;
- (void)removeZonaClientes:(NSSet *)values;

@end
