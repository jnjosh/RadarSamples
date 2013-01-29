//
//  TWTViewController.m
//  CollectionViewError
//
//  Created by Josh Johnson on 1/29/13.
//  Copyright (c) 2013 twotoasters. All rights reserved.
//

#import "TWTViewController.h"

static NSString *inputCellIdentifier = @"tt.inputCell";

@interface TWTViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *confirmPasswordField;
@property (nonatomic, strong) UICollectionView *collectionView;

@end


@implementation TWTViewController {}

#pragma mark - UIViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.806 green:0.732 blue:0.574 alpha:1.000]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.emailField = [[UITextField alloc] initWithFrame:(CGRect){ 0, 0, 320, 44 }];
    [self.emailField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.emailField setTextColor:[UIColor blackColor]];
    [self.emailField setDelegate:self];
    
    self.passwordField = [[UITextField alloc] initWithFrame:(CGRect){ 0, 0, 320, 44 }];
    [self.passwordField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.passwordField setTextColor:[UIColor blackColor]];
    [self.passwordField setDelegate:self];
    
    self.confirmPasswordField = [[UITextField alloc] initWithFrame:(CGRect){ 0, 0, 320, 44 }];
    [self.confirmPasswordField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.confirmPasswordField setTextColor:[UIColor blackColor]];
    [self.confirmPasswordField setDelegate:self];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.collectionView setBackgroundColor:[UIColor redColor]];
    [self.collectionView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:inputCellIdentifier];
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.collectionView setAlwaysBounceVertical:YES];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:inputCellIdentifier forIndexPath:indexPath];
    [cell setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fields-center"]]];
    
    if (indexPath.row == 0) {
        [cell.contentView addSubview:self.emailField];
        [self.emailField setText:[NSString stringWithFormat:@"%p", cell]];
    } else if (indexPath.row == 1) {
        [cell.contentView addSubview:self.passwordField];
        [self.passwordField setText:[NSString stringWithFormat:@"%p", cell]];
    } else {
        [cell.contentView addSubview:self.confirmPasswordField];
        [self.confirmPasswordField setText:[NSString stringWithFormat:@"%p", cell]];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return (CGSize){ 320.0f, 44.0f };
}

@end
