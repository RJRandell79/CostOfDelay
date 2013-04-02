//
//  Controller.h
//  CostOfDelay
//
//  Created by Rob Randell on 29/03/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Controller : NSObject {
	
	IBOutlet UITextField *amount;
	IBOutlet UITextField *years;
	IBOutlet UITextField *months;
	
	IBOutlet UITextField *amountnow;
	IBOutlet UITextField *amountoneyear;
	IBOutlet UITextField *amountoneyearadd;
	IBOutlet UITextField *amountfiveyears;
	IBOutlet UITextField *amountfiveyearsadd;
	
	IBOutlet UITextField *amountlumpnow;
	IBOutlet UITextField *amountoneyearlump;
	IBOutlet UITextField *amountoneyearlumpadd;
	IBOutlet UITextField *amountfiveyearslump;
	IBOutlet UITextField *amountfiveyearslumpadd;
	
	IBOutlet UIButton *calculate;

}

- (IBAction) calculate;

@end
