
import './service.dart';

import 'package:http/http.dart' as http;

class Script extends DartPenance<Script>
{
    late String script_hash;    // "13a3efd825703a352a8f71f4e2758d08c28c564e8dfcce9f77776ad1"

	@override Script fromJson(Map<String, dynamic> json)
	{
		script_hash 			= json['script_hash'];

		return this;
	}
	
	@override Script create()
	{
		return Script();
	}
}
class ScriptCBOR extends DartPenance<ScriptCBOR>
{
    late dynamic cbor;

	@override ScriptCBOR fromJson(Map<String, dynamic> json)
	{
		cbor 			= json['cbor'];
		

	
		return this;
	}
	
	@override ScriptCBOR create()
	{
		return ScriptCBOR();
	}
}

class ScriptDatum extends DartPenance<ScriptDatum>
{
    late dynamic json_value;

	@override ScriptDatum fromJson(Map<String, dynamic> json)
	{
		json_value 			= json['json_value'];

	
		return this;
	}
	
	@override ScriptDatum create()
	{
		return ScriptDatum();
	}
}

class ScriptInformation extends DartPenance<ScriptInformation>
{
    late String script_hash;        // "13a3efd825703a352a8f71f4e2758d08c28c564e8dfcce9f77776ad1",
    late String type;               // "plutus",
    late num? serialised_size;    // 3119

	@override ScriptInformation fromJson(Map<String, dynamic> json)
	{
		script_hash 			= json['script_hash'];
		type 		= json['type'];
		serialised_size 		= json['serialised_size'];

	
		return this;
	}
	
	@override ScriptInformation create()
	{
		return ScriptInformation();
	}
}

class ScriptJSON extends DartPenance<ScriptJSON>
{
    late dynamic json;

	@override ScriptJSON fromJson(Map<String, dynamic> json)
	{
		json 			= json['json'];

		return this;
	}
	
	@override ScriptJSON create()
	{
		return ScriptJSON();
	}
}

class ScriptRedeemer extends DartPenance<ScriptRedeemer>
{
    late String tx_hash;    // "1a0570af966fb355a7160e4f82d5a80b8681b7955f5d44bec0dce628516157f0",
    late num tx_index;   // 0,
    late String purpose;    // "spend",
    late String datum_hash; // "923918e403bf43c34b4ef6b48eb2ee04babed17320d8d1b9ff9ad086e86f44ec",
    late String unit_mem;   // "1700",
    late String unit_steps; // "476468",
    late String fee;        // "172033"

	@override ScriptRedeemer fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		tx_index 		= json['tx_index'];
		purpose 			= json['purpose'];
		datum_hash 		= json['datum_hash'];
		unit_mem 			= json['unit_mem'];
		unit_steps 		= json['unit_steps'];
		fee 			= json['fee'];

	
		return this;
	}
	
	@override ScriptRedeemer create()
	{
		return ScriptRedeemer();
	}
}

///Cardano - Scripts
class ScriptsService extends Service 
{
    ScriptsService(network, projectId)
		:super(network, projectId);
    
    ///List of scripts.
    Future<List<Script>> getScripts({int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/scripts", createPage(count, page, order));
	
        return listFromResp(resp, Script() );
    }
    
    ///Information about a specific script
    Future<ScriptInformation> getScript(String script_hash)
    {
		Future<http.Response> resp = get("/scripts/$script_hash", null);
        
		return objectFromResp(resp, ScriptInformation() );
    }
 
    ///JSON representation of a timelock script  
    Future<ScriptJSON> getScriptAsJSON(String script_hash)
    {
		Future<http.Response> resp = get("/scripts/$script_hash/json", null);
	
        return objectFromResp(resp, ScriptJSON() );
    }
    
    ///CBOR representation of a plutus script
    Future<ScriptCBOR> getScriptAsCBOR(String script_hash)
    {
		Future<http.Response> resp = get("/scripts/$script_hash/cbor", null);
	
        
		return objectFromResp(resp, ScriptCBOR() );
    }
    
    ///List of redeemers of a specific script
    Future<List<ScriptRedeemer>> getScriptRedeemers(String script_hash,{int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/scripts/$script_hash/redeemers", createPage(count, page, order));
	
		
		return listFromResp(resp, ScriptRedeemer() );        
    }
    
    ///Query JSON value of a datum by its hash
    Future<ScriptDatum> getDatumAsJSON(String datum_hash)
    {
		Future<http.Response> resp = get("/scripts/datum/$datum_hash", null);
	
        
		return objectFromResp(resp, ScriptDatum() );        
    }
  
}


