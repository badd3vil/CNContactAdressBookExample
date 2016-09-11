//
//  ViewController.m
//  adress
//
//  Created by Paweł Wróblewski on 01.09.16.
//  Copyright © 2016 Comarch. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface ViewController  () <CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getContactDetails:(CNContact *)contactObject {
    
    NSString * fullName = [NSString stringWithFormat:@"%@ %@",contactObject.givenName,contactObject.familyName];
    [self.personName setText:fullName];
 
    
    NSString * phone = @"";
    NSString * userPHONE_NO = @"";
    for(CNLabeledValue * phonelabel in contactObject.phoneNumbers) {
        CNPhoneNumber * phoneNo = phonelabel.value;
        phone = [phoneNo stringValue];
        if (phone) {
            userPHONE_NO = phone;
        }}
    NSString * email = @"";
    NSString * userEMAIL_ID = @"";

    NSLog(@"PHONE NO :: %@",userPHONE_NO);
    
    [self.emailId setText:userEMAIL_ID];
    [self.phoneNo setText:userPHONE_NO];
    
    }


-(void)getContactDetailsPhone:(CNContactProperty *)contactProperty {

    NSString * fullName = [NSString stringWithFormat:@"%@ %@",contactProperty.contact.givenName, contactProperty.contact.familyName];
    [self.personName setText:fullName];
    
    NSString * phone = @"";
    NSString * userPHONE_NO = @"";
    
        CNPhoneNumber * phoneNo = contactProperty.value;
        phone = [phoneNo stringValue];
        if (phone) {
            userPHONE_NO = phone;
        }
    NSString * email = @"";
    NSString * userEMAIL_ID = @"";
    
    NSLog(@"PHONE NO :: %@",userPHONE_NO);
   
    [self.emailId setText:userEMAIL_ID];
    [self.phoneNo setText:userPHONE_NO];
    
}


- (IBAction)pickContact:(id)sender {
    
    CNContactPickerViewController *contactPicker = [[CNContactPickerViewController alloc] init];
    NSArray *propertyKeys = @[CNContactPhoneNumbersKey, CNContactGivenNameKey, CNContactFamilyNameKey, CNContactOrganizationNameKey];
    NSPredicate *enablePredicate = [NSPredicate predicateWithFormat:@"(phoneNumbers.@count > 0)"];
    NSPredicate *contactSelectionPredicate = [NSPredicate predicateWithFormat:@"phoneNumbers.@count == 1"];
    
    contactPicker.displayedPropertyKeys = propertyKeys;
    contactPicker.predicateForEnablingContact = enablePredicate;
    contactPicker.predicateForSelectionOfContact = contactSelectionPredicate;
    contactPicker.delegate = self;
    
    [self presentViewController:contactPicker animated:YES completion:nil];

}

- (void) contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact
{    
    [self getContactDetails:contact ];
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty
{
    [self getContactDetailsPhone:contactProperty];
}

@end
