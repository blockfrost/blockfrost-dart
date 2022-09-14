
import './service.dart';

import 'package:http/http.dart' as http;

class BlockAddress extends DartPenance<BlockAddress>
{
    late String address;        // "addr1q9ld26v2lv8wvrxxmvg90pn8n8n5k6tdst06q2s856rwmvnueldzuuqmnsye359fqrk8hwvenjnqultn7djtrlft7jnq7dy7wv",
   	late List<BlockTransaction> transactions;   //  [ { "tx_hash": "1a0570af966fb355a7160e4f82d5a80b8681b7955f5d44bec0dce628516157f0" } ]

	@override BlockAddress fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		
		transactions = [];
		for(int i = 0 ; i < (json["transactions"] as List<dynamic>).length ; i++)
		{
			transactions.add(BlockTransaction().fromJson( (json["transactions"] as List<dynamic>)[i] ) ) ;
		}
      

		return this;
	}
	
	@override BlockAddress create()
	{
		return BlockAddress();
	}
}

class BlockContent extends DartPenance<BlockContent>
{
    
    late num time;           //1641338934,
    late num height;         //15243593,
    late String hash;           //"4ea1ba291e8eef538635a53e59fddba7810d1679631cc3aed7c8e6c4091a516a",
    late num slot;           //412162133,
    late num epoch;          //425,
    late num epoch_slot;     //12,
    late String slot_leader;    //"pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2qnikdy",
    late num size;           //3,
    late num tx_count;       //1,
    late String? output;         //"128314491794",
    late String? fees;           //"592661",
    late String block_vrf;      //"vrf_vk1wf2k6lhujezqcfe00l6zetxpnmh9n6mwhpmhm0dvfh3fxgmdnrfqkms8ty",
    late String? previous_block; //"43ebccb3ac72c7cebd0d9b755a4b08412c9f5dcb81b8a0ad1e3c197d29d47b05",
    late String? next_block;     //"8367f026cf4b03e116ff8ee5daf149b55ba5a6ec6dec04803b8dc317721d15fa",
    late num confirmations;  //4698

	@override BlockContent fromJson(Map<String, dynamic> json)
	{
		time 			= json['time'];
        height 			= json['height'];
		hash 			= json['hash'];
	    slot 			= json['slot'];
	    epoch 			= json['epoch'];
	    epoch_slot 		= json['epoch_slot'];
	    slot_leader 	= json['slot_leader'];
	    size			= json['size'];
	    tx_count 		= json['tx_count'];
	    output 			= json['output'];
	    fees 			= json['fees'];
	    block_vrf 		= json['block_vrf'];
	    previous_block 	= json['previous_block'];
	    next_block 		= json['next_block'];
	    confirmations	= json['confirmations'];
	
		return this;
	}
	
	@override BlockContent create()
	{
		return BlockContent();
	}
      
}


class BlockTransaction extends DartPenance<BlockTransaction>
{
    late String tx_hash; // "1a0570af966fb355a7160e4f82d5a80b8681b7955f5d44bec0dce628516157f0"

	@override BlockTransaction fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		
		return this;
	}
	
	@override BlockTransaction create()
	{
		return BlockTransaction();
	}
}



class BlockService extends Service 
{
    BlockService(network, projectId)
		:super(network, projectId);
 
    Future<BlockContent> getLatestBlock()
    {
		Future<http.Response> resp = get("/blocks/latest");
        
        return objectFromResp(resp, BlockContent() );
    }
    

    Future<List<String>> getLatestBlockTransactions()
    {
		Future<http.Response> resp = get("/blocks/latest/txs");
		
		return listOfStringFromResp(resp);
    }
  
    Future<BlockContent> getBlock(String hash_or_number)
    {
		Future<http.Response> resp = get("/blocks/$hash_or_number");
	        
        return objectFromResp(resp, BlockContent() );
    }
    
 
    Future<List<BlockContent>> listNextBlocks(String hash_or_number)             
    {
		Future<http.Response> resp = get("/blocks/$hash_or_number/next");
	
        return listFromResp(resp, BlockContent() );
    }
    

    Future<List<BlockContent>> listPreviousBlocks(String hash_or_number)
    {
		Future<http.Response> resp = get("/blocks/$hash_or_number/previous");

		return listFromResp(resp, BlockContent() ); 
    }
    

    Future<BlockContent> getSpecificBlockInSlot(int slot) 
    {
		Future<http.Response> resp = get("/blocks/slot/$slot");
	
        return objectFromResp(resp, BlockContent() );
    }
    
 
    Future<BlockContent> getSpecificBlockInSlotInEpoch(int slot, int epoch) 
    {
		Future<http.Response> resp = get("/blocks/epoch/$epoch/slot/$slot");
	
		return objectFromResp(resp, BlockContent() );
    }
    
 
    Future<List<String>> getBlockTransactions(dynamic hash_or_number) 
    {
		Future<http.Response> resp = get("/blocks/$hash_or_number/txs");
	        
        return listOfStringFromResp(resp);
    }
    
   

    Future<List<BlockAddress>> getAddressesAffectedInBlock(hash_or_number)
    {
		Future<http.Response> resp = get("/blocks/$hash_or_number/addresses");
	
        return listFromResp<BlockAddress>(resp, BlockAddress() ); 
    }
}


