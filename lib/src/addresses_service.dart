
import './service.dart';

import 'package:http/http.dart' as http;

class Address extends DartPenance<Address>
{
    
    late String address;        // "addr1qxqs59lphg8g6qndelq8xwqn60ag3aeyfcp33c2kdp46a09re5df3pzwwmyq946axfcejy5n4x0y99wqpgtp2gd0k09qsgy6pz",
    late List<AddressAccountSum> amount;         // [ { "unit": "lovelace", "quantity": "42000000" }, {} ],
    late String? stake_address;  // "stake1ux3g2c9dx2nhhehyrezyxpkstartcqmu9hk63qgfkccw5rqttygt7",
    late String type;           //: "shelley",
    late bool script;         // false

	@override Address fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		stake_address 		= json['stake_address'];
		type 		= json['type'];
		script 		= json['script'];
		
		amount = [];
		for(int i = 0 ; i < (json["amount"] as List<dynamic>).length ; i++)
		{
			amount.add(AddressAccountSum().fromJson( (json["amount"] as List<dynamic>)[i] ) ) ;
		}
		
		
	
		return this;
	}
	
	@override Address create()
	{
		return Address();
	}
}

class AddressAccountSum extends DartPenance<AddressAccountSum>
{
    late String unit;//: "lovelace",
    late String quantity;//: "42000000"

	@override AddressAccountSum fromJson(Map<String, dynamic> json)
	{
		unit 			= json['unit'];
		quantity 		= json['quantity'];
	
		return this;
	}
	
	@override AddressAccountSum create()
	{
		return AddressAccountSum();
	}
}

class AddressExtended extends DartPenance<AddressExtended>
{
    
    late String address;        // "addr1qxqs59lphg8g6qndelq8xwqn60ag3aeyfcp33c2kdp46a09re5df3pzwwmyq946axfcejy5n4x0y99wqpgtp2gd0k09qsgy6pz",
    late List<AddressAccountSum> amount;         // [ { "unit": "lovelace", "quantity": "42000000" }, {} ], //AddressSum
    late String? stake_address;  // "stake1ux3g2c9dx2nhhehyrezyxpkstartcqmu9hk63qgfkccw5rqttygt7",
    late String type;           //: "shelley",
    late bool script;         // false

	@override AddressExtended fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		stake_address 		= json['stake_address'];
		type 		= json['type'];
		script 		= json['script'];
	
		amount = [];
		for(int i = 0 ; i < (json["amount"] as List<dynamic>).length ; i++)
		{
			amount.add(AddressAccountSum().fromJson( (json["amount"] as List<dynamic>)[i] ) ) ;
		}
	
		return this;
	}
	
	@override AddressExtended create()
	{
		return AddressExtended();
	}
}

class AddressSum extends DartPenance<AddressSum>
{
    late String unit;                       // "lovelace",
    late String quantity;                   // "42000000",
    late num? decimals;                   // 6,
    late bool has_nft_onchain_metadata;   // false

	@override AddressSum fromJson(Map<String, dynamic> json)
	{
		unit 			= json['unit'];
		quantity 		= json['quantity'];
		decimals 		= json['decimals'];
		has_nft_onchain_metadata 		= json['has_nft_onchain_metadata'];
	
		return this;
	}
	
	@override AddressSum create()
	{
		return AddressSum();
	}
}

class AddressTotal extends DartPenance<AddressTotal>
{
    late String address;        // "addr1qxqs59lphg8g6qndelq8xwqn60ag3aeyfcp33c2kdp46a09re5df3pzwwmyq946axfcejy5n4x0y99wqpgtp2gd0k09qsgy6pz",
    late List<AddressAccountSum> received_sum;   // [ { "unit": "lovelace", "quantity": "42000000" }, {} ],
    late List<AddressAccountSum> sent_sum;       // [ {}, {} ],
    late num tx_count;       // 12

	@override AddressTotal fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		tx_count 		= json['tx_count'];
		
		received_sum = [];
		for(int i = 0 ; i < (json["received_sum"] as List<dynamic>).length ; i++)
		{
			received_sum.add(AddressAccountSum().fromJson( (json["received_sum"] as List<dynamic>)[i] ) ) ;
		}
		
		sent_sum = [];
		for(int i = 0 ; i < (json["sent_sum"] as List<dynamic>).length ; i++)
		{
			sent_sum.add(AddressAccountSum().fromJson( (json["sent_sum"] as List<dynamic>)[i] ) ) ;
		}
	
		return this;
	}
	
	@override AddressTotal create()
	{
		return AddressTotal();
	}
}

class AddressTransaction extends DartPenance<AddressTransaction>
{
    late String tx_hash;        // "8788591983aa73981fc92d6cddbbe643959f5a784e84b8bee0db15823f575a5b",
    late num tx_index;       // 6,
    late num block_height;   // 69,
    late num block_time;     // 1635505891

	@override AddressTransaction fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		tx_index 		= json['tx_index'];
		block_height 		= json['block_height'];
		block_time 		= json['block_time'];
	
		return this;
	}
	
	@override AddressTransaction create()
	{
		return AddressTransaction();
	}
}

class AddressUTXO extends DartPenance<AddressUTXO>
{
    late String tx_hash;        // "39a7a284c2a0948189dc45dec670211cd4d72f7b66c5726c08d9b3df11e44d58",
    late num output_index;   // 0,
    late List<AddressAccountSum> amount;         // [ { "unit": "lovelace", "quantity": "42000000" } ],
   	late String block;          // "7eb8e27d18686c7db9a18f8bbcfe34e3fed6e047afaa2d969904d15e934847e6",
    late String data_hash;      // "9e478573ab81ea7a8e31891ce0648b81229f408d596a3483e6f4f9b92d3cf710"

	@override AddressUTXO fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		output_index 		= json['output_index'];
		block 		= json['block'];
		data_hash 		= json['data_hash'];
		
		amount = [];
		for(int i = 0 ; i < (json["amount"] as List<dynamic>).length ; i++)
		{
			amount.add(AddressAccountSum().fromJson( (json["amount"] as List<dynamic>)[i] ) ) ;
		}
	
	
		return this;
	}
	
	@override AddressUTXO create()
	{
		return AddressUTXO();
	}
}

class AddressesService extends Service 
{
    AddressesService(network, projectId)
		:super(network, projectId);
    
   
    Future<Address> getAddress(String address)
    {
		Future<http.Response> resp = get("/addresses/$address", null);
	
        return objectFromResp(resp, Address() );
    }
    
   
    Future<AddressExtended> getAddressExtended(String address)
    {
		Future<http.Response> resp = get("/addresses/$address/extended", null);
	
        return objectFromResp(resp, AddressExtended() );
    }
    
  
    Future<AddressTotal> getAddressTotal(String address)
    {
		Future<http.Response> resp = get("/addresses/$address/total", null);
	
		return objectFromResp(resp, AddressTotal() );       
    }
    
  
    Future<List<AddressTotal>> getAddressUTXOs(String address, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/addresses/$address/utxos", createPage(count, page, order));
	
        return listFromResp(resp, AddressTotal() );       

    }
    
   
    Future<List<AddressTotal>> getAddressUTXOsOfAsset(String address, String asset, {int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/addresses/$address/utxos/$asset", createPage(count, page, order));
	
        return listFromResp(resp, AddressTotal() );
    }
    
  
    Future<List<AddressTransaction>> getAddressTransactions(String address,  {int? count, int? page, String? order, int? from, int? to})
    {
		var params = from != null || to != null? Map<String, dynamic>() : null;
		
		if( params != null )
		{
        	if( from != null)
            	params["from"] = from;
        
        	if( to != null) 
            	params["to"] = to;
		}
     
		Future<http.Response> resp = get("/addresses/$address/transactions", createPage(count, page, order), params);
   
        return listFromResp(resp, AddressTransaction() );

    }
    
 
    
}


