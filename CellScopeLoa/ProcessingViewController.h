//
//  ProcessingViewController.h
//  CellScopeLoa
//
//  Created by Matthew Bakalar on 11/16/12.
//  Copyright (c) 2012 Matthew Bakalar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoaProgram.h"

@interface ProcessingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *instructions;
@property (strong, nonatomic) LoaProgram* program;

- (IBAction)onPressed:(id)sender;
@end