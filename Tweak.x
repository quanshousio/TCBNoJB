@interface CDVPluginResult : NSObject
+ (id)resultWithStatus:(int)arg1;
@end

@interface CDVInvokedUrlCommand : NSObject {
    NSString* _callbackId;
}
@property (nonatomic, readonly) NSString* callbackId; // @synthesize callbackId=_callbackId;
@end

@protocol CDVCommandDelegate <NSObject>
- (void)sendPluginResult:(CDVPluginResult *)arg1 callbackId:(NSString *)arg2;
@end

@interface CDVPlugin : NSObject {
    id <CDVCommandDelegate> commandDelegate;
}
@property(nonatomic) __weak id <CDVCommandDelegate> commandDelegate; // @synthesize commandDelegate;
@end

@interface FISPlugin : CDVPlugin
- (void)isJailbreak:(CDVInvokedUrlCommand*)command;
@end

@interface IRoot : CDVPlugin
- (_Bool)jailbroken;
@end

%hook FISPlugin
- (void)isJailbreak:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = [%c(CDVPluginResult) resultWithStatus:1];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
%end

%hook IRoot
- (_Bool)jailbroken {
    return false;
}
%end
