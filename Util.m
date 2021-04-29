//
//  Util.m
//  Unity-iPhone
//
//  Created by Ben MacKinnon on 20/11/2018.
//

#import "Util.h"

@implementation Util

// Converts C style string to NSString
NSString* CreateNSString (const char* string)
{
    if (string)
        return [NSString stringWithUTF8String: string];
    else
        return [NSString stringWithUTF8String: ""];
}

// Helper method to create C string copy
char* MakeStringCopy (const char* string)
{
    if (string == NULL)
        return NULL;
    
    char* res = (char*)malloc(strlen(string) + 1);
    strcpy(res, string);
    return res;
}

const char* GetSettingsURL ()
{
    NSURL* url = [NSURL URLWithString: UIApplicationOpenSettingsURLString];
    return MakeStringCopy(url.absoluteString);
}

void OpenSettings ()
{
    NSURL* url = [NSURL URLWithString: UIApplicationOpenSettingsURLString];
    [[UIApplication sharedApplication] openURL: url];
}


@end
