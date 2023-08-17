#import "WebviewIosCacheClear.h"
#import "webkit/wkwebsitedatastore.h"

@implementation WebviewIosCacheClear

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(clearWebViewIOSCache:(rctpromiseresolveblock)resolve reject:(rctpromiserejectblock)reject){
  
  nsset *websitedatatypes = [wkwebsitedatastore allwebsitedatatypes];
  nsdate *datefrom = [nsdate datewithtimeintervalsince1970:0];
  dispatch_async(dispatch_get_main_queue(), ^{
    [[wkwebsitedatastore defaultdatastore] removedataoftypes:websitedatatypes modifiedsince:datefrom completionhandler:^{
      return resolve(@"ok");
    }];
  });
}

@end