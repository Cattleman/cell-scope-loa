//
//  MainMenuViewController.m
//  CellScopeLoa
//
//  Created by Matthew Bakalar on 11/10/12.
//  Copyright (c) 2012 Matthew Bakalar. All rights reserved.
//

#import "MainMenuViewController.h"
#import "AddUserViewController.h"
#import "LoaProgram.h"
#import "CaptureViewController.h"
#import "InstructionViewController.h"
#import "ReviewVideoViewController.h"
#import "SettingsViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize sensitivity;
@synthesize fetchedResultsController;
@synthesize managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Set initial sensitivity
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Sensititv: now: %f", sensitivity);
    if([segue.identifier isEqualToString:@"Users"]) {
        AddUserViewController *addUserViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        addUserViewController.managedObjectContext = self.managedObjectContext;
    }
    else if([segue.identifier isEqualToString:@"Video"]) {
        LoaProgram* program = [[LoaProgram alloc] initWithMode:@"Advanced" Sensitivity:sensitivity];
        program.managedObjectContext = managedObjectContext;
        program.sensitivity = sensitivity;
        ReviewVideoViewController *reviewVideoViewController = [segue destinationViewController];
        reviewVideoViewController.program = program;
    }
    // Test with instructions
    else if([segue.identifier isEqualToString:@"Test"]) {
        LoaProgram* program = [[LoaProgram alloc] initWithMode:@"Advanced" Sensitivity:sensitivity];
        program.managedObjectContext = managedObjectContext;
        program.sensitivity = sensitivity;
        InstructionViewController *instructionViewController = [segue destinationViewController];
        instructionViewController.program = program;
    }
    // Test without instructions
    else if([segue.identifier isEqualToString:@"TestNoInstruct"]) {
        LoaProgram* program = [[LoaProgram alloc] initWithMode:@"Advanced" Sensitivity:sensitivity];
        NSLog(@"Sensitivity at: %f", sensitivity);
        program.managedObjectContext = managedObjectContext;
        program.sensitivity = sensitivity;
        CaptureViewController *captureViewController = [segue destinationViewController];
        captureViewController.program = program;
        captureViewController.managedObjectContext = managedObjectContext;
    }
    else if([segue.identifier isEqualToString:@"Settings"]) {
        SettingsViewController* settings = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
        settings.managedObjectContext = managedObjectContext;
        settings.delegate = self;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}
 */

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
 */

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortraitUpsideDown;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if(YES) {
            [self performSegueWithIdentifier:@"TestNoInstruct" sender:self];
        }
        else {
            [self performSegueWithIdentifier:@"Test" sender:self];
        }
    }
    else if(indexPath.row == 1) {
        [self performSegueWithIdentifier:@"Settings" sender:self];
    }
}

#pragma mark - Settings delegate

- (void)updateSensitivity:(float)value
{
    sensitivity = value;
    NSLog(@"Set sensitivity to: %f", sensitivity);
}

@end
