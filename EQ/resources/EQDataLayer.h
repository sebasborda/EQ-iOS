//
//  EQDataLayer.h
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface EQDataLayer : NSObject

+ (EQDataLayer *)sharedInstance;
- (void)saveContext;
- (NSArray *)fetchObjectsForClass:(Class)objectClass withPredicate:(NSPredicate *)predicate sortOrder:(NSSortDescriptor *)sort;
- (NSManagedObject *)fetchObjectForClass:(Class)objectClass WithID:(NSNumber *)objectID;
- (NSManagedObject *)createOrFetchObjectForClass:(Class)objectClass WithID:(NSNumber *)objectID;
- (void)deleteObject:(NSManagedObject *)object;

@end
