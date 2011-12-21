//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Nathan Chan on 12/20/11.
//  Copyright (c) 2011 UC Berkeley. All rights reserved.
//

#import "ChecklistsViewController.h"

@implementation ChecklistsViewController {
    NSString *row0text;
    NSString *row1text;
    NSString *row2text;
    NSString *row3text;
    NSString *row4text;
    BOOL row0checked;
    BOOL row1checked;
    BOOL row2checked;
    BOOL row3checked;
    BOOL row4checked;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    row0text = @"Walk the dog";
    row1text = @"Brush teeth";
    row2text = @"Learn iOS development";
    row3text = @"Soccer practice";
    row4text = @"Eat ice cream";
    row1checked = YES;
    row2checked = YES;
    row4checked = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    BOOL isChecked = NO;
    if (indexPath.row == 0) {
        isChecked = row0checked;
    } else if (indexPath.row == 1) {
        isChecked = row1checked;
    } else if (indexPath.row == 2) {
        isChecked = row2checked;
    } else if (indexPath.row == 3) {
        isChecked = row3checked;
    } else if (indexPath.row == 4) {
        isChecked = row4checked;
    }
    
    if (isChecked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    
    if (indexPath.row == 0) {
        label.text = row0text;
    } else if (indexPath.row == 1) {
        label.text = row1text;
    } else if (indexPath.row == 2) {
        label.text = row2text;
    } else if (indexPath.row == 3) {
        label.text = row3text;
    } else if (indexPath.row == 4) {
        label.text = row4text;
    }
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    BOOL isChecked = NO;
    if (indexPath.row == 0) {
        row0checked = !row0checked;
    } else if (indexPath.row == 1) {
        row1checked = !row1checked;
    } else if (indexPath.row == 2) {
        row2checked = !row2checked;
    } else if (indexPath.row == 3) {
        row3checked = !row3checked;
    } else if (indexPath.row == 4) {
        row4checked = !row4checked;
    }
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
