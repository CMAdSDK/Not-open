//
//  ViewController.m
//  CheetahMobileAdsDemo
//
//  Created by 李 柯良 on 16/4/12.
//  Copyright © 2016年 cheetahmobile. All rights reserved.
//

#import "ViewController.h"
#import "AdTypeCollectionViewCell.h"
#import "AdTypeModel.h"

#import "NativeAdDetailsViewController.h"
#import "InterstitalAdViewController.h"
#import "BannerAdViewController.h"
#import "SplashAdViewController.h"

#import "UIColor+AppDefault.h"

static const CGFloat kDefaultCellMargin = 8.f;

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSArray *adTypes;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupDataSource];
}

- (void)setupView
{
    self.view.backgroundColor = [UIColor defaultLightGrayColor];
    self.title = @"CheetahMobileAdsDemo";
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([AdTypeCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([AdTypeCollectionViewCell class])];
    [self.view addSubview:self.collectionView];
}

- (void)setupDataSource
{
    AdTypeModel *nativeModel = [[AdTypeModel alloc] init];
    nativeModel.imageName = @"pic_native";
    nativeModel.adTypeName = @"Native Ads";
    nativeModel.adType = kAdTypeNativeAd;
    
    AdTypeModel *interstitalModel = [[AdTypeModel alloc] init];
    interstitalModel.imageName = @"pic_inter";
    interstitalModel.adTypeName = @"Interstial";
    interstitalModel.adType = kAdTypeInterstital;
    
    AdTypeModel *bannerModel = [[AdTypeModel alloc] init];
    bannerModel.imageName = @"pic_iab";
    bannerModel.adTypeName = @"Banner";
    bannerModel.adType = kAdTypeBanner;
    
    AdTypeModel *splashModel = [[AdTypeModel alloc] init];
    splashModel.imageName = @"pic_splash";
    splashModel.adTypeName = @"Splash";
    splashModel.adType = kAdTypeSplash;
    
    AdTypeModel *videoModel = [[AdTypeModel alloc] init];
    videoModel.imageName = @"pic_video";
    videoModel.adTypeName = @"Video";
    videoModel.adType = kAdTypeVideo;
    
    self.adTypes = @[nativeModel, interstitalModel, bannerModel, splashModel, videoModel];
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  self.adTypes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AdTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([AdTypeCollectionViewCell class]) forIndexPath:indexPath];
    AdTypeModel *adTypeAdIndex = self.adTypes[indexPath.row];
    [cell configureWithAdType:adTypeAdIndex];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout implements

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kDefaultCellMargin, kDefaultCellMargin, kDefaultCellMargin, kDefaultCellMargin);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = floorf((collectionView.frame.size.width - kDefaultCellMargin * 3) / 2);
    CGFloat cellHeight = [AdTypeCollectionViewCell cellHeightForWidth:cellWidth];
    return CGSizeMake(cellWidth, cellHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kDefaultCellMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kDefaultCellMargin;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AdTypeModel *adTypeAdIndex = self.adTypes[indexPath.row];
    
    UIViewController *destinationVC;
    
    if (adTypeAdIndex.adType == kAdTypeNativeAd) {
        destinationVC = [[NativeAdDetailsViewController alloc] init];;
    }
    else if (adTypeAdIndex.adType == kAdTypeInterstital) {
        destinationVC = [[InterstitalAdViewController alloc] init];
    }
    else if (adTypeAdIndex.adType == kAdTypeBanner) {
        destinationVC = [[BannerAdViewController alloc] init];
    }
    else if (adTypeAdIndex.adType == kAdTypeSplash) {
        destinationVC = [[SplashAdViewController alloc] init];
    }
    else {
        destinationVC = [[UIViewController alloc] init];
    }
    
    destinationVC.title = adTypeAdIndex.adTypeName;
    destinationVC.view.backgroundColor = [UIColor defaultUtralLightGrayColor];
    
    [self.navigationController pushViewController:destinationVC animated:YES];
}

#pragma mark - Accessors

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.translatesAutoresizingMaskIntoConstraints = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _collectionView;
}

@end
