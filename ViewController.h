//
//  ViewController.h
//  adress
//
//  Created by Paweł Wróblewski on 01.09.16.
//  Copyright © 2016 Comarch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *personImage;
@property (weak, nonatomic) IBOutlet UILabel *personName;
@property (weak, nonatomic) IBOutlet UILabel *emailId;
@property (weak, nonatomic) IBOutlet UILabel *phoneNo;

- (IBAction)pickContact:(id)sender;

@end

