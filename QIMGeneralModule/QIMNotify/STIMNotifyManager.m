//
//  STIMNotifyManager.m
//  qunarChatIphone
//
//  Created by 李露 on 2018/2/26.
//

#import "STIMNotifyManager.h"

@implementation STIMNotifyManager

static STIMNotifyManager *_notifyManager = nil;

+ (instancetype)shareNotifyManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _notifyManager = [[STIMNotifyManager alloc] init];
    });
    return _notifyManager;
}

- (void)showGlobalNotifyWithMessage:(NSDictionary *)message {
    if (message) {
//        STIMNotifyView *notifyView = [STIMNotifyView sharedNotifyViewWithMessage:message];
        if (self.notifyManagerGlobalDelegate && [self.notifyManagerGlobalDelegate respondsToSelector:@selector(showGloablNotifyWithView:)]) {
//            [self.notifyManagerGlobalDelegate showGloablNotifyWithView:message];
        }
    }
}

- (void)showChatNotifyWithMessage:(NSDictionary *)message {
    if (message) {
//        STIMNotifyView *notifyView = [STIMNotifyView sharedNotifyViewWithMessage:message];
        if (self.notifyManagerSpecifiedDelegate && [self.notifyManagerSpecifiedDelegate respondsToSelector:@selector(showChatNotifyWithView:WithMessage:)]) {
//            [self.notifyManagerSpecifiedDelegate showChatNotifyWithView:notifyView WithMessage:message];
        }
    }
}

@end
