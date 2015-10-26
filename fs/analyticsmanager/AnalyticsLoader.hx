package fs.analyticsmanager;

import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.events.Event;
import flash.events.IOErrorEvent;

/**
 * ...
 * @author Fiery Squirrel
 */
class AnalyticsLoader extends URLLoader
{
	private var onComplete : Dynamic -> Void;
	private var onIOError : Dynamic -> Void;
	
	public function new(?request:URLRequest,?onComplete : Dynamic -> Void,onIOError : Dynamic -> Void) 
	{
		super(request);
		
		this.onComplete = onComplete;
		this.onIOError = onIOError;
		
		if(onComplete != null)
			addEventListener(Event.COMPLETE, onComplete);
			
		if(onIOError != null)
			addEventListener(IOErrorEvent.IO_ERROR, onIOError);
	}
	
	public function Clean() : Void
	{
		if (onComplete != null)
		{
			if (hasEventListener(Event.COMPLETE))
				removeEventListener(Event.COMPLETE,onComplete);
		}
		
		if (onIOError != null)
		{
			if (hasEventListener(IOErrorEvent.IO_ERROR))
				removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
		}
	}
}