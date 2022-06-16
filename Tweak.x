// Enable background play
%hook YTIPlayabilityStatus

- (BOOL)isPlayableInBackground { return YES; }

%end


// Block all ads
%hook YTDataUtils

+ (id)spamSignalsDictionary { return nil; }

%end

// Block all ads
%hook YTAdsInnerTubeContextDecorator

- (void)decorateContext:(id)context {}

%end

// Block video ads
%hook YTAdsPlaybackService

-(void) setAdsPlaybackSurface:(id) arg1
{
	arg1 = nil;

	%orig;
}
%end

// Override miniplayer pause for kids video
%hook YTIMiniplayerRenderer
-(void) setPlaybackMode:(int) arg1
{
	arg1 = 2;   // 0 - Unknown, 2 - Normal Playback, 4 - Pause Only
	%orig;
}

-(void) setHasMinimizedEndpoint: (BOOL) arg1
{
	arg1 = NO;
	%orig;
}

-(int) playbackMode
{
	return 2;
}
-(BOOL) hasMinimizedEndpoint
{	
	return NO;
}
%end
