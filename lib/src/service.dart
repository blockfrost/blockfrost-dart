
import 'package:http/http.dart' as http;

import 'dart:convert';

abstract class DartPenance<T>
{
	T fromJson(Map<String, dynamic> json);
	T create();
      
}

abstract class Service
{
    Service(String network, String projectId)
		: _projectId = projectId, _client = http.Client()
	{  
		String scheme = "https://";
		
		if( ! network.startsWith(scheme) )
			throw new Exception();
			
		int index = network.indexOf("/", scheme.length);
		
		if( index == -1 )
			throw new Exception();
			
		_networkDomain = network.substring(scheme.length, index);
		_networkPrefix = network.substring(index+1);
	}
		    
	closeClient()
	{
		_client.close();
	}
    
    late String _networkDomain;
	late String _networkPrefix;
    final String _projectId;
    final http.Client _client;
    
    static const String networkIPFS           = "https://ipfs.blockfrost.io/api/v0";
    static const String networkCardanoMainnet = "https://cardano-mainnet.blockfrost.io/api/v0";
    static const String networkCardanoTestnet = "https://cardano-testnet.blockfrost.io/api/v0";
     
    Future<http.Response> get(String endpoint, [Map<String, dynamic>? params])
    {
		return _client.get( Uri.https(_networkDomain, _networkPrefix + endpoint, params), headers: {"project_id": _projectId });
    }
    

	Future<List<String>> listOfStringFromResp(Future<http.Response> futureRes) async
	{
		http.Response res = await futureRes;
	
		if( res.statusCode == 200 )
		{
			List<dynamic> jsonArray = jsonDecode(res.body);
					
			List<String> out = [];
			
			for(int i = 0 ; i < jsonArray.length ; i++)
			{
				out.add( jsonArray[i] );
			}
			
			return out;
		}
		
		else
		{
			throw Exception(res.statusCode);
		}
	}
	
	Future<List<T>> listFromResp<T extends DartPenance>(Future<http.Response> futureRes, T t) async
	{
		http.Response res = await futureRes;
	
		if( res.statusCode == 200 )
		{
			List<dynamic> jsonArray = jsonDecode(res.body);
			
			List<T> out = [];
			
			for(int i = 0 ; i < jsonArray.length ; i++)
			{
				T obj = t.create();
				obj.fromJson( jsonArray[i] );
				
				out.add(obj);
			}
			
			return out;
		}
		
		else
		{
			throw Exception(res.statusCode);
		}
	}
	
	Future<String> stringFromResp(Future<http.Response> futureRes) async
    {
		http.Response res = await futureRes;
	
		if( res.statusCode == 200 )
		{
			String json = jsonDecode(res.body);
		
			return Future<String>.value(json);
		}
		
		else
		{
			throw Exception(res.statusCode);
		}
	
    }
    
	//https://docs.flutter.dev/development/data-and-backend/json
    Future<T> objectFromResp<T extends DartPenance>(Future<http.Response> futureRes, T t) async
    {
		http.Response res = await futureRes;
	
		if( res.statusCode == 200 )
		{
			Map<String, dynamic> json = jsonDecode(res.body);
		
			t.fromJson(json);
				
			return Future<T>.value(t);
		}
		
		else
		{
			throw Exception(res.statusCode);
		}
	
    }
    

}

	
 
    
    