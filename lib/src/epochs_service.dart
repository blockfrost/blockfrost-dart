

import './service.dart';

import 'package:http/http.dart' as http;
 
class Epoch  extends DartPenance<Epoch>
{
    
    late num epoch;              //: 225,
    late num start_time;         //: 1603403091,
    late num end_time;           //: 1603835086,
    late num first_block_time;   //: 1603403092,
    late num last_block_time;    //: 1603835084,
    late num block_count;        //: 21298,
    late num tx_count;           //: 17856,
    late String output;             //: "7849943934049314",
    late String fees;               //: "4203312194",
    late String? active_stake;       //: "784953934049314"

	@override Epoch fromJson(Map<String, dynamic> json)
	{
		epoch 			= json['epoch'];
		start_time 		= json['start_time'];
		end_time 		= json['end_time'];
		first_block_time 		= json['first_block_time'];
		last_block_time 		= json['last_block_time'];
		block_count 		= json['block_count'];
		tx_count 		= json['tx_count'];
		output 		= json['output'];
		fees 		= json['fees'];
		active_stake 		= json['active_stake'];
	
		return this;
	}
	
	@override Epoch create()
	{
		return Epoch();
	}
	
	bool operator==(Object other) =>
      other is Epoch && epoch == other.epoch && start_time == other.start_time && end_time == other.end_time && first_block_time == other.first_block_time && last_block_time == other.last_block_time && block_count == other.block_count && tx_count == other.tx_count && output == other.output && fees == other.fees && active_stake == other.active_stake;

  	int get hashCode => Object.hash(epoch, start_time, end_time, first_block_time, last_block_time, block_count, tx_count, output, fees, active_stake );
}

class EpochParameters  extends DartPenance<EpochParameters>
{
    
    late num epoch;                  // 225,
    late num min_fee_a;              // 44,
    late num min_fee_b;              // 155381,
    late num max_block_size;         // 65536,
    late num max_tx_size;            // 16384,
    late num max_block_header_size;  // 1100,
    late String key_deposit;            // "2000000",
    late String pool_deposit;           // "500000000",
    late num e_max;                  // 18,
    late num n_opt;                  // 150,
    late num a0;                     // 0.3,
    late num rho;                    // 0.003,
    late num tau;                    // 0.2,
    late num decentralisation_param; // 0.5,
    late dynamic? extra_entropy;          // null,
    late num protocol_major_ver;     // 2,
    late num protocol_minor_ver;     // 0,
    late String min_utxo;               // "1000000",
    late String min_pool_cost;          // "340000000",
    late String nonce;                  // "1a3be38bcbb7911969283716ad7aa550250226b76a61fc51cc9a9a35d9276d81",
    late num? price_mem;              // 0.0577,
    late num? price_step;             // 0.0000721,
    late String? max_tx_ex_mem;          // "10000000",
    late String? max_tx_ex_steps;        // "10000000000",
    late String? max_block_ex_mem;       // "50000000",
    late String? max_block_ex_steps;     // "40000000000",
    late String? max_val_size;           // "5000",
    late num? collateral_percent;     // 150,
    late num? max_collateral_inputs;  // 3,
    late String? coins_per_utxo_word;    // "34482"

	@override EpochParameters fromJson(Map<String, dynamic> json)
	{
		epoch 			= json['epoch'];
		min_fee_a 		= json['min_fee_a'];
		min_fee_b 			= json['min_fee_b'];
		max_block_size 		= json['max_block_size'];
		max_tx_size 			= json['max_tx_size'];
		max_block_header_size 		= json['max_block_header_size'];
		key_deposit 			= json['key_deposit'];
		pool_deposit 		= json['pool_deposit'];
		e_max 			= json['e_max'];
		n_opt 		= json['n_opt'];
		a0 			= json['a0'];
		rho 		= json['rho'];
		tau 			= json['tau'];
		decentralisation_param 		= json['decentralisation_param'];
		extra_entropy 			= json['extra_entropy'];
		protocol_major_ver 		= json['protocol_major_ver'];
		protocol_minor_ver 			= json['protocol_minor_ver'];
		min_utxo 		= json['min_utxo'];
		min_pool_cost 			= json['min_pool_cost'];
		nonce 		= json['nonce'];
		price_mem 			= json['price_mem'];
		price_step 		= json['price_step'];
		max_tx_ex_mem 			= json['max_tx_ex_mem'];
		max_tx_ex_steps 		= json['max_tx_ex_steps'];
		max_block_ex_mem 			= json['max_block_ex_mem'];
		max_block_ex_steps 		= json['max_block_ex_steps'];
		max_val_size 		= json['max_val_size'];
		collateral_percent 		= json['collateral_percent'];
		max_collateral_inputs 		= json['max_collateral_inputs'];
		coins_per_utxo_word 		= json['coins_per_utxo_word'];
		
		
	
		return this;
	}
	
	@override EpochParameters create()
	{
		return EpochParameters();
	}
}

class EpochStake extends DartPenance<EpochStake>
{
    late String stake_address;  //: "stake1u9l5q5jwgelgagzyt6nuaasefgmn8pd25c8e9qpeprq0tdcp0e3uk",
    
    late String amount;         //: "4440295078"
    
	@override EpochStake fromJson(Map<String, dynamic> json)
	{
		stake_address 			= json['stake_address'];
		amount 		= json['amount'];
	
		return this;
	}
	
	@override EpochStake create()
	{
		return EpochStake();
	}
    
}

class EpochStakeAndPool extends DartPenance<EpochStakeAndPool>
{
    late String stake_address;  //: "stake1u9l5q5jwgelgagzyt6nuaasefgmn8pd25c8e9qpeprq0tdcp0e3uk",
    late String pool_id;        //: "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy",
    late String amount;         //: "4440295078"
    
    @override EpochStakeAndPool fromJson(Map<String, dynamic> json)
	{
		stake_address 			= json['stake_address'];
		pool_id 		= json['pool_id'];
		amount 		= json['amount'];
	
		return this;
	}
	
	@override EpochStakeAndPool create()
	{
		return EpochStakeAndPool();
	}
}

///Cardano - Epochs
class EpochsService extends Service 
{
    EpochsService(network, projectId)
		:super(network, projectId);
    
    ///Return the information about the latest, therefore current, epoch.
    Future<Epoch> getLatestEpoch()
    {
		Future<http.Response> resp = get("/epochs/latest", null);
	
        return objectFromResp(resp, Epoch() );
    }
  
    ///Return the protocol parameters for the latest epoch.
    Future<EpochParameters> getLatestEpochProtocolParameters()
    {
		Future<http.Response> resp = get("/epochs/latest/parameters", null);
	
        return objectFromResp(resp, EpochParameters() );
    }
    
    ///Return the content of the requested epoch.
    Future<Epoch> getEpoch(int number)
    {
		Future<http.Response> resp = get("/epochs/$number", null);
	
		return objectFromResp(resp, Epoch() );
    }
    
    ///Return the list of epochs following a specific epoch.
    Future<List<Epoch>> getNextEpochs(int number, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/epochs/$number/next", createPage(count, page, order));
	
		return listFromResp(resp, Epoch() );        
    }
    
    ///Return the list of epochs preceding a specific epoch.
    Future<List<Epoch>> getPreviousEpochs(int number, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/epochs/$number/previous", createPage(count, page, order));
	
        return listFromResp(resp, Epoch() );    
    }
    
    ///Return the active stake distribution for the specified epoch.
    Future<List<EpochStakeAndPool>> getStakeDistribution(int number, {int? count, int? page, String? order}) 
    {
		Future<http.Response> resp = get("/epochs/$number/stakes", createPage(count, page, order));
	
        return listFromResp(resp, EpochStakeAndPool() );
    }
    
    ///Return the active stake distribution for the epoch specified by stake pool.
    Future<List<EpochStake>> getStakeDistributionByPool(int number, String pool_id, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/epochs/$number/stakes/$pool_id", createPage(count, page, order));
	
        return listFromResp(resp, EpochStake() );
    }
    
    ///Return the blocks minted for the epoch specified.
    Future<List<String>> getBlockDistribution(int number, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/epochs/$number/blocks", createPage(count, page, order));
	
        return listOfStringFromResp(resp );
    }
    
    ///Return the block minted for the epoch specified by stake pool.
    Future<List<String>> getBlockDistributionByPool(int number, String pool_id, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/epochs/$number/blocks/$pool_id", createPage(count, page, order));
	
        return listOfStringFromResp(resp );
    }
    
    ///Return the protocol parameters for the epoch specified.
    Future<EpochParameters> getProtocolParameters(int number)
    {
		Future<http.Response> resp = get("/epochs/$number/parameters", null);
	
        return objectFromResp(resp, EpochParameters() );
        
    }
    
    
}





