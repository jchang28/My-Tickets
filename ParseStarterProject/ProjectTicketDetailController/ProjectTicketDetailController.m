//
//  ProjectTicketDetailController.m
//  My Tickets
//
//  Created by Jeff Chang on 1/7/15.
//
//

#import "ProjectTicketDetailController.h"
#import "TicketModel.h"

@interface ProjectTicketDetailController ()

@end

@implementation ProjectTicketDetailController

- (instancetype)initWithTicketModel:(PFObject *)parseTicket {
    
    NSArray *interestedFields = [NSArray arrayWithObjects:MTParseTicketNameKey, MTParseTicketDescriptionKey, MTParseTicketOwnerKey, MTParseTicketCreatorKey, nil];
    
    self = [super initWithParseModel:parseTicket
                    interestedFields:interestedFields];
    
    if(self) {
        //Additional initializaitons.
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
