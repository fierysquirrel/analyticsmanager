package fs.analyticsmanager;

import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLVariables;

/**
 * ...
 * @author Fiery Squirrel
 */
class AnalyticsManager
{
	/*
	 * Analytics manager instance.
	 */
	private static var instance : AnalyticsManager;
	
	private static var loaders : Array<AnalyticsLoader>;
	
	public static function InitInstance(): AnalyticsManager
	{
		if (instance == null)
			instance = new AnalyticsManager();
		
		return instance;
	}
	
	/*
	 * Creates and returns a analyrics manager instance if it's not created yet.
	 * Returns the current instance of this class if it already exists.
	 */
	public static function GetInstance(): AnalyticsManager
	{
		if ( instance == null )
			throw "The Analytics Manager is not initialized. Use function 'InitInstance'";
		
		return instance;
	}
	
	/*
	 * Constructor
	 */
	private function new() 
	{
		loaders = new Array<AnalyticsLoader>();
	}
	
	public static function SendDataToServer(url : String,method : String, anaData : AnalyticsData,onComplete : Dynamic -> Void = null,onIOError : Dynamic -> Void = null)
	{
		var request : URLRequest;
		var loader : AnalyticsLoader;
		var variables : URLVariables;
		
		request = new URLRequest(url);
		request.method = method;
		request.data = anaData.ToString();
		trace(request.data);
		loader = new AnalyticsLoader(request,onComplete,onIOError);
			
		loaders.push(loader);
	}
	
	public static function Clean() : Void
	{
		for (l in loaders)
			l.Clean();
	}
}