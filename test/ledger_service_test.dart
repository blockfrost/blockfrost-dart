import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

void main()
{
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	LedgerService service = LedgerService(Service.networkCardanoMainnet, projectId);
	
	LedgerGenesis expectedGenesis = LedgerGenesis();
        expectedGenesis.active_slots_coefficient = 0.05;
        expectedGenesis.update_quorum = 5;
        expectedGenesis.max_lovelace_supply = "45000000000000000";
        expectedGenesis.network_magic = 764824073;
        expectedGenesis.epoch_length = 432000;
        expectedGenesis.system_start =1506203091;
        expectedGenesis.slots_per_kes_period = 129600;
        expectedGenesis.slot_length =1;
        expectedGenesis.max_kes_evolutions = 62;
        expectedGenesis.security_param = 2160;
	
	test('test_genesis_willReturn_blockchainGenesis', ()async {
           
        LedgerGenesis genesisResponse = await service.getBlockchainGenesis();
        
	/*	print(genesisResponse.active_slots_coefficient);
    print(genesisResponse.update_quorum);
   	print(genesisResponse.max_lovelace_supply);
    print(genesisResponse.network_magic);
    print(genesisResponse.epoch_length);
    print(genesisResponse.system_start);
    print(genesisResponse.slots_per_kes_period);
    print(genesisResponse.slot_length);
    print(genesisResponse.max_kes_evolutions);
    print(genesisResponse.security_param);*/

		expect(genesisResponse, equals(expectedGenesis));
    });

}
