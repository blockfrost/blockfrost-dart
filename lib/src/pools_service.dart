
import './service.dart';

import 'package:http/http.dart' as http;

class Pool  extends DartPenance<Pool>
{
    late String pool_id;    // "pool19u64770wqp6s95gkajc8udheske5e6ljmpq33awxk326zjaza0q",
    late num epoch;      // 225
	
	@override Pool fromJson(Map<String, dynamic> json)
	{
		pool_id 			= json['pool_id'];
		epoch 		= json['epoch'];
		
	
		return this;
	}
	
	@override Pool create()
	{
		return Pool();
	}
}

class PoolDelegator extends DartPenance<PoolDelegator>
{
    late String address;    // "stake1ux4vspfvwuus9uwyp5p3f0ky7a30jq5j80jxse0fr7pa56sgn8kha",
    late String live_stake; // "1137959159981411"

	@override PoolDelegator fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		live_stake 		= json['live_stake'];
		
	
		return this;
	}
	
	@override PoolDelegator create()
	{
		return PoolDelegator();
	}
}

class PoolExtended extends DartPenance<PoolExtended>
{
    late String pool_id;        // "pool19u64770wqp6s95gkajc8udheske5e6ljmpq33awxk326zjaza0q",
    late String active_stake;   // "1541200000",
    late String live_stake;     // "1541400000"

	@override PoolExtended fromJson(Map<String, dynamic> json)
	{
		pool_id 			= json['pool_id'];
		active_stake 		= json['active_stake'];
		live_stake 		= json['live_stake'];
		
	
		return this;
	}
	
	@override PoolExtended create()
	{
		return PoolExtended();
	}

}

class PoolHistory extends DartPenance<PoolHistory>
{
    late num epoch;              // 233,
    late num blocks;             // 22,
    late String active_stake;       // "20485965693569",
    late num active_size;        // 1.2345,
    late num delegators_count;   // 115,
    late String rewards;            // "206936253674159",
    late String fees;               // "1290968354"

	@override PoolHistory fromJson(Map<String, dynamic> json)
	{
		epoch 			= json['epoch'];
		blocks 		= json['blocks'];
		active_stake 			= json['active_stake'];
		active_size 		= json['active_size'];
		delegators_count 			= json['delegators_count'];
		rewards 		= json['rewards'];
		fees 			= json['fees'];
		
		
	
		return this;
	}
	
	@override PoolHistory create()
	{
		return PoolHistory();
	}
}

class PoolMetadata extends DartPenance<PoolMetadata>
{
    late String pool_id;        // "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy",
    late String hex;            // "0f292fcaa02b8b2f9b3c8f9fd8e0bb21abedb692a6d5058df3ef2735",
    late String url;            // "https://stakenuts.com/mainnet.json",
    late String hash;           // "47c0c68cb57f4a5b4a87bad896fc274678e7aea98e200fa14a1cb40c0cab1d8c",
    late String ticker;         // "NUTS",
    late String name;           // "Stake Nuts",
    late String description;    // "The best pool ever",
    late String homepage;       // "https://stakentus.com/"

	@override PoolMetadata fromJson(Map<String, dynamic> json)
	{
		pool_id 			= json['pool_id'];
		hex 		= json['hex'];
		url 			= json['url'];
		hash 		= json['hash'];
		ticker 			= json['ticker'];
		name 		= json['name'];
		description 			= json['description'];
		homepage 		= json['homepage'];
	
		
		
	
		return this;
	}
	
	@override PoolMetadata create()
	{
		return PoolMetadata();
	}

}

class PoolRelay extends DartPenance<PoolRelay>
{
   	late String?  ipv4;       // "4.4.4.4",
    late String? ipv6;       // "https://stakenuts.com/mainnet.json",
    late String dns;        // "relay1.stakenuts.com",
    late String? dns_srv;    // "_relays._tcp.relays.stakenuts.com",
    late num port;       // 3001

	@override PoolRelay fromJson(Map<String, dynamic> json)
	{
		ipv4 			= json['ipv4'];
		ipv6 		= json['ipv6'];
		dns 			= json['dns'];
		dns_srv 		= json['dns_srv'];
		port 			= json['port'];
		
	
		return this;
	}
	
	@override PoolRelay create()
	{
		return PoolRelay();
	}

}

class PoolStakePool extends DartPenance<PoolStakePool>
{
    late String pool_id;        // "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy",
    late String hex;            // "0f292fcaa02b8b2f9b3c8f9fd8e0bb21abedb692a6d5058df3ef2735",
    late String vrf_key;        // "0b5245f9934ec2151116fb8ec00f35fd00e0aa3b075c4ed12cce440f999d8233",
    late num blocks_minted;  // 69,
    late num blocks_epoch;   // 4,
    late String live_stake;     // "6900000000",
    late num live_size;      // 0.42,
    late num live_saturation;// 0.93,
    late num live_delegators;// 127,
    late String active_stake;   // "4200000000",
    late num active_size;    // 0.43,
   late String  declared_pledge;// "5000000000",
    late String live_pledge;    // "5000000001",
    late num margin_cost;    // 0.05,
    late String fixed_cost;     // "340000000",
    late String reward_account; // "stake1uxkptsa4lkr55jleztw43t37vgdn88l6ghclfwuxld2eykgpgvg3f",
    late List<String> owners;         // [ "stake1u98nnlkvkk23vtvf9273uq7cph5ww6u2yq2389psuqet90sv4xv9v" ],
    late List<String> registration;   // [ "9f83e5484f543e05b52e99988272a31da373f3aab4c064c76db96643a355d9dc", "7ce3b8c433bf401a190d58c8c483d8e3564dfd29ae8633c8b1b3e6c814403e95", ]
    late List<String> retirement;     // [ "252f622976d39e646815db75a77289cf16df4ad2b287dd8e3a889ce14c13d1a8" ]

	@override PoolStakePool fromJson(Map<String, dynamic> json)
	{
		pool_id 			= json['pool_id'];
		hex 		= json['hex'];
		vrf_key 			= json['vrf_key'];
		blocks_minted 		= json['blocks_minted'];
		blocks_epoch 			= json['blocks_epoch'];
		live_stake 		= json['live_stake'];
		live_size 			= json['live_size'];
		live_saturation 			= json['live_saturation'];
		live_delegators 		= json['live_delegators'];
		active_stake 			= json['active_stake'];
		active_size 		= json['active_size'];
		declared_pledge 		= json['declared_pledge'];
		live_pledge 			= json['live_pledge'];
		margin_cost 		= json['margin_cost'];
		fixed_cost 			= json['fixed_cost'];
		reward_account 		= json['reward_account'];
		
		owners = [];
		for(int i = 0 ; i < (json["owners"] as List<dynamic>).length ; i++)
		{
			owners.add( (json["owners"] as List<dynamic>)[i]  ) ;
		}
		
		registration = [];
		for(int i = 0 ; i < (json["registration"] as List<dynamic>).length ; i++)
		{
			registration.add( (json["registration"] as List<dynamic>)[i]  ) ;
		}
		
		retirement = [];
		for(int i = 0 ; i < (json["retirement"] as List<dynamic>).length ; i++)
		{
			retirement.add( (json["retirement"] as List<dynamic>)[i]  ) ;
		}
		
	
		return this;
	}
	
	@override PoolStakePool create()
	{
		return PoolStakePool();
	}
}

class PoolUpdate extends DartPenance<PoolUpdate>
{
    late String tx_hash;    // "6804edf9712d2b619edb6ac86861fe93a730693183a262b165fcc1ba1bc99cad",
    late num cert_index; // 0,
    late String action;     // "registered"

	@override PoolUpdate fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		cert_index 		= json['cert_index'];
		action 		= json['action'];
		
	
		return this;
	}
	
	@override PoolUpdate create()
	{
		return PoolUpdate();
	}
}

class PoolsService extends Service 
{
    PoolsService(network, projectId)
		:super(network, projectId);
    
   
    Future<List<String>> getStakePools()
    {
		Future<http.Response> resp = get("/pools");
	
		return listOfStringFromResp(resp);

    }
    
   
    Future<List<PoolExtended>> getStakePoolsExtended()
    {
		Future<http.Response> resp = get("/pools/extended");
	
        return listFromResp(resp, PoolExtended() );
    }
    
   
    Future<List<Pool>> getRetiredStakePools()
    {
		Future<http.Response> resp = get("/pools/retired");
	
        return listFromResp(resp, Pool() );
    }
    
  
    Future<List<Pool>> getRetiringStakePools()
    {
		Future<http.Response> resp = get("/pools/retiring");
	
        return listFromResp(resp, Pool() );
    }
    
   
    Future<PoolStakePool> getStakePool(String pool_id)
    {
		Future<http.Response> resp = get("/pools/$pool_id");
	
        return objectFromResp(resp, PoolStakePool() );

    }
    
  
    Future<List<PoolHistory>> getStakePoolHistory(String pool_id)
    {
		Future<http.Response> resp = get("/pools/$pool_id/history");
	
        return listFromResp(resp, PoolHistory()) ;
        
    }
    
  
    Future<PoolMetadata> getStakePoolMetadata(String pool_id)
    {
		Future<http.Response> resp = get("/pools/{$pool_id}/metadata");
	
        return objectFromResp(resp, PoolMetadata() );
    }
    
  
    Future<List<PoolRelay>> getStakePoolRelays(String pool_id)
    {
		Future<http.Response> resp = get("/pools/$pool_id/relays");
	
        return listFromResp(resp, PoolRelay()) ;
    }
    
   
    Future<List<PoolDelegator>> getStakePoolDelegators(String pool_id)
    {
		Future<http.Response> resp = get("/pools/$pool_id/delegators");
	
        return listFromResp(resp, PoolDelegator()) ;
    }
    
   
    Future<List<String>> getStakePoolBlocks(String pool_id)
    {
		Future<http.Response> resp = get("/pools/$pool_id/blocks");
	
        return listOfStringFromResp(resp);
    }
    
  
    Future<List<PoolUpdate>> getStakePoolUpdates(String pool_id)
    {
		Future<http.Response> resp = get("/pools/{$pool_id}/updates");
	
        return listFromResp(resp, PoolUpdate()) ;
       
    }
  
}




