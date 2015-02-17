//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Suparn Gupta on 2/12/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController()
@property (strong, nonatomic) UISegmentedControl *segControl;
@end
@implementation HypnosisViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno.png"];
    }
    
    return self;
}

- (void) loadView{

    CGRect mainFrame =  [UIScreen mainScreen].bounds;
    HypnosisView *view = [[HypnosisView alloc] initWithFrame:mainFrame];
    self.segControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];
    [view addSubview:self.segControl];
    [self.segControl addTarget:self
                         action:@selector(segmentChanged:)
               forControlEvents:UIControlEventValueChanged];
    self.view = view;
}


- (void) viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewLoaded");
}

- (void) segmentChanged:event{
    NSLog(@"Tapped");
    int x = (int)[self.segControl selectedSegmentIndex];
    HypnosisView *view = ((HypnosisView *) self.view);
    if(x == 0){
        view.circleColor = [UIColor redColor];
        
    }
    else if(x == 1){
        view.circleColor = [UIColor greenColor];
    }
    
    else {
        view.circleColor = [UIColor blueColor];
    }
    [view setNeedsDisplay];
}
@end
