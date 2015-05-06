//
//  GenericInfoController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 4/22/15.
//
//

#import "GenericInfoController.h"

@interface GenericInfoController ()

@end

@implementation GenericInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self _setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark Private
- (void)_setup {
    self.infoTextView.text = self.infoText;
}

@end
