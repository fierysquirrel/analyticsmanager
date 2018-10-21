# Analytics Manager for OpenFL

Basic structure to connect your game with a simple database

# Functionality:
- Send data to the server
- Model of a simple structure with basic data
- Converts the data to JSON format easy to parse in any language at server
- Can handle different requests to different tables in a database

You basically use the AnalyticsManager.hx class as a singleton. 

First Initialize it using the InitInstance function, pass the name of the database as parameter.

Use the function SendDataToServer(url,table,anaData,onComplete,onIOError,db) to store or handle data in the server as you wish.

- URL: the path to the server
- Table: the name of the table in the database
- AnaData: class that inherits from AnalyticsData which contains some basic data
- OnComplete: a callback for a successful call
- OnIOError: if there is any error with the request, you can handle it here
- DB: in case you want to call another database, you can do it

This is still in development, I have to fix bugs and keep improving it but the basic functionality is there.

Feel free to contact me: henry@fierysquirrel.com
http://fierysquirrel.com/
