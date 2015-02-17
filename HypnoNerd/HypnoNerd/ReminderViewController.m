//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Suparn Gupta on 2/12/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
@implementation ReminderViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self){
        self.tabBarItem.title = @"Reminder";
        self.tabBarItem.image = [UIImage imageNamed:@"Time.png"];
    }
    return  self;
}

- (IBAction)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for the date %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.fireDate = date;
    note.alertBody = @"Hypnotize me!";
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}


- (void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ReminderViewLoaded");
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:true];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:10];
}
@end
