
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'dart:convert';
import 'dart:async';

import './throttler.dart';

abstract class DartPenance<T>
{
	T fromJson(Map<String, dynamic> json);
	T create();
      
}

class Page
{
	Page(int count, int page, String order)
		: _count = count, _page = page, _order = order;
	
	final int _count;
	final int _page;
	final String _order;
	
	Map<String, dynamic> toMap()
	{
		return {"count":"$_count", "page":"$_page", "order":_order};
	}
}

abstract class Service
{
    Service(String network, String projectId)
		: _projectId = projectId, _client = http.Client(), _throttler = Throttler.create()
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
    
	final Throttler _throttler;

    late String _networkDomain;
	late String _networkPrefix;
    final String _projectId;
    final http.Client _client;
    
    static const String networkIPFS           = "https://ipfs.blockfrost.io/api/v0";
    static const String networkCardanoMainnet = "https://cardano-mainnet.blockfrost.io/api/v0";
    static const String networkCardanoTestnet = "https://cardano-testnet.blockfrost.io/api/v0";
	static const String networkCardanoPreprod = "https://cardano-preprod.blockfrost.io/api/v0";
	static const String networkCardanoPreview = "https://cardano-preview.blockfrost.io/api/v0";
    
	Page? createPage(int? count, int? page, String? order)
	{
		if( count == null && page == null && order == null )
			return null;
			
		count ??= 100;
		page  ??= 1;
		order ??= "asc";
		
		return Page(count, page, order);
	}
	
	Map<String, dynamic>? makeParams(Map<String, dynamic>? params, Page? page)
	{
		if( params == null )
		{
			if( page == null )
				return null;
				
			return page.toMap();
		}
		
		else
		{
			 Map<String, dynamic> out = {};
				
			 for(final key in params.keys)
				out[key] = "${params[key]}";
			
			if( page != null )
				out.addAll( page.toMap() );
			
			return out;
		}
	}

    Future<http.Response>  get(String endpoint, Page? page, [Map<String, dynamic>? params]) async
    {
		await _throttler.next();
	
		return _client.get( Uri.https(_networkDomain, _networkPrefix + endpoint, makeParams(params, page) ), headers: {"project_id": _projectId });
    }

	Future<http.Response> postVoid(String endpoint, Page? page, [Map<String, dynamic>? params]) async
    {
		await _throttler.next();
	
		return _client.post( Uri.https(_networkDomain, _networkPrefix + endpoint, makeParams(params, page)) , headers: {"project_id": _projectId }, body:[] );
    }

	Future<http.StreamedResponse> getStreamed(String endpoint, [Map<String, dynamic>? params]) async
	{
		await _throttler.next();
		
		http.StreamedRequest req = http.StreamedRequest("GET", Uri.https(_networkDomain, _networkPrefix + endpoint, params));
		req.headers.addAll( {"project_id": _projectId } );
		
		req.sink.close();
		
		return _client.send(req);
	}
    
	static Future<List<int>> byteStreamToList(Stream<List<int>> data)
	{
		var completer = Completer<List<int>>();
		
		List<int> totalData = [];
		
		data.listen((List<int> chunk)
		{
    		totalData.addAll(chunk);
    	},onDone: ()
		{
			completer.complete(totalData);
		});
		
		return completer.future;
	}
	
	static Future<String> byteStreamToUtf8String(Stream<List<int>> data) async
	{
		List<int> bytes = await byteStreamToList(data);
		
		return utf8.decode(bytes);
	}

/*	thing()
	{
		String newline = String.fromCharCodes([13, 10]);
		
		String s = "";
	//	s += "Content-Type: multipart/form-data; boundary=------------------------c0aac0efb7ca723d" + newline;
	//	s += newline;
		s += "--------------------------c0aac0efb7ca723d" + newline;
		s += "Content-Disposition: form-data; name=\"file\"; filename=\"hello.txt\"" + newline;
		s += "Content-Type: text/plain" + newline;
		s += newline;
		s += "HELLO" + newline;
		s += "--------------------------c0aac0efb7ca723d--" + newline;
		
		return s;
	}*/

	Future<http.StreamedResponse> postFile(String endpoint, String name, Stream<List<int>> data, [Map<String, dynamic>? params, Map<String, String>? additionalHeaders]) async
	{
		await _throttler.next();
		
		http.MultipartRequest req = http.MultipartRequest('POST', Uri.https(_networkDomain, _networkPrefix + endpoint, params) );
		req.headers.addAll( {"project_id": _projectId } );
		
		if( additionalHeaders != null )
		{ 
			req.headers.addAll( additionalHeaders );
		}
		
		List<int> totalData = await byteStreamToList(data);
	
  		http.MultipartFile multipartFile = http.MultipartFile.fromBytes('file', totalData, filename: name, contentType: MediaType('application', 'octet-stream'));
		req.files.add( multipartFile );
		
		//req.files.add( http.MultipartFile("file", data, 5, filename:name, contentType:MediaType('application', 'octet-stream') ) ); //text/plain
		
		return _client.send(req);
		
		
		
		//return postData(endpoint, Stream.value( utf8.encode( thing() ) ), params, additionalHeaders);  
	} 

  	Future<http.StreamedResponse> postData(String endpoint, Stream<List<int>> data, [Map<String, dynamic>? params, Map<String, String>? additionalHeaders]) async
    {	
		await _throttler.next();
	
		http.StreamedRequest req = http.StreamedRequest("POST", Uri.https(_networkDomain, _networkPrefix + endpoint, params));
		req.headers.addAll( {"project_id": _projectId } );
		
		//req.headers["Content-Type"] = "multipart/form-data; boundary=------------------------c0aac0efb7ca723d";
		
		if( additionalHeaders != null )
		{ 
			req.headers.addAll( additionalHeaders );
		}
		
		data.listen((List<int> chunk)
		{
  			req.sink.add(chunk);
	
		}, onDone: ()
		{
  			req.sink.close();
		});

		return _client.send(req);
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
	
	Future<String> stringFromRespStreamed(Future<http.StreamedResponse> futureRes) async
	{
		http.StreamedResponse res = await futureRes;
	
		if( res.statusCode == 200 )
		{
			return res.stream.bytesToString();
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
    
	Future<T> objectFromRespStreamed<T extends DartPenance>(Future<http.StreamedResponse> futureRes, T t) async
	{
		http.StreamedResponse res = await futureRes;
		
		if( res.statusCode == 200 )
		{
			Map<String, dynamic> json = jsonDecode( await res.stream.bytesToString() );
		
			t.fromJson(json);
				
			return Future<T>.value(t);
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

	
 
    
    