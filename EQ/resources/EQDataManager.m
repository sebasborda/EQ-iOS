//
//  EQDataManager.m
//  EQ
//
//  Created by Sebastian Borda on 6/15/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQDataManager.h"
#import "EQSession.h"
#import "EQNetworkManager.h"
#import "EQDataLayer.h"
#import "TipoIvas.h"
#import "Cliente.h"
#import "Precio.h"
#import "Provincia.h"
#import "Articulo.h"
#import "Vendedor.h"
#import "Venta.h"
#import "Expreso.h"
#import "ZonaEnvio.h"
#import "Precio.h"
#import "CondPag.h"
#import "LineaVTA.h"
#import "Pedido.h"
#import "ItemPedido.h"
#import "CtaCte.h"
#import "AppDelegate.h"

@implementation EQDataManager

-(void)updateData{
    [self updateTaxes];
}

- (void)lastSynchronizationDate:(NSMutableDictionary *)dictionary{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *lastSynchronization = [[EQSession sharedInstance] lastSynchronization];
    if (lastSynchronization) {
        [dictionary setObject:lastSynchronization forKey:@"timestamp"];
    }
}

- (Usuario *)currentUser{
    return [EQSession sharedInstance].currentUser;
}

- (void)updateClients{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"zona_envio",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            Cliente *cliente = (Cliente *)[dl createOrFetchObjectForClass:[Cliente class] WithID:identifier];
            cliente.identifier = identifier;
            cliente.activo = dictionary[@"activo"];
            cliente.codigo1 = dictionary[@"codigo1"];
            cliente.codigo2 = dictionary[@"codigo2"];
            cliente.codigoPostal = dictionary[@"cod_postal"];
            cliente.cuit = dictionary[@"cuit"];
            cliente.descuento1 = dictionary[@"descuento1"];
            cliente.descuento2 = dictionary[@"descuento2"];
            cliente.descuento3 = dictionary[@"descuento3"];
            cliente.descuento4 = dictionary[@"descuento4"];
            cliente.diasDePago = dictionary[@"dias_de_pago"];
            cliente.domicilio = dictionary[@"domicilio"];
            cliente.domicilioDeEnvio = dictionary[@"domicilio_envio"];
            cliente.encCompras = dictionary[@"enc_compras"];
            cliente.horario = dictionary[@"horario"];
            cliente.latitud = dictionary[@"ubicacion_gps_lat"];
            cliente.localidad = dictionary[@"localidad"];
            cliente.longitud = dictionary[@"ubicacion_gps_lng"];
            cliente.mail = dictionary[@"mail"];
            cliente.nombre = dictionary[@"nombre"];
            cliente.nombreDeFantasia = dictionary[@"nombre_fantasia"];
            cliente.observaciones = dictionary[@"observaciones"];
            cliente.propietario = dictionary[@"dueno"];
            cliente.sucursal = dictionary[@"sucursal"];
            cliente.telefono = dictionary[@"telefono"];
            cliente.web = dictionary[@"web"];
            
            
            cliente.cobrador = (Vendedor*)[dl fetchObjectForClass:[Vendedor class] WithID:dictionary[@"cobrador_id"]];
            cliente.condicionDePago = (CondPag*)[dl fetchObjectForClass:[CondPag class] WithID:dictionary[@"condicion_pago_id"]];
            cliente.expreso = (Expreso*)[dl fetchObjectForClass:[Expreso class] WithID:dictionary[@"expreso_id"]];
            cliente.iva = (TipoIvas*)[dl fetchObjectForClass:[TipoIvas class] WithID:dictionary[@"tipo_iva_id"]];
            cliente.lineaDeVenta = (LineaVTA*)[dl fetchObjectForClass:[LineaVTA class] WithID:dictionary[@"linea_venta_id"]];
            cliente.vendedor = (Vendedor*)[dl fetchObjectForClass:[Vendedor class] WithID:dictionary[@"vendedor_id"]];
            cliente.zona = (Provincia*)[dl fetchObjectForClass:[Provincia class] WithID:dictionary[@"provincia_id"]];
            cliente.zonaEnvio = (ZonaEnvio*)[dl fetchObjectForClass:[ZonaEnvio class] WithID:dictionary[@"zona_envio_id"]];
            
            [objectsList addObject:cliente];
        }
        
        [dl saveContext];
        [self updateSales];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}

- (void)updateDeliveryArea{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"zona_envio",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            ZonaEnvio *ze = (ZonaEnvio *)[dl createOrFetchObjectForClass:[ZonaEnvio class] WithID:identifier];
            ze.identifier = identifier;
            ze.descripcion = dictionary[@"descripcion"];
            ze.codigo = dictionary[@"codigo"];
            ze.activo = dictionary[@"activo"];
            
            [objectsList addObject:ze];
        }
        
        [dl saveContext];
        [self updatePaymentConditions];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}

- (void)updateSellers{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"vendedor",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            Vendedor *vendedor = (Vendedor *)[dl createOrFetchObjectForClass:[Vendedor class] WithID:identifier];
            vendedor.identifier = identifier;
            vendedor.descripcion = dictionary[@"descripcion"];
            vendedor.codigo = dictionary[@"codigo"];
            vendedor.activo = dictionary[@"activo"];
            vendedor.usuario = (Usuario *)[dl fetchObjectForClass:[Usuario class] WithID:params[@"wp_user_id"]];
            
            [objectsList addObject:vendedor];
        }
        
        [dl saveContext];
        [self updateProducts];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updateTaxes{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"tipo_iva",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            TipoIvas *iva = (TipoIvas *)[dl createOrFetchObjectForClass:[TipoIvas class] WithID:identifier];
            iva.identifier = identifier;
            iva.descripcion = dictionary[@"descripcion"];
            iva.codigo = dictionary[@"codigo"];
            iva.activo = dictionary[@"activo"];
            
            [objectsList addObject:iva];
        }
        
        [dl saveContext];
        [self updateExpress];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updateProvinces{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"provincia",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            Provincia *provincia = (Provincia *)[dl createOrFetchObjectForClass:[Provincia class] WithID:identifier];
            provincia.identifier = identifier;
            provincia.descripcion = dictionary[@"descripcion"];
            provincia.codigo = dictionary[@"codigo"];
            provincia.activo = dictionary[@"activo"];
            
            [objectsList addObject:provincia];
        }
        
        [dl saveContext];
        [self updateDeliveryArea];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updateExpress{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"expreso",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            Expreso *expreso = (Expreso *)[dl createOrFetchObjectForClass:[Expreso class] WithID:identifier];
            expreso.identifier = identifier;
            expreso.descripcion = dictionary[@"descripcion"];
            expreso.codigo = dictionary[@"codigo"];
            expreso.activo = dictionary[@"activo"];
            
            [objectsList addObject:expreso];
        }
        
        [dl saveContext];
        [self updateProvinces];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updateCurrentAccounts{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"cuenta_corriente",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            CtaCte *ctacte = (CtaCte *)[dl createOrFetchObjectForClass:[CtaCte class] WithID:identifier];
            ctacte.identifier = identifier;
            ctacte.comprobante = dictionary[@"comprobante"];
            ctacte.condicionDeVenta = dictionary[@"condicion_de_venta"];
            ctacte.empresa = dictionary[@"empresa"];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            ctacte.fecha = [dateFormatter dateFromString:dictionary[@"fecha"]];
            ctacte.importe = dictionary[@"importe"];
            ctacte.importeConDescuento = dictionary[@"importe_con_desc"];
            ctacte.importePercepcion = dictionary[@"importe_percepcion"];
            ctacte.cliente = (Cliente*)[dl fetchObjectForClass:[Cliente class] WithID:dictionary[@"cliente_id"]];
            ctacte.vendedor = (Vendedor*)[dl fetchObjectForClass:[Vendedor class] WithID:dictionary[@"vendedor_id"]];

            [objectsList addObject:ctacte];
        }
        
        [dl saveContext];
        [self updateOrders];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updateOrderItems{
    //TODO: implementar
    [((AppDelegate *)[[UIApplication sharedApplication] delegate]) unLockUI];
}


- (void)updateOrders{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"cuenta_corriente",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            Pedido *pedido = (Pedido *)[dl createOrFetchObjectForClass:[Pedido class] WithID:identifier];
            pedido.identifier = identifier;
            pedido.fecha = dictionary[@"fecha"];
            pedido.activo = dictionary[@"activo"];
            pedido.descuento = dictionary[@"descuento"];
            pedido.estado = dictionary[@"estado"];
            pedido.subTotal = dictionary[@"subtotal"];
            pedido.latitud = dictionary[@"ubicacion_gps_lat"];
            pedido.longitud = dictionary[@"ubicacion_gps_lng"];
            pedido.total = dictionary[@"total"];
            pedido.observaciones = dictionary[@"observaciones"];
            pedido.descuento3 = dictionary[@"descuento3"];
            pedido.descuento4 = dictionary[@"descuento4"];
            pedido.cliente = (Cliente*)[dl fetchObjectForClass:[Cliente class] WithID:dictionary[@"cliente_id"]];
            pedido.vendedor = (Vendedor*)[dl fetchObjectForClass:[Vendedor class] WithID:dictionary[@"vendedor_id"]];
            
            [objectsList addObject:pedido];
        }
        
        [dl saveContext];
        [self updateOrderItems];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updatePaymentConditions{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"condicion_pago",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            CondPag *cp = (CondPag *)[dl createOrFetchObjectForClass:[CondPag class] WithID:identifier];
            cp.identifier = identifier;
            cp.descripcion = dictionary[@"descripcion"];
            cp.codigo = dictionary[@"codigo"];
            cp.activo = dictionary[@"activo"];
            
            [objectsList addObject:cp];
        }
        
        [dl saveContext];
        [self updateSellers];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updatePrices{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"precio_articulo",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            Precio *precio = (Precio *)[dl createOrFetchObjectForClass:[Precio class] WithID:identifier];
            precio.identifier = identifier;
            precio.importe = dictionary[@"importe"];
            precio.numero = dictionary[@"numero"];
            precio.articulo =  (Articulo*)[dl fetchObjectForClass:[Articulo class] WithID:dictionary[@"articulo_id"]];
            [objectsList addObject:precio];
        }
        
        [dl saveContext];
        [self updateSalesLine];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updateSalesLine{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"linea_venta",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            LineaVTA *lv = (LineaVTA *)[dl createOrFetchObjectForClass:[LineaVTA class] WithID:identifier];
            lv.identifier = identifier;
            lv.codigo = dictionary[@"codigo"];
            lv.descripcion = dictionary[@"descripcion"];
            lv.activo =  dictionary[@"activo"];
            [objectsList addObject:lv];
        }
        
        [dl saveContext];
        [self updateClients];
    };
    
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updateSales{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"venta",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            Venta *venta = (Venta *)[dl createOrFetchObjectForClass:[Venta class] WithID:identifier];
            venta.identifier = identifier;
            venta.importe = dictionary[@"codigo"];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            venta.fecha = [dateFormatter dateFromString:dictionary[@"fecha"]];
            venta.cantidad =  dictionary[@"cantidad"];
            venta.comprobante =  dictionary[@"comprobante"];
            venta.cliente =  (Cliente*)[dl fetchObjectForClass:[Cliente class] WithID:dictionary[@"cliente_id"]];
            venta.vendedor =  (Vendedor*)[dl fetchObjectForClass:[Vendedor class] WithID:dictionary[@"vendedor_id"]];
            venta.empresa =  dictionary[@"empresa"];
            
            [objectsList addObject:venta];
        }
        
        [dl saveContext];
        [self updateCurrentAccounts];
    };
    
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


- (void)updateProducts{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"articulo",@"usuario":[self currentUser].nombreDeUsuario,@"password":[self currentUser].password}];
    [self lastSynchronizationDate:params];
    successRequest successBlock = ^(NSArray *json){
        EQDataLayer *dl = [EQDataLayer sharedInstance];
        NSMutableArray *objectsList = [NSMutableArray array];
        for (NSDictionary *dictionary in json) {
            NSNumber *identifier = dictionary[@"id"];
            Articulo *articulo = (Articulo *)[dl createOrFetchObjectForClass:[Articulo class] WithID:identifier];
            articulo.identifier = identifier;
            articulo.descripcion = dictionary[@"descripcion"];
            articulo.codigo = [NSString stringWithFormat:@"%@ %@ %@",dictionary[@"codigo1"],dictionary[@"codigo2"],dictionary[@"codigo3"]];
            articulo.activo = dictionary[@"activo"];
            articulo.disponibilidad = dictionary[@"disponibilidad"];
            articulo.cantidadPredeterminada = dictionary[@"cant_predeterm"];
            articulo.imagenURL = dictionary[@"foto"];
            articulo.minimoPedido = dictionary[@"minimo_pedido"];
            articulo.multiploPedido = dictionary[@"multiplo_pedido"];
            articulo.nombre = dictionary[@"term_name"];
            
            [objectsList addObject:articulo];
        }
        
        [dl saveContext];
        [self updatePrices];
    };
    EQRequest *request = [[EQRequest alloc] initWithParameters:params
                                                  successBlock:successBlock
                                                     failBlock:nil];
    
    [EQNetworkManager executeRequest:request];
}


@end
