//
//  UnityPDFViewController.m
//  Unity-iPhone
//
//  Created by Ben MacKinnon on 19/11/2018.
//

#import "UnityPDFViewController.h"

@interface UnityPDFViewController ()

@end

@implementation UnityPDFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:self.pdfTitle withExtension:@"pdf" subdirectory:@"Data/Raw"];
    
    PDFDocument *document = [[PDFDocument alloc] initWithURL:pdfURL];
    
    self.pdfView.document = document;
    
    // Options
    /*
    self.pdfView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    self.pdfView.autoScales = YES ;
    self.pdfView.displayDirection = kPDFDisplayDirectionHorizontal;
    self.pdfView.displayMode = kPDFDisplaySinglePageContinuous;
    self.pdfView.displaysRTL = YES ;
    [self.pdfView setDisplaysPageBreaks:YES];
    [self.pdfView setDisplayBox:kPDFDisplayBoxTrimBox];
    [self.pdfView zoomIn:self];
     */
}

- (IBAction)dismissViewController:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
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
