
import './service.dart';

import 'package:http/http.dart' as http;

class MetadataCBOR extends DartPenance<MetadataCBOR>
{
    late String tx_hash;        //: "257d75c8ddb0434e9b63e29ebb6241add2b835a307aa33aedba2effe09ed4ec8",
    late dynamic? cbor_metadata;  //: null,
    late dynamic? metadata;       //: null

	@override MetadataCBOR fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		cbor_metadata 		= json['cbor_metadata'];
		metadata 			= json['metadata'];
	
		return this;
	}
	
	@override MetadataCBOR create()
	{
		return MetadataCBOR();
	}
}

class MetadataJSON extends DartPenance<MetadataJSON>
{
    late String tx_hash;        // "257d75c8ddb0434e9b63e29ebb6241add2b835a307aa33aedba2effe09ed4ec8",
    late dynamic? json_metadata;  // {}

	@override MetadataJSON fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		json_metadata 		= json['json_metadata'];

	
		return this;
	}
	
	@override MetadataJSON create()
	{
		return MetadataJSON();
	}
}

class MetadataLabel extends DartPenance<MetadataLabel>
{
    late String label;  // "1990",
    late dynamic? cip10;  // null,
    late dynamic? count;  // "1"

	@override MetadataLabel fromJson(Map<String, dynamic> json)
	{
		label 			= json['label'];
		cip10 		= json['cip10'];
		count 			= json['count'];
	
	
		return this;
	}
	
	@override MetadataLabel create()
	{
		return MetadataLabel();
	}
}

class MetadataService extends Service 
{
    MetadataService(network, projectId)
		:super(network, projectId);
   
    Future<List<MetadataLabel>> getTransactionMetadataLabels({int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/metadata/txs/labels", createPage(count, page, order));
	
        
        return listFromResp(resp, MetadataLabel() );
        

    }
    
    Future<List<MetadataJSON>> getTransactionMetadataAsJSON(String label, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/metadata/txs/labels/$label", createPage(count, page, order));
	
        return listFromResp(resp, MetadataJSON() );
        
        
    }
    
    Future<List<MetadataCBOR>> getTransactionMetadataAsCBOR(String label, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/metadata/txs/labels/$label/cbor", createPage(count, page, order));
	
        return listFromResp(resp, MetadataCBOR() );
    }
}

