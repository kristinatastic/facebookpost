//
//  PostViewController.m
//  facebookpost
//
//  Created by Kristina Varshavskaya on 6/15/14.
//  Copyright (c) 2014 kristinatastic. All rights reserved.
//

#import "PostViewController.h"
#import "UIColor+Hex.h"
#import "TTTAttributedLabel.h"

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet UIView *postcontainer;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UIView *postbackground;
@property (weak, nonatomic) IBOutlet UIImageView *postimage;
@property (weak, nonatomic) IBOutlet UIView *feedbackrow;
@property (weak, nonatomic) IBOutlet UIView *commentBar;
@property (weak, nonatomic) IBOutlet UITextField *commentField;
@property (nonatomic) TTTAttributedLabel *postText;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;


@end

@implementation PostViewController

@synthesize postcontainer = _postcontainer;
@synthesize postText = _postText;

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
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0x3b5998];
    
    [self.view addSubview:_postcontainer];
    self.postcontainer.layer.cornerRadius = 3;
    self.postbackground.layer.borderColor = [UIColor colorWithHex:0xd3d6db].CGColor;
    self.postbackground.layer.borderWidth = 1;
    self.postbackground.layer.cornerRadius = 3;
    
    
    self.postText = [[TTTAttributedLabel alloc] initWithFrame:CGRectInset(self.postcontainer.bounds, 0.0f, 0.0f)];
    [self.postcontainer addSubview:_postText];
    _postText.frame = CGRectMake(10, -120, 280, self.postText.frame.size.height);
    _postText.font = [UIFont systemFontOfSize:12];
    _postText.lineBreakMode = NSLineBreakByWordWrapping;
    _postText.numberOfLines = 4;
    
    _postText.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
    //_postText.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)
    
    NSString *text = @"From collarless shirts to high-waisted pants, #Her's costume designer, Casey Storm, explains how he created his fashion looks for the future: http://bit.ly/1jV9zM8";
    [_postText setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"#Her" options:NSCaseInsensitiveSearch];
     
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:12];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            CFRelease(font);
        }
        
        return mutableAttributedString;
    }];
    
    self.postimage.layer.shadowColor = [UIColor colorWithHex:0x333333].CGColor;
    self.postimage.layer.shadowOffset = CGSizeMake(0, 0);
    self.postimage.layer.shadowOpacity = 0.3;
    self.postimage.layer.shadowRadius = 1;
    
    self.feedbackrow.layer.backgroundColor = [UIColor colorWithHex:0xfafafa].CGColor;
    self.feedbackrow.layer.borderColor = [UIColor colorWithHex:0xf2f2f2].CGColor;
    self.feedbackrow.layer.borderWidth = 1;
    
    
    
    self.commentBar.layer.backgroundColor = [UIColor colorWithHex:0xf8f8f8].CGColor;
    self.commentBar.layer.borderColor = [UIColor colorWithHex:0xe3e3e3].CGColor;
    self.commentBar.layer.borderWidth = 1;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
