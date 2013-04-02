//
//  Controller.m
//  CostOfDelay
//
//  Created by Rob Randell on 29/03/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller

- (void) awakeFromNib {
	
	[amount becomeFirstResponder];
	
}

- (IBAction) calculate {
	
	[amount resignFirstResponder];
	[years resignFirstResponder];
	[months resignFirstResponder];
	
	//Inputs
	NSString *amountText = amount.text;
	NSString *yearText = years.text;
	NSString *monthsText = months.text;
	
	float amountValue = [amountText intValue];
	float yearsValue = [yearText intValue];
	float monthsValue = [monthsText intValue];
	
	//Validation on Month & Year inputs 
	if (yearsValue < 5) {
		UIAlertView *Miscalculation = [[UIAlertView alloc] initWithTitle: @"Calculation Error" message: @"Minimum term is 5 years" delegate:self cancelButtonTitle: @"OK" otherButtonTitles: nil];
		
		[Miscalculation show];
		[Miscalculation release];
		
	} else if (monthsValue >= 12) {
		UIAlertView *MiscalculationOnMonths = [[UIAlertView alloc] initWithTitle:@"Calculation Error" message:@"Maximum of 11 months, if no months required enter 0" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		
		[MiscalculationOnMonths show];
		[MiscalculationOnMonths release];
	}
	
	//Static values
	double i_delay = 0.07;
	double v_delay = 1 / (1 + i_delay);
	double year = yearsValue;
	double year1 = year / 1;
	double month = monthsValue;
	double month1 = (float) month / 12;
	double time = year1 + month1;
	double n_delay = time;
	double d_delay1 = (float) 1 / 12;
	double d_delay2 = pow(v_delay, d_delay1);
	double d_delay3 = (float) 1 - d_delay2;
	double d_delay = 12 * d_delay3;
	double need = amountValue;
	//double targetyear = 2012 + year1;
	
	//Sub Calculations
	double a1 = 1 + i_delay;
	double a2 = pow(a1, n_delay);
	double a3 = need * d_delay / 12 / a2;
	double a4 = pow(v_delay, n_delay);
	double a5 = (float) 1 - a4;
	double a6 = a3/a5;
	
	//In 1 year calculation
	double b1 = n_delay - 1;
	double b2 = pow(a1, b1);
	double o7 = d_delay / 12 / b2;
	double b3 = need * o7;
	double b4 = pow(v_delay, b1);
	double b5 = 1 - b4;
	double b6 = b3/b5;
	
	//By 1 year calculation
	double c1 = b6 - a6;
	
	//In 5 years calculation
	double d1 = n_delay - 5;
	double d2 = pow(a1, d1);
	double p7 = d_delay / 12 / d2;
	double d3 = need * p7;
	double d4 = pow(v_delay, d1);
	double d5 = 1 - d4;
	double d6 = d3/d5; 
	
	//By 5 years calculation
	double e1 = d6 - a6;
	
	//Now Lump Sum calculation
	double aa1 = pow(a1, n_delay);
	double aa2 = need/aa1;
	
	//In 1 year lump sum calculation
	double bb1 = n_delay - 1;
	double bb2 = pow(a1, bb1);
	double bb3 = need/bb2;
	
	//By 1 year lump sum calculation
	double cc1 = bb3 - aa2;
	
	//In 5 years lump sum calculation
	double dd1 = n_delay - 5;
	double dd2 = pow(a1, dd1);
	double dd3 = need/dd2;
	
	//By 5 years lump sum calculation
	double ee1 = dd3 - aa2;
	
	//Other monthly variables
	double f1 = round(c1);
	double f3 = round(e1);
	
	//Other yearly variables
	double g1 = round(cc1);
	double g3 = round(ee1);

	
	//Monthly Outputs 
	float amountNowValue = round(a6);
	amountnow.text = [NSString stringWithFormat:@"%.0f", amountNowValue];
	
	float amountOneYearValue = round(b6);
	amountoneyear.text = [NSString stringWithFormat:@"%.0f", amountOneYearValue];
	
	float amountOneYearAddValue = round(f1);
	amountoneyearadd.text = [NSString stringWithFormat:@"%.0f", amountOneYearAddValue];
	
	float amountFiveYearsValue = round(d6);
	amountfiveyears.text = [NSString stringWithFormat:@"%.0f", amountFiveYearsValue];
	
	float amountFiveYearsAddValues = round(f3);
	amountfiveyearsadd.text = [NSString stringWithFormat:@"%.0f", amountFiveYearsAddValues];
		
	//Yearly Outputs
	float amountLumpNow = round(aa2);
	amountlumpnow.text = [NSString stringWithFormat:@"%.0f", amountLumpNow];
	
	float amountOneYearLump = round(bb3);
	amountoneyearlump.text = [NSString stringWithFormat:@"%.0f", amountOneYearLump];
	
	float amountOneYearLumpAdd = round(g1);
	amountoneyearlumpadd.text = [NSString stringWithFormat:@"%.0f", amountOneYearLumpAdd];
	
	float amountFiveYearLump = round(dd3);
	amountfiveyearslump.text = [NSString stringWithFormat:@"%.0f", amountFiveYearLump];
	
	float amountFiveYearsLumpAdd = round(g3);
	amountfiveyearslumpadd.text = [NSString stringWithFormat:@"%.0f", amountFiveYearsLumpAdd];

	
	//Console Log
	NSLog(@"i_delay = %.02f", i_delay);
	NSLog(@"v_delay = %.02f", v_delay);
	NSLog(@"year = %.0f", year);
	NSLog(@"year1 = %.0f", year1);
	NSLog(@"month = %.0f", month);
	NSLog(@"month1 = %.02f", month1);
	NSLog(@"time = %.02f", time);
	NSLog(@"n_delay = %.04f", n_delay);
	NSLog(@"d_delay1 = %.04f", d_delay1);
	NSLog(@"d_delay2 = %.04f", d_delay2);
	NSLog(@"d_delay3 = %.04f", d_delay3);
	NSLog(@"d_delay = %.04f", d_delay);
	NSLog(@"need = %.02f", need);
	//NSLog(@"targetyear = %.0f", targetyear);

	//Sub calculations
	NSLog(@"a1 = %.04f", a1);
	NSLog(@"a2 = %.04f", a2);
	NSLog(@"a3 = %.04f", a3);
	NSLog(@"a4 = %.04f", a4);
	NSLog(@"a5 = %.04f", a5);
	NSLog(@"a6 = %.04f", a6);
	
	NSLog(@"b1 = %.04f", b1);
	NSLog(@"b2 = %.04f", b2);
	NSLog(@"b3 = %.04f", b3);
	NSLog(@"b4 = %.04f", b4);
	NSLog(@"b5 = %.04f", b5);
	NSLog(@"b6 = %.04f", b6);
	
	NSLog(@"c1 = %.04f", c1);
	
	NSLog(@"d1 = %.04f", d1);
	NSLog(@"d2 = %.04f", d2);
	NSLog(@"d3 = %.04f", d3);
	NSLog(@"d4 = %.04f", d4);
	NSLog(@"d5 = %.04f", d5);
	NSLog(@"d6 = %.04f", d6);

	NSLog(@"e1 = %.04f", e1);

	NSLog(@"aa1 = %.04f", aa1);
	NSLog(@"aa2 = %.04f", aa2);

	NSLog(@"bb1 = %.04f", bb1);
	NSLog(@"bb2 = %.04f", bb2);
	NSLog(@"bb3 = %.04f", bb3);

	NSLog(@"cc1 = %.04f", cc1);

	NSLog(@"dd1 = %.04f", dd1);
	NSLog(@"dd2 = %.04f", dd2);
	NSLog(@"dd3 = %.04f", dd3);
	
	NSLog(@"ee1 = %.04f", ee1);

	NSLog(@"f1 = %.04f", f1);
	NSLog(@"f3 = %.04f", f3);

	NSLog(@"g1 = %.04f", g1);
	NSLog(@"g3 = %.04f", g3);

	//NSLog(@"m7 = %.04f", m7);
	NSLog(@"o7 = %.04f", o7);
	NSLog(@"p7 = %.04f", p7);
}

@end

