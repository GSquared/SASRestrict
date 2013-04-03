
@interface SBApplicationIcon
{
}
- (id)displayName;
@end


@interface SBUIController
{

}
+ (id)sharedInstance;
- (void)activateApplicationAnimated:(id)arg1;
- (void)activateApplicationFromSwitcher:(id)arg1;
@end

@interface SBApplication
{
}

@end

@interface SBApplicationController
{
}
- (id)applicationWithDisplayIdentifier:(id)arg1;
@end

@interface SBNewsstand
{
}
+ (void)openNewsstandAppStore;
@end

/*
@interface UIApplication
{
}
- (BOOL)openURL:arg1;
@end
*/


@interface ASApplicationPageHeaderView
{
}
- (void)_offerButtonAction:(id)arg1;

@end

@interface ASApplicationPageView
{
}
- (void)_giftButtonAction:(id)arg1;
@end

@interface ASClientApplicationController
{
}
- (void)becomeActive;
- (id)_startDownloadManager;
@end

@interface ASApplicationPageInfoListingView
{
}

@end

@interface SBAppToAppTransitionController
{
}
- (id)initWithActivatingApp:(id)arg1 deactivatingApp:(id)arg2;
@end

%hook SBAppToAppTransitionController

- (id)initWithActivatingApp:(id)arg1 deactivatingApp:(id)arg2 {


    if (arg1 == [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.apple.AppStore"]) {
        //SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.apple.mobilesafari"];
        [[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher:arg2];
    }

    return (%orig);
}


%end

/*
%hook UIApplication

- (BOOL)openURL:arg1 {

    NSString *myURLString = arg1;

    if ([myURLString hasPrefix:@"imts"] || [myURLString hasPrefix:@"https://itunes.apple.com"]) {
        return NO;
    } 
    else {
        return (%orig);
    }
}

%end
*/

%hook SBNewsstand

+ (void)openNewsstandAppStore {
        NSString *newsstandAppButton = @"The App Store is Restricted.";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:newsstandAppButton delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 10;
        [alert show];
        [alert release];
}

%end

%hook SBApplicationIcon

-(void)launch
{
    NSString *app= [self displayName];
    
    if ([app isEqualToString:@"Settings"]) {

        NSString *messageS = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertS = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageS delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertS.tag = 1;
        [alertS setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertS show];
        [alertS release];

    }
    else if ([app isEqualToString:@"Cydia"]) {
        NSString *messageC = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertC = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageC delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertC.tag = 2;
        [alertC setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertC show];
        [alertC release];

    }
    else if ([app isEqualToString:@"Messages"]) {
        NSString *messageIM = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertIM = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageIM delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertIM.tag = 3;
        [alertIM setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertIM show];
        [alertIM release];
    }
    else if ([app isEqualToString:@"Mail"]) {
        NSString *messageM = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertM = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageM delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertM.tag = 4;
        [alertM setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertM show];
        [alertM release];
    }
    else if ([app isEqualToString:@"App Store"]) {
        NSString *messageA = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertA = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageA delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertA.tag = 5;
        [alertA setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertA show];
        [alertA release];
    }
    else if ([app isEqualToString:@"Camera"]) {
        NSString *messageCam = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertCam = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageCam delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertCam.tag = 6;
        [alertCam setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertCam show];
        [alertCam release];
    }
    else if ([app isEqualToString:@"Photo Booth"]) {
        NSString *messagePB = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertPB = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messagePB delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertPB.tag = 7;
        [alertPB setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertPB show];
        [alertPB release];
    }
    else
    {
        %orig;
    }

}

- (void)launchFromViewSwitcher
{
    NSString *app= [self displayName];
    
    if ([app isEqualToString:@"Settings"]) {

        NSString *messageS = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertS = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageS delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertS.tag = 1;
        [alertS setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertS show];
        [alertS release];

    }
    else if ([app isEqualToString:@"Cydia"]) {
        NSString *messageC = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertC = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageC delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertC.tag = 2;
        [alertC setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertC show];
        [alertC release];

    }
    else if ([app isEqualToString:@"Messages"]) {
        NSString *messageIM = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertIM = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageIM delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertIM.tag = 3;
        [alertIM setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertIM show];
        [alertIM release];
    }
    else if ([app isEqualToString:@"Mail"]) {
        NSString *messageM = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertM = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageM delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertM.tag = 4;
        [alertM setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertM show];
        [alertM release];
    }
    else if ([app isEqualToString:@"App Store"]) {
        NSString *messageA = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertA = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageA delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertA.tag = 5;
        [alertA setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertA show];
        [alertA release];
    }
    else if ([app isEqualToString:@"Camera"]) {
        NSString *messageCam = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertCam = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messageCam delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertCam.tag = 6;
        [alertCam setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertCam show];
        [alertCam release];
    }
    else if ([app isEqualToString:@"Photo Booth"]) {
        NSString *messagePB = [NSString stringWithFormat:@"The Application %@ has been restricted.", app];
        UIAlertView *alertPB = [[UIAlertView alloc] initWithTitle:@"SAS Security" message:messagePB delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Authenticate", nil];
        alertPB.tag = 7;
        [alertPB setAlertViewStyle:UIAlertViewStyleSecureTextInput];
        [alertPB show];
        [alertPB release];
    }
    else
    {
        %orig;
    }
}


%new

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
    
        if (buttonIndex == 0)
        {
            NSLog(@"OK Pressed");
        }
        else
        {
            UITextField *password = [alertView textFieldAtIndex:0];
            NSLog(@"Auth Pressed");
            NSLog(@"Password: %@", password.text);
            if ([password.text isEqualToString:@"PASSWORDHERE"]) {
                SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.apple.Preferences"];
                [[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher:app];
            }
        }
    }
    else if (alertView.tag == 2) {
        if (buttonIndex == 0)
        {
            NSLog(@"OK Pressed");
        }
        else
        {
            UITextField *password = [alertView textFieldAtIndex:0];
            NSLog(@"Auth Pressed");
            NSLog(@"Password: %@", password.text);
            if ([password.text isEqualToString:@"PASSWORDHERE"]) {
                SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.saurik.Cydia"];
                [[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher:app];
            }
        }
    }
    else if (alertView.tag == 3) {
        if (buttonIndex == 0)
        {
            NSLog(@"OK Pressed");
        }
        else
        {
            UITextField *password = [alertView textFieldAtIndex:0];
            NSLog(@"Auth Pressed");
            NSLog(@"Password: %@", password.text);
            if ([password.text isEqualToString:@"PASSWORDHERE"]) {
                SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.apple.MobileSMS"];
                [[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher:app];
            }
        }
    }
    else if (alertView.tag == 4) {
        if (buttonIndex == 0)
        {
            NSLog(@"OK Pressed");
        }
        else
        {
            UITextField *password = [alertView textFieldAtIndex:0];
            NSLog(@"Auth Pressed");
            NSLog(@"Password: %@", password.text);
            if ([password.text isEqualToString:@"PASSWORDHERE"]) {
                SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.apple.mobilemail"];
                [[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher:app];
            }
        }
    }
    else if (alertView.tag == 5) {
        if (buttonIndex == 0)
        {
            NSLog(@"OK Pressed");
        }
        else
        {
            UITextField *password = [alertView textFieldAtIndex:0];
            NSLog(@"Auth Pressed");
            NSLog(@"Password: %@", password.text);
            if ([password.text isEqualToString:@"PASSWORDHERE"]) {
                SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.apple.AppStore"];
                [[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher:app];
            }
        }
    }
    else if (alertView.tag == 6) {
        if (buttonIndex == 0)
        {
            NSLog(@"OK Pressed");
        }
        else
        {
            UITextField *password = [alertView textFieldAtIndex:0];
            NSLog(@"Auth Pressed");
            NSLog(@"Password: %@", password.text);
            if ([password.text isEqualToString:@"PASSWORDHERE"]) {
                SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.apple.camera"];
                [[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher:app];
            }
        }
    }
    else if (alertView.tag == 7) {
        if (buttonIndex == 0)
        {
            NSLog(@"OK Pressed");
        }
        else
        {
            UITextField *password = [alertView textFieldAtIndex:0];
            NSLog(@"Auth Pressed");
            NSLog(@"Password: %@", password.text);
            if ([password.text isEqualToString:@"PASSWORDHERE"]) {
                SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] applicationWithDisplayIdentifier:@"com.apple.Photo-Booth"];
                [[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher:app];
            }
        }
    }
  
}

%end