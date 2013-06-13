//
//  CtaCte.h
//  EQ
//
//  Created by yo on 6/9/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cliente, Vendedor;

@interface CtaCte : NSManagedObject

@property (nonatomic, retain) NSString * condicionDeVenta;
@property (nonatomic, retain) NSString * comprobante;
@property (nonatomic, retain) NSNumber * importeConDescuento;
@property (nonatomic, retain) NSString * empresa;
@property (nonatomic, retain) NSNumber * importePercepcion;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * diasDeAtraso;
@property (nonatomic, retain) NSString * fecha;
@property (nonatomic, retain) NSNumber * importe;
@property (nonatomic, retain) Cliente *cliente;
@property (nonatomic, retain) Vendedor *vendedor;

@end
