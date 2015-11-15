package fs.analyticsmanager;

/**
 * ...
 * @author Fiery Squirrel
 */
class AnaTest extends AnalyticsData
{

	public function new() 
	{
		super();
		
		this.AddValue("par1", "val1");
		this.AddValue("par2", 65);
		this.AddValue("par3", 42.028);
	}
}