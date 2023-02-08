

import './service.dart';

import 'package:http/http.dart' as http;

class Asset extends DartPenance<Asset>
{
    late String asset;      // "b0d07d45fe9514f80213f4020e5a61241458be626841cde717cb38a76e7574636f696e",
    late String quantity;   // "1"

	@override Asset fromJson(Map<String, dynamic> json)
	{
		asset 			= json['asset'];
		quantity 		= json['quantity'];
	
		return this;
	}
	
	@override Asset create()
	{
		return Asset();
	}
	
	bool operator==(Object other) =>
      other is Asset && asset == other.asset && quantity == other.quantity;

  	int get hashCode => Object.hash(asset, quantity);
}

class AssetAddress extends DartPenance<AssetAddress>
{
    late String? address;    // "addr1qxqs59lphg8g6qndelq8xwqn60ag3aeyfcp33c2kdp46a09re5df3pzwwmyq946axfcejy5n4x0y99wqpgtp2gd0k09qsgy6pz",
    late String quantity;   // "1"

	@override AssetAddress fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];
		quantity 		= json['quantity'];
	
		return this;
	}
	
	@override AssetAddress create()
	{
		return AssetAddress();
	}
}

class AssetContent extends DartPenance<AssetContent>
{
    late String asset;                  // "b0d07d45fe9514f80213f4020e5a61241458be626841cde717cb38a76e7574636f696e",
    late String policy_id;              /// "b0d07d45fe9514f80213f4020e5a61241458be626841cde717cb38a7",
    late String? asset_name;             // "6e7574636f696e",
    late String fingerprint;            // "asset1pkpwyknlvul7az0xx8czhl60pyel45rpje4z8w",
    late String quantity;               // "12000",
    late String initial_mint_tx_hash;   // "6804edf9712d2b619edb6ac86861fe93a730693183a262b165fcc1ba1bc99cad",
    late num mint_or_burn_count;     // 1,
    late String? onchain_metadata;       // { "name": "My NFT token", "image": "ipfs://ipfs/QmfKyJ4tuvHowwKQCbCHj4L5T3fSj8cjs7Aau8V7BWv226 },
    late String? metadata;               // { "name": "nutcoin", "description": "The Nut Coin", "ticker": "nutc", "url": "https://www.stakenuts.com/", "logo": "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", "decimals": 6 }

	@override AssetContent fromJson(Map<String, dynamic> json)
	{
		asset 			= json['asset'];
		policy_id 		= json['policy_id'];
		asset_name 		= json['asset_name'];
		fingerprint 		= json['fingerprint'];
		quantity 		= json['quantity'];
		initial_mint_tx_hash 		= json['initial_mint_tx_hash'];
		mint_or_burn_count 		= json['mint_or_burn_count'];
		onchain_metadata 		= json['onchain_metadata'] != null? json["onchain_metadata"].toString() : null;
		metadata 		= json['metadata'] != null? json['metadata'].toString() : null;
	
		return this;
	}
	
	@override AssetContent create()
	{
		return AssetContent();
	}
	
	bool operator==(Object other) =>
      other is AssetContent && asset == other.asset && policy_id == other.policy_id&& asset_name == other.asset_name && fingerprint == other.fingerprint && quantity == other.quantity
		 && initial_mint_tx_hash == other.initial_mint_tx_hash && mint_or_burn_count == other.mint_or_burn_count
			&& onchain_metadata == other.onchain_metadata && metadata == other.metadata;

  	int get hashCode => Object.hash(asset, policy_id, asset_name, fingerprint, quantity, initial_mint_tx_hash, mint_or_burn_count, onchain_metadata, metadata);
}

class AssetHistory extends DartPenance<AssetHistory>
{
    late String tx_hash;    //: "2dd15e0ef6e6a17841cb9541c27724072ce4d4b79b91e58432fbaa32d9572531",
    late String amount;     //: "10",
    late String action;     //: "minted"

	@override AssetHistory fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		amount 		= json['amount'];
		action 		= json['action'];
	
		return this;
	}
	
	@override AssetHistory create()
	{
		return AssetHistory();
	}
	
	bool operator==(Object other) =>
      other is AssetHistory && tx_hash == other.tx_hash && amount == other.amount && action == other.action;

  	int get hashCode => Object.hash(tx_hash, amount, action);
}

class AssetTransaction extends DartPenance<AssetTransaction>
{
     late String  tx_hash;        //: "8788591983aa73981fc92d6cddbbe643959f5a784e84b8bee0db15823f575a5b",
    late num tx_index;       // 6,
    late num block_height;   // 69,
    late num block_time;     // 163550589

	@override AssetTransaction fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		tx_index 		= json['tx_index'];
		block_height 		= json['block_height'];
		block_time 		= json['block_time'];
	
		return this;
	}
	
	@override AssetTransaction create()
	{
		return AssetTransaction();
	}
	
	bool operator==(Object other) =>
      other is AssetTransaction && tx_hash == other.tx_hash && tx_index == other.tx_index && block_height == other.block_height && block_time == other.block_time;

  	int get hashCode => Object.hash(tx_hash, tx_index, block_height, block_time);
}

///Cardano - Assets
class AssetsService extends Service 
{
    AssetsService(network, projectId)
		:super(network, projectId);
    
	///List of assets. If an asset is completely burned, it will stay on the list with quantity 0 (order of assets is immutable).
    Future<List<Asset>> getAssetList( {int? count, int? page, String? order} )
    {
		Future<http.Response> resp = get("/assets", createPage(count, page, order));
	
		return listFromResp(resp, Asset() );
    }
    
    ///Information about a specific asset
    Future<AssetContent> getAsset(String asset)
    {
		Future<http.Response> resp = get("/assets/$asset", null);
	
        return objectFromResp(resp, AssetContent() );
    }
    
    ///History of a specific asset
    Future<List<AssetHistory>> getAssetHistory(String asset, {int? count, int? page, String? order} )
    {
		Future<http.Response> resp = get("/assets/$asset/history", createPage(count, page, order));
	
        return listFromResp(resp, AssetHistory() );
    }
   
    ///List of a specific asset transactions
   	Future<List<AssetTransaction>> getAssetTransactions(String asset, {int? count, int? page, String? order} )
    {
		Future<http.Response> resp = get("/assets/$asset/transactions", createPage(count, page, order));
	
        return listFromResp(resp, AssetTransaction() );
    }
    
    ///List of a addresses containing a specific asset
  	Future<List<AssetAddress>> getAssetByAddresses(String asset, {int? count, int? page, String? order} )
    {
		Future<http.Response> resp = get("/assets/$asset/addresses", createPage(count, page, order));
	
        return listFromResp(resp, AssetAddress() );
    }
    
    ///List of asset minted under a specific policy
    Future<List<AssetAddress>> getAssetsByPolicy(String policy_id, {int? count, int? page, String? order} )
    {
		Future<http.Response> resp = get("/assets/policy/$policy_id", createPage(count, page, order));
	
        return listFromResp(resp, AssetAddress() );
    }
    
    
    
}




