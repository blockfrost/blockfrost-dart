import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;



void main()
{
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	NetworkService service = NetworkService(Service.networkCardanoMainnet, projectId);
	
	test('test_network_willReturn_networkInfo', ()async {
   	

        NetworkInformation networkResponse = await service.getNetworkInformation();
        
		expect( networkResponse.supply.max, equals("45000000000000000") );

        
    });

}