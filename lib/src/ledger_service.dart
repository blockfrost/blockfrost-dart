
import './service.dart';

import 'package:http/http.dart' as http;

class LedgerGenesis extends DartPenance<LedgerGenesis>
{
    late num active_slots_coefficient;   // 0.05,
    late num update_quorum;              // 5,
   	late String max_lovelace_supply;        // "45000000000000000",
    late num network_magic;              // 764824073,
    late num epoch_length;               // 432000,
    late num system_start;               // 1506203091,
    late num slots_per_kes_period;       // 129600,
    late num slot_length;                // 1,
    late num max_kes_evolutions;         // 62,
    late num security_param;             // 2160

	@override LedgerGenesis fromJson(Map<String, dynamic> json)
	{
		active_slots_coefficient 			= json['active_slots_coefficient'];
		update_quorum 		= json['update_quorum'];
		max_lovelace_supply 			= json['max_lovelace_supply'];
		network_magic 		= json['network_magic'];
		epoch_length 			= json['epoch_length'];
		system_start 		= json['system_start'];
		slots_per_kes_period 			= json['slots_per_kes_period'];
		slot_length 		= json['slot_length'];
		max_kes_evolutions 			= json['max_kes_evolutions'];
		security_param 		= json['security_param'];
	
		return this;
	}
	
	@override LedgerGenesis create()
	{
		return LedgerGenesis();
	}
}

class LedgerService extends Service 
{
    LedgerService(network, projectId)
		:super(network, projectId);
  
    Future<LedgerGenesis> getBlockchainGenesis()
    {
		Future<http.Response> resp = get("/genesis", null);
	
        return objectFromResp(resp, LedgerGenesis() );
	
    }
}


