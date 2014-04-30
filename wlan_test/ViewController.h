//
//  ViewController.h
//  wlan_test
//
//  Created by Wolfgang Haupt on 24.04.14.
//  Copyright (c) 2014 at-visions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *disconnect;

- (IBAction)touched:(id)sender;

@end
