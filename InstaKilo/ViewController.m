//
//  ViewController.m
//  InstaKilo
//
//  Created by Elle Ti on 2017-06-14.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"
#import "PhotoObject.h"
#import "MyPhotoCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSDictionary *photosBySubject;
@property (nonatomic) NSDictionary *photosByLocation;
@property (nonatomic) BOOL sortBySubject;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PhotoObject *krav = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3004.jpg"] subject:@"General" location:@"Vancouver"];
    PhotoObject *flower = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3014.jpg"] subject:@"General" location:@"San Francisco"];
    PhotoObject *pineappleBuns = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3053.jpg"] subject:@"Food" location:@"San Francisco"];
    PhotoObject *taiChi = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3057.jpg"] subject:@"General" location:@"San Francisco"];
    PhotoObject *pigs = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3085.jpg"] subject:@"Food" location:@"San Francisco"];
    PhotoObject *dessert = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3121.jpg"] subject:@"Food" location:@"San Francisco"];
    PhotoObject *legoBatman = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3923.jpg"] subject:@"General" location:@"San Francisco"];
    PhotoObject *iceCream = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3954.jpg"] subject:@"Food" location:@"Calgary"];
    PhotoObject *macarons = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_4012.jpg"] subject:@"Food" location:@"Vancouver"];
    PhotoObject *weddingSeal = [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_4014.jpg"] subject:@"General" location:@"Vancouver"];
    
    self.photosBySubject = @{@"General":@[krav, flower, taiChi, legoBatman, weddingSeal],
                             @"Food":@[pineappleBuns, pigs, dessert, iceCream, macarons]};
    
    self.sortBySubject = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.photosBySubject.allKeys.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray * myPhotoSections = self.photosBySubject.allKeys;
    NSString *thisKey = myPhotoSections[section];
    NSArray * myObjects = [self.photosBySubject objectForKey:thisKey];
    return myObjects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];

    NSArray * myImageSections = self.photosBySubject.allKeys;
    NSString *thisKey = myImageSections[indexPath.section];
    NSArray *myImageObjects = [self.photosBySubject objectForKey:thisKey];
    PhotoObject * thisPhoto = [myImageObjects objectAtIndex:indexPath.row];
    cell.photoImageView.image = thisPhoto.photo;
    
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        NSArray *subjects = [self.photosBySubject allKeys];
        NSString *subject = [subjects objectAtIndex: indexPath.section];
        headerView.headerCollectionLabel.text = [NSString stringWithFormat:@"%@", subject];

        return headerView;
    }
    return nil;
}


@end
