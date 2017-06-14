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

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray *photos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.photos = @[
                    [[PhotoObject alloc] initWithImage:[UIImage imageNamed:@"IMG_3004"] subject:@"General" location:@"Vancouver"]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    
    PhotoObject *imageObject = self.photos[indexPath.row];
    
    cell.photoImageView.image = imageObject.photo;
    
    return cell;
}



@end
