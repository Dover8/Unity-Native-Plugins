//
//  NativePDF.m
//
//
//  Created by Ben MacKinnon on 16/11/2018.
//

#import <Foundation/Foundation.h>
#import <PDFKit/PDFKit.h>
#import "UnityPDFViewController.h"
#import "Util.h"


void _OpenPDF(const char* pdfName)
{
    NSString *docTitle = CreateNSString(pdfName);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UnityPDFViewController *pdfVC = [storyboard instantiateViewControllerWithIdentifier:@"PDFVC"];
    
    pdfVC.pdfTitle = docTitle;
    
    //get the Unity View Controller
    UIViewController *controller = UnityGetGLViewController();
    //and present over it
    [controller presentViewController:pdfVC animated:YES completion:nil];
}

