//
//  WizardWatchTableViewController.m
//  WizardWatch
//
//  Created by Marco Almeida on 11/30/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "WizardWatchTableViewController.h"
#import "Wizard.h"

@interface WizardWatchTableViewController ()
@property (nonatomic, strong) NSMutableArray *wizardNames;
@end

@implementation WizardWatchTableViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self loadWizards];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void) loadWizards

{
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"wizards" ofType:@"json"];
    
    NSArray *wizardsJSON =[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error: nil];
   
    self.wizardNames = [[NSMutableArray alloc] init];
    for (NSDictionary *aWizardDictionary in wizardsJSON)
        
    {
        Wizard *aWizard = [Wizard aWizardWithDictionary:aWizardDictionary];
        [self.wizardNames addObject:aWizard];
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wizardNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AWizardCell" forIndexPath:indexPath];
    
    
    Wizard *aWizard = self.wizardNames[indexPath.row];
    cell.textLabel.text = aWizard.name;
    cell.detailTextLabel.text = aWizard.house;

    return cell;
}



@end
