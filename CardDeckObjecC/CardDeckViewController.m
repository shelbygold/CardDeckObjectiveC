//
//  CardDeckViewController.m
//  CardDeckObjecC
//
//  Created by shelby gold on 3/26/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

#import "CardDeckViewController.h"
#import "SWGCard.h"
#import "SWGCardController.h"

@interface CardDeckViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

@property (weak, nonatomic) IBOutlet UILabel *cardNameLabel;






@end

@implementation CardDeckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)drawCardButtonTapped:(UIButton *)sender {
    [SWGCardController fetchCardWhenClicked:1 completion:^(SWGCard * _Nullable card) {
        NSLog([card suit]);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.cardNameLabel.text = card.suit;
        });
        
    
        [SWGCardController image: [card image] completion:^(UIImage * _Nullable image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.cardImageView.image = image;
            });
            
        }];
    }];
    
}

@end
