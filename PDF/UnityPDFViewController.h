//
//  UnityPDFViewController.h
//  Unity-iPhone
//
//  Created by Ben MacKinnon on 19/11/2018.
//

#import <UIKit/UIKit.h>
#import <PDFKit/PDFKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnityPDFViewController : UIViewController

@property (nonatomic, strong) IBOutlet PDFView *pdfView;
@property (nonatomic, strong) IBOutlet UIButton *closeButton;
@property (nonatomic, weak) NSString *pdfTitle;

@end

NS_ASSUME_NONNULL_END
