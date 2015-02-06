//
//  QuizViewController.m
//  Quiz
//
//  Created by Suparn Gupta on 2/3/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;
@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@end

@implementation QuizViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil
                          bundle:(NSBundle *)nibBundleOrNil{
    
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        
        self.questions = @[@"From what uis cognac mage?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                          @"14",
                         @"Montplier"];
    }
    return self;
}
- (IBAction)showQuestion:(id)sender{
    self.currentQuestionIndex++;
    
    // Am I past the last question
    if(self.currentQuestionIndex == [self.questions count]){
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
