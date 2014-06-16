//
//  PostViewController.m
//  facebookpost
//
//  Created by Kristina Varshavskaya on 6/15/14.
//  Copyright (c) 2014 kristinatastic. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet UIView *postcontainer;

@end

@implementation PostViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Post";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.23137 green:0.34902 blue:0.59608 alpha:1];
    
    self.postcontainer.layer.borderColor = [UIColor grayColor].CGColor;
    self.postcontainer.layer.borderWidth = 1;
    self.postcontainer.layer.cornerRadius = 3;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
