

import './service.dart';

import 'package:http/http.dart' as http;


class Transaction extends DartPenance<Transaction>
{
    late String hash;               // "1e043f100dce12d107f679685acd2fc0610e10f72a92d412794c9773d11d8477",
    late String block;              // "356b7d7dbb696ccd12775c016941057a9dc70898d87a63fc752271bb46856940",
    late num block_height;       // 123456,
    late num block_time;         // 1635505891,
    late num slot;               // 42000000,
    late num index;              // 1,
    late List<TransactionAmount> output_amount;      // [ { "unit": "lovelace", "quantity": "42000000" }, { "unit": "b0d07d45fe9514f80213f4020e5a61241458be626841cde717cb38a76e7574636f696e", "quantity": "12" } ],
    late String fees;               // "182485",
    late String deposit;            // "0",
    late num size;               // 433,
    late dynamic? invalid_before;     // null,
    late String?  invalid_hereafter;  // "13885913",
    late num utxo_count;         // 4,
    late num withdrawal_count;   // 0,
    late num mir_cert_count;     // 0,
    late num delegation_count;   // 0,
    late num stake_cert_count;   // 0,
    late num pool_update_count;  // 0,
    late num pool_retire_count;  // 0,
    late num asset_mint_or_burn_count;// 0,
    late num redeemer_count;     // 0,
    late bool valid_contract;     // true

	@override Transaction fromJson(Map<String, dynamic> json)
	{
		hash 			= json['hash'];
		block 			= json['block'];
		block_height 			= json['block_height'];
		block_time 			= json['block_time'];
		slot 			= json['slot'];
		index 			= json['index'];
		fees 			= json['fees'];
		deposit 			= json['deposit'];
		size 			= json['size'];
		invalid_before 			= json['invalid_before'];
		invalid_hereafter 			= json['invalid_hereafter'];
		utxo_count 			= json['utxo_count'];
		withdrawal_count 			= json['withdrawal_count'];
		mir_cert_count 			= json['mir_cert_count'];
		delegation_count 			= json['delegation_count'];
		stake_cert_count 			= json['stake_cert_count'];
		pool_update_count 			= json['pool_update_count'];
		pool_retire_count 			= json['pool_retire_count'];
		asset_mint_or_burn_count 			= json['asset_mint_or_burn_count'];
		redeemer_count 			= json['redeemer_count'];
		valid_contract 			= json['valid_contract'];
		
		output_amount = [];
		for(int i = 0 ; i < (json["output_amount"] as List<dynamic>).length ; i++)
		{
			output_amount.add(TransactionAmount().fromJson( (json["output_amount"] as List<dynamic>)[i] ) ) ;
		}

		return this;
	}
	
	@override Transaction create()
	{
		return Transaction();
	}
	
	bool operator==(Object other) =>
      other is Transaction && hash == other.hash && block == other.block  && block_height == other.block_height  && block_time == other.block_time  && slot == other.slot  && index == other.index  && fees == other.fees
		&& deposit == other.deposit && size == other.size  && invalid_before == other.invalid_before  && invalid_hereafter == other.invalid_hereafter  && utxo_count == other.utxo_count  && withdrawal_count == other.withdrawal_count  && mir_cert_count == other.mir_cert_count
		&& delegation_count == other.delegation_count && stake_cert_count == other.stake_cert_count  && pool_update_count == other.pool_update_count  && pool_retire_count == other.pool_retire_count 
		 && asset_mint_or_burn_count == other.asset_mint_or_burn_count  && redeemer_count == other.redeemer_count  && valid_contract == other.valid_contract && output_amount == other.output_amount;

  	int get hashCode => Object.hash(hash, block, block_height, block_time, slot, index, output_amount, fees, deposit, size, invalid_before, invalid_hereafter, 
			utxo_count, withdrawal_count, mir_cert_count, delegation_count, stake_cert_count, pool_update_count, pool_retire_count, asset_mint_or_burn_count);
}

class TransactionAddressCertificate extends DartPenance<TransactionAddressCertificate>
{
    late num cert_index;     // 0,
    late String address;        // "stake1u9t3a0tcwune5xrnfjg4q7cpvjlgx9lcv0cuqf5mhfjwrvcwrulda",
    late bool registration;   // true
  
	@override TransactionAddressCertificate fromJson(Map<String, dynamic> json)
	{
		cert_index 			= json['cert_index'];
		address 			= json['address'];
		registration 			= json['registration'];

		return this;
	}
	
	@override TransactionAddressCertificate create()
	{
		return TransactionAddressCertificate();
	}
}

class TransactionAmount extends DartPenance<TransactionAmount>
{
    late String unit;       // "lovelace"
    late String quantity;   // "42000000"

	@override TransactionAmount fromJson(Map<String, dynamic> json)
	{
		unit 			= json['unit'];
		quantity 			= json['quantity'];

		return this;
	}
	
	@override TransactionAmount create()
	{
		return TransactionAmount();
	}
	
	bool operator==(Object other) =>
      other is TransactionAmount && unit == other.unit && quantity == other.quantity;

  	int get hashCode => Object.hash(unit, quantity);
}


class TransactionDelegationCertificate extends DartPenance<TransactionDelegationCertificate>
{
    late num index;          // 0,
    late num cert_index;     // 0,
    late String address;        // "stake1u9r76ypf5fskppa0cmttas05cgcswrttn6jrq4yd7jpdnvc7gt0yc",
    late String pool_id;        // "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy",
    late num active_epoch;   // 210
  
	@override TransactionDelegationCertificate fromJson(Map<String, dynamic> json)
	{
		index 			= json['index'];
		cert_index 			= json['cert_index'];
		address 			= json['address'];
		pool_id 			= json['pool_id'];
		active_epoch 			= json['active_epoch'];

		return this;
	}
	
	@override TransactionDelegationCertificate create()
	{
		return TransactionDelegationCertificate();
	}
}

class TransactionMetadata extends DartPenance<TransactionMetadata>
{
    late String label;              // "1967",
    late dynamic json_metadata;      // { "metadata": "https://nut.link/metadata.json", "hash": "6bf124f217d0e5a0a8adb1dbd8540e1334280d49ab861127868339f43b3948af" }

	@override TransactionMetadata fromJson(Map<String, dynamic> json)
	{
		label 			= json['label'];
		json_metadata 			= json['json_metadata'];

		return this;
	}
	
	@override TransactionMetadata create()
	{
		return TransactionMetadata();
	}
}

class TransactionMetadataCBOR extends DartPenance<TransactionMetadataCBOR>
{
    late String label;          // "1968",
    late String? cbor_metadata;  // "\\xa100a16b436f6d62696e6174696f6e8601010101010c",
    late String? metadata;       // "a100a16b436f6d62696e6174696f6e8601010101010c"

	@override TransactionMetadataCBOR fromJson(Map<String, dynamic> json)
	{
		label 			= json['label'];
		cbor_metadata 			= json['cbor_metadata'];
		metadata 			= json['metadata'];

		return this;
	}
	
	@override TransactionMetadataCBOR create()
	{
		return TransactionMetadataCBOR();
	}
}

class TransactionMir extends DartPenance<TransactionMir>
{
    late String pot;            // "reserve",
    late num cert_index;     // 0,
    late String address;        // "stake1u9r76ypf5fskppa0cmttas05cgcswrttn6jrq4yd7jpdnvc7gt0yc",
    late String amount;         // "431833601"

	@override TransactionMir fromJson(Map<String, dynamic> json)
	{
		pot 			= json['pot'];
		cert_index 			= json['cert_index'];
		address 			= json['address'];
		amount 			= json['amount'];

		return this;
	}
	
	@override TransactionMir create()
	{
		return TransactionMir();
	}
  
}

class TransactionRedeemer extends DartPenance<TransactionRedeemer>
{
    late num tx_index;       // 0,
    late String purpose;        // "spend",
    late String  script_hash;    // "ec26b89af41bef0f7585353831cb5da42b5b37185e0c8a526143b824",
    late String datum_hash;     // "923918e403bf43c34b4ef6b48eb2ee04babed17320d8d1b9ff9ad086e86f44ec",
    late String unit_mem;       // "1700",
    late String  unit_steps;     // "476468",
    late String fee;            // "172033"

	@override TransactionRedeemer fromJson(Map<String, dynamic> json)
	{
		tx_index 			= json['tx_index'];
		purpose 			= json['purpose'];
		script_hash 			= json['script_hash'];
		datum_hash 			= json['datum_hash'];
		unit_mem 			= json['unit_mem'];
		unit_steps 			= json['unit_steps'];
		fee 			= json['fee'];

		return this;
	}
	
	@override TransactionRedeemer create()
	{
		return TransactionRedeemer();
	}
}

class TransactionRegistrationAndUpdateCertificate extends DartPenance<TransactionRegistrationAndUpdateCertificate>
{
    late num cert_index;     // 0,
    late String pool_id;        // "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy",
    late String vrf_key;        // "0b5245f9934ec2151116fb8ec00f35fd00e0aa3b075c4ed12cce440f999d8233",
    late String pledge;         // "5000000000",
    late num margin_cost;    // 0.05,
    late String fixed_cost;     // "340000000",
    late String reward_account; // "stake1uxkptsa4lkr55jleztw43t37vgdn88l6ghclfwuxld2eykgpgvg3f",
    late List<String> owners;         // [],
    late TransactionRegistrationAndUpdateCertificateMetadata? metadata;       // {},
    late List<TransactionRegistrationAndUpdateCertificateRelay> relays;         // [],
    late num active_epoch;   // 210


	@override TransactionRegistrationAndUpdateCertificate fromJson(Map<String, dynamic> json)
	{
		cert_index 			= json['cert_index'];
		pool_id 			= json['pool_id'];
		vrf_key 			= json['vrf_key'];
		pledge 			= json['pledge'];
		margin_cost 			= json['margin_cost'];
		fixed_cost 			= json['fixed_cost'];
		reward_account 			= json['reward_account'];
		
		owners = [];
		for(int i = 0 ; i < (json["owners"] as List<dynamic>).length ; i++)
		{
			owners.add( (json["owners"] as List<dynamic>)[i] ) ;
		}

		
		metadata = TransactionRegistrationAndUpdateCertificateMetadata().fromJson( json['metadata'] );
		
		relays = [];
		for(int i = 0 ; i < (json["relays"] as List<dynamic>).length ; i++)
		{
			relays.add(TransactionRegistrationAndUpdateCertificateRelay().fromJson( (json["relays"] as List<dynamic>)[i] ) ) ;
		}
		
		active_epoch 			= json['active_epoch'];

		return this;
	}
	
	@override TransactionRegistrationAndUpdateCertificate create()
	{
		return TransactionRegistrationAndUpdateCertificate();
	}
}

class TransactionRegistrationAndUpdateCertificateMetadata extends DartPenance<TransactionRegistrationAndUpdateCertificateMetadata>
{
    late String url;        // "https://stakenuts.com/mainnet.json",
    late String hash;       // "47c0c68cb57f4a5b4a87bad896fc274678e7aea98e200fa14a1cb40c0cab1d8c",
    late String ticker;     // "NUTS",
    late String name;       // "Stake Nuts",
    late String description;// "The best pool ever",
    late String homepage;   // "https://stakentus.com/"

	@override TransactionRegistrationAndUpdateCertificateMetadata fromJson(Map<String, dynamic> json)
	{
		url 			= json['url'];
		hash 			= json['hash'];
		ticker 			= json['ticker'];
		name 			= json['name'];
		description 			= json['description'];
		homepage 			= json['homepage'];

		return this;
	}
	
	@override TransactionRegistrationAndUpdateCertificateMetadata create()
	{
		return TransactionRegistrationAndUpdateCertificateMetadata();
	}
}

class TransactionRegistrationAndUpdateCertificateRelay extends DartPenance<TransactionRegistrationAndUpdateCertificateRelay>
{
    late String ipv4;       // "4.4.4.4",
    late String ipv6;       // "https://stakenuts.com/mainnet.json",
    late String dns;        // "relay1.stakenuts.com",
    late String dns_srv;    // "_relays._tcp.relays.stakenuts.com",
    late num port;       // 3001

	@override TransactionRegistrationAndUpdateCertificateRelay fromJson(Map<String, dynamic> json)
	{
		ipv4 			= json['ipv4'];
		ipv6 			= json['ipv6'];
		dns 			= json['dns'];
		dns_srv 			= json['dns_srv'];
		port 			= json['port'];

		return this;
	}
	
	@override TransactionRegistrationAndUpdateCertificateRelay create()
	{
		return TransactionRegistrationAndUpdateCertificateRelay();
	}
}

class TransactionRetirementCertificate extends DartPenance<TransactionRetirementCertificate>
{
    late num cert_index;     // 0,
    late String pool_id;        // "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy",
    late num retiring_epoch; // 216

	@override TransactionRetirementCertificate fromJson(Map<String, dynamic> json)
	{
		cert_index 			= json['cert_index'];
		pool_id 			= json['pool_id'];
		retiring_epoch 			= json['retiring_epoch'];

		return this;
	}
	
	@override TransactionRetirementCertificate create()
	{
		return TransactionRetirementCertificate();
	}
}


class TransactionUTXOInput extends DartPenance<TransactionUTXOInput>
{
    late String address;        // "addr1q9ld26v2lv8wvrxxmvg90pn8n8n5k6tdst06q2s856rwmvnueldzuuqmnsye359fqrk8hwvenjnqultn7djtrlft7jnq7dy7wv",
    late List<TransactionAmount> amount;         // [ { "unit": "lovelace", "quantity": "42000000" }, ],
    late String tx_hash;        // "1a0570af966fb355a7160e4f82d5a80b8681b7955f5d44bec0dce628516157f0",
    late num output_index;   // 0,
    late String? data_hash;      // "9e478573ab81ea7a8e31891ce0648b81229f408d596a3483e6f4f9b92d3cf710",
    late bool collateral;     // false

	@override TransactionUTXOInput fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		tx_hash 			= json['tx_hash'];
		output_index 			= json['output_index'];
		data_hash 			= json['data_hash'];
		collateral 			= json['collateral'];
		
		amount = [];
		for(int i = 0 ; i < (json["amount"] as List<dynamic>).length ; i++)
		{
			amount.add(TransactionAmount().fromJson( (json["amount"] as List<dynamic>)[i] ) ) ;
		}

		return this;
	}
	
	@override TransactionUTXOInput create()
	{
		return TransactionUTXOInput();
	}
	
	bool operator==(Object other) =>
      other is TransactionUTXOInput && address == other.address && amount == other.amount  && tx_hash == other.tx_hash && output_index == other.output_index && data_hash == other.data_hash && collateral == other.collateral;
	
  	int get hashCode => Object.hash(address, amount, tx_hash, output_index, data_hash, collateral );
}

class TransactionUTXOOutput extends DartPenance<TransactionUTXOOutput>
{
    late String address;        // "addr1q9ld26v2lv8wvrxxmvg90pn8n8n5k6tdst06q2s856rwmvnueldzuuqmnsye359fqrk8hwvenjnqultn7djtrlft7jnq7dy7wv",
    late List<TransactionAmount> amount;         // [ {"unit": "lovelace", "quantity": "42000000" }, ],
    late num output_index;   // 0,
    late String? data_hash;      // "9e478573ab81ea7a8e31891ce0648b81229f408d596a3483e6f4f9b92d3cf710"

	@override TransactionUTXOOutput fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		output_index 			= json['output_index'];
		data_hash 			= json['data_hash'];
		
		amount = [];
		for(int i = 0 ; i < (json["amount"] as List<dynamic>).length ; i++)
		{
			amount.add(TransactionAmount().fromJson( (json["amount"] as List<dynamic>)[i] ) ) ;
		}
		
		return this;
	}
	
	@override TransactionUTXOOutput create()
	{
		return TransactionUTXOOutput();
	}
	
		bool operator==(Object other) =>
      other is TransactionUTXOOutput && address == other.address && amount == other.amount  && output_index == other.output_index && data_hash == other.data_hash;
	
  	int get hashCode => Object.hash(address, amount, output_index, data_hash); 
  
}

class TransactionUTXOs extends DartPenance<TransactionUTXOs>
{
    late String hash;       // "1e043f100dce12d107f679685acd2fc0610e10f72a92d412794c9773d11d8477",
    late List<TransactionUTXOInput> inputs;
    late List<TransactionUTXOOutput> outputs;

	@override TransactionUTXOs fromJson(Map<String, dynamic> json)
	{
		hash 			= json['hash'];

		inputs = [];
		for(int i = 0 ; i < (json["inputs"] as List<dynamic>).length ; i++)
		{
			inputs.add(TransactionUTXOInput().fromJson( (json["inputs"] as List<dynamic>)[i] ) ) ;
		}
		
		outputs = [];
		for(int i = 0 ; i < (json["outputs"] as List<dynamic>).length ; i++)
		{
			outputs.add(TransactionUTXOOutput().fromJson( (json["outputs"] as List<dynamic>)[i] ) ) ;
		}

		return this;
	}
	
	@override TransactionUTXOs create()
	{
		return TransactionUTXOs();
	}
	
	bool operator==(Object other) =>
      other is TransactionUTXOs && hash == other.hash && inputs == other.inputs  && outputs == other.outputs;
	
  	int get hashCode => Object.hash(hash, inputs, outputs); 
			
}

class TransactionWithdrawal extends DartPenance<TransactionWithdrawal>
{
    late String address;    // "stake1u9r76ypf5fskppa0cmttas05cgcswrttn6jrq4yd7jpdnvc7gt0yc",
    late String amount;     // "431833601"

	@override TransactionWithdrawal fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		amount 			= json['amount'];

		return this;
	}
	
	@override TransactionWithdrawal create()
	{
		return TransactionWithdrawal();
	}
  
}

///Cardano - Transactions
class TransactionsService extends Service 
{
	TransactionsService(network, projectId)
		:super(network, projectId);
   
    ///Return content of the requested transaction.
    Future<Transaction> getTransaction(String hash) 
    {
		Future<http.Response> resp = get("/txs/$hash", null);
	
        return objectFromResp(resp, Transaction() );

    }
    
    ///Return the inputs and UTXOs of the specific transaction.
    Future<TransactionUTXOs> getTransactionUTXOs(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/utxos", null);
	
        
		return objectFromResp(resp, TransactionUTXOs() );
    }
    
    ///Obtain information about (de)registration of stake addresses within a transaction.
    Future<List<TransactionAddressCertificate>> getTransactionStakeAddressCertificates(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/stakes", null);
	
        return listFromResp(resp, TransactionAddressCertificate() );
    }
    
    ///Obtain information about delegation certificates of a specific transaction.
    Future<List<TransactionDelegationCertificate>> getTransactionDelegationCertificates(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/delegations", null);
	
        return listFromResp(resp, TransactionDelegationCertificate() );
    }
  
    ///Obtain information about withdrawals of a specific transaction.
    Future<List<TransactionWithdrawal>> getTransactionWithdrawals(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/withdrawals", null);
	
		return listFromResp(resp, TransactionWithdrawal() );
    }
    
    ///Obtain information about Move Instantaneous Rewards (MIRs) of a specific transaction.
    Future<List<TransactionMir>> getTransactionMIRs(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/mirs", null);
	
		return listFromResp(resp, TransactionMir() );
    }
   
    ///Obtain information about stake pool registration and update certificates of a specific transaction.
    Future<List<TransactionRegistrationAndUpdateCertificate>> getTransactionStakePoolUpdateCertificates(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/pool_updates", null);
		
		return listFromResp(resp, TransactionRegistrationAndUpdateCertificate() );
    }
    
    ///Obtain information about stake pool retirements within a specific transaction. 
    Future<List<TransactionRetirementCertificate>> getTransactionStakePoolRetirementCertificates(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/pool_retires", null);
	
        return listFromResp(resp, TransactionRetirementCertificate() );
    }
    
    ///Obtain the transaction metadata.
    Future<List<TransactionMetadata>> getTransactionMetadata(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/metadata", null);
	
		return listFromResp(resp, TransactionMetadata() );
    }
    
    ///Obtain the transaction metadata in CBOR.
    Future<List<TransactionMetadataCBOR>> getTransactionMetadataAsCBOR(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/metadata/cbor", null);
	
		return listFromResp(resp, TransactionMetadataCBOR() );
    }
    
    ///Obtain the transaction redeemers.
    Future<List<TransactionRedeemer>> getTransactionRedeemers(String hash)
    {
		Future<http.Response> resp = get("/txs/$hash/redeemers", null);
	
        return listFromResp(resp, TransactionRedeemer() );
    }
    
    ///Submit an already serialized transaction to the network.
	Future<String> submitTransaction(Stream<List<int>> cbor)
    {
		Future<http.StreamedResponse> resp = postData("/tx/submit", cbor, null, {"Content-Type": "application/cbor" });
	
		return stringFromRespStreamed(resp);
    }
    
    
 
   
}


