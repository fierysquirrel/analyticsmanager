package fs.analyticsmanager;


class AnalyticsData
{
	private var values : Map<String,Dynamic>;
	
	public function new() 
	{
		values = new Map<String,Dynamic>();
	}
	
	private function AddValue(key : String, value : Dynamic) : Void
	{
		values.set(key, value);
	}
	
	public function ToString() : String
	{
		var data : String;
		
		data = "";
		
		for (k in values.keys())
		{
			data += k + "=" + values.get(k);
			data += "&";
		}
		
		return data.substring(0, data.length - 1);
	}
}