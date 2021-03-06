//
//  LoaProgram.h
//  CellScopeLoa
//
//  Created by Matthew Bakalar on 11/10/12.
//  Copyright (c) 2012 Matthew Bakalar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Sample.h"
#import "MotionAnalysis.h"

@interface LoaProgram : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (strong, nonatomic) NSString* currentSampleSerial;
@property (strong, nonatomic) NSString* username;

@property (strong, nonatomic) NSString* guided;
@property (nonatomic) NSInteger fovnumber;
@property (nonatomic) NSInteger totalfields;

@property (nonatomic, assign) float sensitivity;

@property (nonatomic) NSInteger samplenumber;
@property (strong, nonatomic) MotionAnalysis* analysis;

@property (nonatomic, retain) CLLocationManager *locationManager;

- (LoaProgram*)initWithMode:(NSString*)guided Sensitivity:(float)sensitivity;
- (NSString*)fovString;

- (void)createNewSample;
- (void)movieCapturedWithURL:(NSURL*)assetURL;
- (NSString*)currentStatus;
- (NSArray*)currentMovies;
- (void)addMovieFeatures:(NSMutableArray*)coordinatesFromMike;
- (void)addMovieProcessed:(UIImage *)processedImage atURL:(NSURL*)url forMovieIndex:(NSNumber*)movidx;


@end