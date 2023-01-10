

import './service.dart';

import 'package:http/http.dart' as http;

class NetworkInformation extends DartPenance<NetworkInformation>
{
    late NetworkInformationSupply supply;
    late NetworkInformationStake stake;

	@override NetworkInformation fromJson(Map<String, dynamic> json)
	{
		supply  = NetworkInformationSupply().fromJson(json['supply']);
		stake 	= NetworkInformationStake().fromJson(json['stake']);
	
		return this;
	}
	
	@override NetworkInformation create()
	{
		return NetworkInformation();
	}
}

class NetworkInformationStake extends DartPenance<NetworkInformationStake>
{
    late String live;   // "23204950463991654",
    late String active; // "22210233523456321"

	@override NetworkInformationStake fromJson(Map<String, dynamic> json)
	{
		live 			= json['live'];
		active 		= json['active'];
		
	
		return this;
	}
	
	@override NetworkInformationStake create()
	{
		return NetworkInformationStake();
	}
}

class NetworkInformationSupply extends DartPenance<NetworkInformationSupply>
{
    late String max;            // "45000000000000000",
    late String total;          // "32890715183299160",
    late String circulating;    // "32412601976210393",
    late String locked;         // "125006953355",
    late String treasury;       // "98635632000000",
    late String reserves;       // "46635632000000"
	
	@override NetworkInformationSupply fromJson(Map<String, dynamic> json)
	{
		max 			= json['max'];
		total 		= json['total'];
		circulating 			= json['circulating'];
		locked 			= json['locked'];
		treasury 		= json['treasury'];
		reserves 			= json['reserves'];
	
		return this;
	}
	
	@override NetworkInformationSupply create()
	{
		return NetworkInformationSupply();
	}
}

class NetworkService extends Service 
{
     NetworkService(network, projectId)
		:super(network, projectId);
    
 
    Future<NetworkInformation> getNetworkInformation()
    {	
		Future<http.Response> resp = get("/network", null);
	
        return objectFromResp(resp, NetworkInformation() );
    }
    
  
}

