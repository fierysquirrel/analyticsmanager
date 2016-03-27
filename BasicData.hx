package;

import haxe.Json;
import openfl.system.Capabilities;

class BasicData extends AnalyticsData
{
	var userID : String;
	
	public function new(userID : String = "") 
	{
		super();
		
		if (userID != "")
		{
			this.userID = userID;
			AddValue("user_id", userID);
		}
			
		AddValue("dpi", Capabilities.screenDPI);
		AddValue("language", Capabilities.language);
		AddValue("resolution_x", Capabilities.screenResolutionX);
		AddValue("resolution_y", Capabilities.screenResolutionY);
		AddValue("source", Capabilities.os);
	}
}