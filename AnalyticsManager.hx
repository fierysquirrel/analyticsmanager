package;

import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLVariables;
import flash.net.URLRequestMethod;

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
	
	private static var database : String;
	
	public static function InitInstance(database : String = ""): AnalyticsManager
	{
		if (instance == null)
			instance = new AnalyticsManager(database);
		
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
	private function new(db : String = "") 
	{
		loaders = new Array<AnalyticsLoader>();
		database = db;
	}
	
	public static function SendDataToServer(url : String,table : String, anaData : AnalyticsData,onComplete : Dynamic -> Void = null,onIOError : Dynamic -> Void = null, db : String = "")
	{
		var request : URLRequest;
		var loader : AnalyticsLoader;
		var variables : URLVariables;
		var databaseName : String;
		
		databaseName = db != "" ? db : database;
		request = new URLRequest(url);
		//I also decided to do every request through POST method, if needed could be change in the future
		request.method = URLRequestMethod.POST;
		//I decided to use only JSON, we could change this in the future
		request.data = "database=" + databaseName + "&table=" + table + "&data=" + anaData.ToJSON();
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