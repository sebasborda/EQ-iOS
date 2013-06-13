//
//  LineaVTA.h
//  EQ
//
//  Created by yo on 6/9/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cliente;

@interface LineaVTA : NSManagedObject

@property (nonatomic, retain) NSNumber * activo;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * codigo;
@property (nonatomic, retain) NSSet *cliente;
@end

@interface LineaVTA (CoreDataGeneratedAccessors)

- (void)addClienteObject:(Cliente *)value;
- (void)removeClienteObject:(Cliente *)value;
- (void)addCliente:(NSSet *)values;
- (void)removeCliente:(NSSet *)values;

@end
