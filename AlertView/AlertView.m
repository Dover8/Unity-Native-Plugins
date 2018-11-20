//
//  BeithPlugin.m
//
//
//  Created by Ben MacKinnon on 16/06/2017.
//  Shows UIAlertViewController called from Unity
//

#import <Foundation/Foundation.h>
#import "Util.h"

void _ShowAlert(const char* title, const char* message)
{
    NSString *stringTitle = CreateNSString(title);
    NSString *stringMessage = CreateNSString(message);
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle: stringTitle
                                                                   message: stringMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    UIViewController *controller = UnityGetGLViewController();
    [controller presentViewController:alert animated:YES completion:nil];
}



