
import './service.dart';

import 'package:http/http.dart' as http;

class UtilitiesAddress extends DartPenance<UtilitiesAddress>
{
    late String xpub;       // "d507c8f866691bd96e131334c355188b1a1d0b2fa0ab11545075aab332d77d9eb19657ad13ee581b56b0f8d744d66ca356b93d42fe176b3de007d53e9c4c4e7a",
    late num role;       // 0,
    late num index;      // 0,
    late String address;    // "addr1q90sqnljxky88s0jsnps48jd872p7znzwym0jpzqnax6qs5nfrlkaatu28n0qzmqh7f2cpksxhpc9jefx3wrl0a2wu8q5amen7"

	@override UtilitiesAddress fromJson(Map<String, dynamic> json)
	{
		xpub 			= json['xpub'];
		role 			= json['role'];
		index 			= json['index'];
		address 			= json['address'];

		return this;
	}
	
	@override UtilitiesAddress create()
	{
		return UtilitiesAddress();
	}
}

class UtilitiesService extends Service 
{
    UtilitiesService(network, projectId)
		:super(network, projectId);
    
    Future<UtilitiesAddress> deriveAddress(String xpub, int role, int index)
    {
		Future<http.Response> resp = get("/utils/addresses/xpub/$xpub/$role/$index", null);
			
		return objectFromResp(resp, UtilitiesAddress());        
    }

    Future<String> submitTransactionForEvaluation(Stream<List<int>> cbor)
    {
		Future<http.StreamedResponse> resp = postData("/utils/txs/evaluate", cbor, null, {"Content-Type": "application/cbor" });
	
		return stringFromRespStreamed(resp);
    }
 
}


