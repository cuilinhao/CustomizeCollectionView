//
//  ViewController.m
//  PF_Custome_CollectionView
//
//  Created by 天下林子 on 2019/6/21.
//  Copyright © 2019 linhaoCui. All rights reserved.
//

#import "ViewController.h"
#import "PFCollectionView.h"


@interface ViewController ()

@end

#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width


@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _initUI];
}

- (void)_initUI
{
    PFCollectionView *collectionView = [[PFCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT)];
    
    [self.view addSubview:collectionView];
}


@end
