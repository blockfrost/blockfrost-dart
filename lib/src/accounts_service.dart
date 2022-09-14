
import './service.dart';

import 'package:http/http.dart' as http;

class AccountAsset extends DartPenance<AccountAsset>
{
    late String unit;       //: "d5e6bf0500378d4f0da4e8dde6becec7621cd8cbf5cbb9b87013d4cc537061636542756433343132",
    late String quantity;   //: "1"

	@override AccountAsset fromJson(Map<String, dynamic> json)
	{
		unit 			= json['unit'];
		quantity 		= json['quantity'];
	
		return this;
	}
	
	@override AccountAsset create()
	{
		return AccountAsset();
	}
}

class AccountAssociatedAddress extends DartPenance<AccountAssociatedAddress>
{
    late String address;    //: "addr1qx2kd28nq8ac5prwg32hhvudlwggpgfp8utlyqxu6wqgz62f79qsdmm5dsknt9ecr5w468r9ey0fxwkdrwh08ly3tu9sy0f4qd"
	
	@override AccountAssociatedAddress fromJson(Map<String, dynamic> json)
	{
		address 			= json['address'];

	
		return this;
	}
	
	@override AccountAssociatedAddress create()
	{
		return AccountAssociatedAddress();
	}
}

class AccountContent extends DartPenance<AccountContent>
{
    late String stake_address;          // "stake1ux3g2c9dx2nhhehyrezyxpkstartcqmu9hk63qgfkccw5rqttygt7",
    late bool  active;                 // true,
    late num  active_epoch;           // 412,
    late String controlled_amount;      // "619154618165",
    late String rewards_sum;            // "319154618165",
    late String withdrawals_sum;        // "12125369253",
    late String reserves_sum;           // "319154618165",
    late String treasury_sum;           // "12000000",
    late String withdrawable_amount;    // "319154618165",
    late String pool_id;                // "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"

	@override AccountContent fromJson(Map<String, dynamic> json)
	{
		stake_address 			= json['stake_address'];
		active 		= json['active'];
		active_epoch 		= json['active_epoch'];
		controlled_amount 		= json['controlled_amount'];
		rewards_sum 		= json['rewards_sum'];
		withdrawals_sum 		= json['withdrawals_sum'];
		reserves_sum 		= json['reserves_sum'];
		treasury_sum 		= json['treasury_sum'];
		withdrawable_amount 		= json['withdrawable_amount'];
		pool_id 		= json['pool_id'];
		

		return this;
	}
	
	@override AccountContent create()
	{
		return AccountContent();
	}
}

class AccountDelegationHistory extends DartPenance<AccountDelegationHistory>
{
    late num active_epoch;   // : 210,
    late String tx_hash;        //  "2dd15e0ef6e6a17841cb9541c27724072ce4d4b79b91e58432fbaa32d9572531",
    late  String amount;         //  "12695385",
    late String pool_id;        //  "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"

	@override AccountDelegationHistory fromJson(Map<String, dynamic> json)
	{
		active_epoch 			= json['active_epoch'];
		tx_hash 		= json['tx_hash'];
		amount 		= json['amount'];
		pool_id 		= json['pool_id'];
	
		return this;
	}
	
	@override AccountDelegationHistory create()
	{
		return AccountDelegationHistory();
	}
}

class AccountHistory extends DartPenance<AccountHistory>
{
    late num active_epoch;   // 210,
    late String amount;         // "12695385",
    late String pool_id;        // "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy"

	@override AccountHistory fromJson(Map<String, dynamic> json)
	{
		active_epoch 			= json['active_epoch'];
		amount 		= json['amount'];
		pool_id 		= json['pool_id'];
	
		return this;
	}
	
	@override AccountHistory create()
	{
		return AccountHistory();
	}
}


class AccountMirHistory extends DartPenance<AccountMirHistory>
{
    late String tx_hash;    //: "69705bba1d687a816ff5a04ec0c358a1f1ef075ab7f9c6cc2763e792581cec6d",
    late String amount;     //: "2193707473"

	@override AccountMirHistory fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		amount 		= json['amount'];
	
		return this;
	}
	
	@override AccountMirHistory create()
	{
		return AccountMirHistory();
	}
}

class AccountRegistrationHistory extends DartPenance<AccountRegistrationHistory>
{
    late String tx_hash;    //: "2dd15e0ef6e6a17841cb9541c27724072ce4d4b79b91e58432fbaa32d9572531",
    late String action;     //: "registered"

	@override AccountRegistrationHistory fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		action 		= json['action'];
	
		return this;
	}
	
	@override AccountRegistrationHistory create()
	{
		return AccountRegistrationHistory();
	}
}

class AccountRewardHistory extends DartPenance<AccountRewardHistory>
{
    late num epoch;      // 215,
    late String amount;     //"12695385",
    late String pool_id;    // "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy",
    late String type;       // "member"

	@override AccountRewardHistory fromJson(Map<String, dynamic> json)
	{
		epoch 			= json['epoch'];
		amount 		= json['amount'];
		pool_id 		= json['pool_id'];
		type 		= json['type'];
	
		return this;
	}
	
	@override AccountRewardHistory create()
	{
		return AccountRewardHistory();
	}
}

class AccountSum extends DartPenance<AccountSum>
{
    late String unit;       //: "lovelace",
    late String quantity;   //: "42000000"

	@override AccountSum fromJson(Map<String, dynamic> json)
	{
		unit 			= json['unit'];
		quantity 		= json['quantity'];
	
		return this;
	}
	
	@override AccountSum create()
	{
		return AccountSum();
	}
}

class AccountTotal extends DartPenance<AccountTotal>
{
    
    late String stake_address;  //: "stake1u9l5q5jwgelgagzyt6nuaasefgmn8pd25c8e9qpeprq0tdcp0e3uk",
    
    late List<AccountSum> received_sum;   // : [ { "unit": "lovelace", "quantity": "42000000" },
    
    late List<AccountSum> sent_sum;       // : [ { "unit": "lovelace", "quantity": "42000000" },
    
    late num tx_count;       //: 12

	@override AccountTotal fromJson(Map<String, dynamic> json)
	{
		stake_address 			= json['stake_address'];
		tx_count 		= json['tx_count'];
		
		received_sum = [];
		for(int i = 0 ; i < (json["received_sum"] as List<dynamic>).length ; i++)
		{
			received_sum.add(AccountSum().fromJson( (json["received_sum"] as List<dynamic>)[i] ) ) ;
		}
		
		sent_sum = [];
		for(int i = 0 ; i < (json["sent_sum"] as List<dynamic>).length ; i++)
		{
			received_sum.add(AccountSum().fromJson( (json["sent_sum"] as List<dynamic>)[i] ) ) ;
		}
		
		return this;
	}
	
	@override AccountTotal create()
	{
		return AccountTotal();
	}
}

class AccountWithdrawalHistory extends DartPenance<AccountWithdrawalHistory>
{
    late String tx_hash;    //: "48a9625c841eea0dd2bb6cf551eabe6523b7290c9ce34be74eedef2dd8f7ecc5",
    late String amount;     //: "454541212442"

	@override AccountWithdrawalHistory fromJson(Map<String, dynamic> json)
	{
		tx_hash 			= json['tx_hash'];
		amount 		= json['amount'];
	
		return this;
	}
	
	@override AccountWithdrawalHistory create()
	{
		return AccountWithdrawalHistory();
	}
}

class AccountsService extends Service 
{
     AccountsService(network, projectId)
		:super(network, projectId);
    
    Future<AccountContent> getAccount(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address");
	
        return objectFromResp(resp, AccountContent() );

    }
    
   
    Future<List<AccountRewardHistory>> getAccountRewardHistory(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address/rewards");
	
        return listFromResp(resp, AccountRewardHistory() );
        
        
    }
    
   
    Future<List<AccountHistory>> getAccountHistory(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address/history");
	
        return listFromResp(resp, AccountHistory() );
    }
    
  
    Future<List<AccountDelegationHistory>> getAccountDelegationHistory(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address/delegations");
        
		return listFromResp(resp, AccountDelegationHistory() );
    }
    
  
    Future<List<AccountRegistrationHistory>> getAccountRegistrationHistory(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address/registrations");
		
		return listFromResp(resp, AccountRegistrationHistory() );
    }
    

    Future<List<AccountWithdrawalHistory>> getAccountWithdrawalHistory(String stake_address) 
    {
		Future<http.Response> resp = get("/accounts/$stake_address/withdrawals");
	
        return listFromResp(resp, AccountWithdrawalHistory() );
    }
    
  
    Future<List<AccountMirHistory>> getAccountMirHistory(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address/mirs");
	
        return listFromResp(resp, AccountMirHistory() );
    }
    
   
    Future<List<AccountAssociatedAddress>> getAccountAssociatedAddresses(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address/addresses");
	
		return listFromResp(resp, AccountAssociatedAddress() );
    }
    
   
    Future<List<AccountAsset>> getAccountAssociatedAssets(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address/addresses/assets");
	
        return listFromResp(resp, AccountAsset() );
    }
    
  
    Future<AccountTotal> getAccountAssociatedAddressesTotal(String stake_address)
    {
		Future<http.Response> resp = get("/accounts/$stake_address/addresses/total");
	
		return objectFromResp(resp, AccountTotal() );
    }
    
    
}











