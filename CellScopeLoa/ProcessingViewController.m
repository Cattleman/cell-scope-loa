//
//  ProcessingViewController.m
//  CellScopeLoa
//
//  Created by Matthew Bakalar on 1/16/14.
//  Copyright (c) 2014 Matthew Bakalar. All rights reserved.
//

#import "ProcessingViewController.h"
#import "ResultsViewController.h"

@interface ProcessingViewController ()

@end

@implementation ProcessingViewController

@synthesize program;
@synthesize instructionsView;
@synthesize activityTextLabel;
@synthesize activityView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    instructionsView.text = @"Please wait a moment while the movies are processed.";
    activityView.hidden = FALSE;
    [activityView startAnimating];
    
    activityTextLabel.text = [NSString stringWithFormat:@"Processed %d/%d", program.analysis.resultsList.count, 5];
    // Register processing notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataDownloadComplete:)
                                                 name:@"FrameBufferProcessed" object:nil];
}

- (void)dataDownloadComplete:(NSNotification *)notif
{
    dispatch_async(dispatch_get_main_queue(), ^{
        int processedCount = program.analysis.resultsList.count;
        activityTextLabel.text = [NSString stringWithFormat:@"Processed %d/%d", processedCount, 5];
        
        if (program.totalfields == processedCount) {
            [self storeResults];
            [self performSegueWithIdentifier:@"Results" sender:self];
        }
    });
}

- (void)storeResults
{
    NSMutableArray* resultsList = program.analysis.resultsList;
    for (ProcessingResult* result in resultsList)
    {
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Results"]) {
        ResultsViewController* viewController = [segue destinationViewController];
        viewController.program = program;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
