//
//  Persona+CoreDataProperties.h
//  EjemploCoreDataTabletView
//
//  Created by Christian Barco on 7/01/16.
//  Copyright © 2016 Christian Barco. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Persona.h"

NS_ASSUME_NONNULL_BEGIN

@interface Persona (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *nombre;

@end

NS_ASSUME_NONNULL_END
