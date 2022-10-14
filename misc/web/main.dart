import 'dart:html';
import 'dart:convert';

import 'package:blockfrost_api/blockfrost_api.dart';

//dart pub global run webdev serve   http://127.0.0.1:8080/,


void main() async
{  
	String projectId = "<ipfs token>";	
	dynamic res;
	String out;
	
	try
	{
		IPFSService service = IPFSService(Service.networkIPFS, projectId); //Future.value( utf8.encode("HELLO") ).asStream() 
  		res = await service.addFile("hello.txt", Stream.value(utf8.encode("HELLO")) );
  		
		//res = await service.getFile("QmVJwv27ieRuya36ztgkRyP77ArbizmcuUajd52pf9wcYP");
				//res = await utf8.decodeStream(res);
  		//res = await service.pinObject("QmVJwv27ieRuya36ztgkRyP77ArbizmcuUajd52pf9wcYP");
  		//res = await service.listPinnedObjects();
  		//res = await service.getPinnedObject("QmVJwv27ieRuya36ztgkRyP77ArbizmcuUajd52pf9wcYP");
	    // res = await service.removePinnedObject("QmVJwv27ieRuya36ztgkRyP77ArbizmcuUajd52pf9wcYP");
    
		out = res.toString();
	}	
	catch(e)
	{
		out = e.toString();
	}

	querySelector('#output')?.text = "RES: " + out;
	
}
