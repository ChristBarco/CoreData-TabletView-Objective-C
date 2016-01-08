//
//  TableViewController.m
//  EjemploCoreDataTabletView
//
//  Created by Christian Barco on 7/01/16.
//  Copyright © 2016 Christian Barco. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import "Persona.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Inicializa un Array el cual se llenara con los datos de la base de datos
    //Init array for fill with data from database
    self.toDoItems = [[NSMutableArray alloc] init];
    
    //Inserta 3 registros a la entidad Persona de la base de datos
    //Insert 3 row to entity Persona of Database
    [self insert];
    
    //Llena el array con los datos de la Base de Datos
    //Fill array with data from dtabase
    [self fillArrayWithData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.toDoItems count];
}

//Llena el array con los datos obtenidos desde la base de datos
//Fill array with data get from Entity data base Persona

-(void) fillArrayWithData{
    AppDelegate *appdelegate = (AppDelegate*) [[UIApplication sharedApplication]delegate];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Persona" inManagedObjectContext:appdelegate.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    self.toDoItems = [[appdelegate.managedObjectContext executeFetchRequest:request error:nil]mutableCopy ];
    
    //Mostrar datos por LOG
    //Show Data for LOG
    for(NSManagedObject *obj in self.toDoItems){
        
        NSLog(@"ID: %@",[[obj objectID] URIRepresentation]); //Obtiene un ID unico creado por Core Dara
                                                            //Get only ID for register created for Core Data
        NSLog(@"Nombre: %@",[obj valueForKey:@"nombre"]);
        
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //El dequeueReusableCellWithIdentifier se modifica en el storyboard TableViewCell en el campo identifier
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    //Recorre el array, obtiene un NSManagedObject y obtiene los datos a mostrar en el TableView Cell
    NSManagedObject *item = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = [item valueForKey:@"nombre"];
    return cell;
}

- (void) insert{
    
    //Obtiene una relacion al AppDelegate para ejecutar el metodo managedObjectContext y obtener el Context
    //Get appDelegate for get Context, and execute this method
    AppDelegate *appdelegate = (AppDelegate*) [[UIApplication sharedApplication]delegate];
    
    
    Persona *persona = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Persona"
                      inManagedObjectContext:appdelegate.managedObjectContext];
    persona.nombre = @"Registro Nombre 1"; //Atributo de la base de datos
    

    Persona *persona2 = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Persona"
                        inManagedObjectContext:appdelegate.managedObjectContext];
    persona2.nombre = @"Registro Nombre 2";

    

    Persona *persona3 = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Persona"
                        inManagedObjectContext:appdelegate.managedObjectContext];
    persona3.nombre = @"Registro Nombre 3";

    //Guarda el contexto y realiza la consulta de registro
    //Save context and execute query for insert
    [appdelegate saveContext];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
