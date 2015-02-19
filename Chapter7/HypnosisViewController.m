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
@property (strong, nonatomic) HypnosisView *hypnosisView;
@property (strong, nonatomic) UIScrollView *scroller;
@end
@implementation HypnosisViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno.png"];
    }
    
    return self;
}`

- (void) loadView{

    CGRect mainFrame =  [UIScreen mainScreen].bounds;
    self.hypnosisView = [[HypnosisView alloc] initWithFrame:mainFrame];
//    self.segControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];
//    [view addSubview:self.segControl];
//    [self.segControl addTarget:self
//                         action:@selector(segmentChanged:)
//               forControlEvents:UIControlEventValueChanged];
    
    CGRect textfieldFrame = CGRectMake(50, 50, 200, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textfieldFrame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.returnKeyType = UIReturnKeyDone;
    [self.hypnosisView addSubview:textField];
    textField.placeholder = @"Hypnotise me!";
    textField.delegate = self;
//    [textField becomeFirstResponder];
    self.scroller = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIScrollView *scroller = self.scroller;
    [scroller addSubview:self.hypnosisView];
    scroller.delegate = self;
    scroller.contentSize = self.hypnosisView.bounds.size;
    scroller.minimumZoomScale=0.5;
    scroller.maximumZoomScale=6.0;
    self.view = scroller;
}


- (void) viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewLoaded");
}

- (BOOL) textFieldShouldReturn: (UITextField *)textField{
    NSLog(@"%@", textField.text);
    [self drawHypnosisMessages:textField.text];
    [textField resignFirstResponder];
    return true;
}

- (void) drawHypnosisMessages: (NSString *)message{
    
    for (UIView *view in self.view.subviews) {
        if(![view isKindOfClass:[UITextField class]]){
            [view removeFromSuperview];
        }
        
    }
    
    for(int i = 0; i < 20; i++){
        UILabel *hypnosisLabel = [[UILabel alloc] init];
        hypnosisLabel.text = message;
        hypnosisLabel.backgroundColor = [UIColor clearColor];
        hypnosisLabel.textColor = [UIColor whiteColor];
        [hypnosisLabel sizeToFit];
        int width = self.view.bounds.size.width - hypnosisLabel.bounds.size.width;
        int x = arc4random() % width;
        
        int height = self.view.bounds.size.height - hypnosisLabel.bounds.size.height;
        int y = arc4random() % height;
        
        CGRect labelFrame = hypnosisLabel.frame;
        labelFrame.origin.x = x;
        labelFrame.origin.y = y;
        hypnosisLabel.frame = labelFrame;
        
        [self.view addSubview:hypnosisLabel];
    }
    
    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.hypnosisView;
}

@end
