//
//  Util.h
//  Unity-iPhone
//
//  Created by Ben MacKinnon on 20/11/2018.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Util : NSObject

NSString* CreateNSString (const char* string);
char* MakeStringCopy (const char* string);
const char* GetSettingsURL ();
void OpenSettings ();

@end

NS_ASSUME_NONNULL_END
