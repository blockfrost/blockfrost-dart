
import 'package:test/test.dart';

import 'dart:convert';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

void main()
{
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	AssetsService service = AssetsService(Service.networkCardanoMainnet, projectId);
	
	String asset_id = '00000002df633853f6a47465c9496721d2d5b1291b8398016c0e87ae6e7574636f696e';
	String policy_id = '00000002df633853f6a47465c9496721d2d5b1291b8398016c0e87ae';
	

    test('test_getAssets_willReturn_assetsForCountPageAndOrder', ()async {
    
        Asset asset = Asset();
        asset.asset = asset_id;
        asset.quantity = "1";
                    

        List<Asset> assetList = await service.getAssetList( count:5, page:1, order:"asc" );
        
        expect( assetList.length, lessThanOrEqualTo(5) );
        
        expect(assetList, contains(asset) );
    });

    test('test_getAssets_willReturn_assetsForCountAndPage', ()async {
   
        Asset asset = Asset();
        asset.asset = asset_id;
        asset.quantity = "1";
                    

        List<Asset> assetList = await service.getAssetList( count:5, page:1 );
         
        expect( assetList.length, lessThanOrEqualTo(5) );
        
        expect(assetList, contains(asset) );
    });

    
    test('test_getAsset_willReturn_asset', ()async {
    
        AssetContent expectedAsset = AssetContent();
        
        expectedAsset.asset = asset_id;
        expectedAsset.policy_id = policy_id;
        expectedAsset.asset_name = "6e7574636f696e";
        expectedAsset.fingerprint = "asset12h3p5l3nd5y26lr22am7y7ga3vxghkhf57zkhd";
        expectedAsset.quantity = "1";
        expectedAsset.initial_mint_tx_hash = "e252be4c7e40d35919f741c9649ff207c3e49d53bb819e5c1cb458055fd363ed";
        expectedAsset.mint_or_burn_count = 1;
        expectedAsset.onchain_metadata = null;
        expectedAsset.metadata = '{name: nutcoin, description: The legendary Nutcoin, the first native asset minted on Cardano., ticker: NUT, url: https://fivebinaries.com/nutcoin, logo: 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, decimals: null}';
                    

        AssetContent asset = await service.getAsset(asset_id);
		
        
      /*  print(asset.asset_name);
        print(asset.fingerprint);
        print(asset.quantity);
        print(asset.initial_mint_tx_hash);
        print(asset.mint_or_burn_count);
        print(asset.onchain_metadata);
        print(asset.metadata);
        */

		expect(asset, equals(expectedAsset));

        
    });

        

    test('test_getAssetHistory_willReturn_assetHistoryForCountPageAndOrder', ()async {
    
        AssetHistory expectedAssetHistory = new AssetHistory();
        expectedAssetHistory.tx_hash = "e252be4c7e40d35919f741c9649ff207c3e49d53bb819e5c1cb458055fd363ed";
        expectedAssetHistory.amount = "1";
        expectedAssetHistory.action = "minted";
        

        List<AssetHistory> assetHistoryList = await service.getAssetHistory(asset_id, count:5, page:1, order:"asc" );
        
		//print(assetHistoryList[0].tx_hash);
		//print(assetHistoryList[0].amount);
		//print(assetHistoryList[0].action);

		expect( assetHistoryList.length, lessThanOrEqualTo(5));

        expect( assetHistoryList, contains(expectedAssetHistory));
       
    });

    test('test_getAssetHistory_willReturn_assetHistoryForCountAndPage', ()async {
    
        AssetHistory expectedAssetHistory = new AssetHistory();
        expectedAssetHistory.tx_hash = "e252be4c7e40d35919f741c9649ff207c3e49d53bb819e5c1cb458055fd363ed";
        expectedAssetHistory.amount = "1";
        expectedAssetHistory.action = "minted";
        

        List<AssetHistory> assetHistoryList = await service.getAssetHistory(asset_id, count:5, page:1, order:"asc" );
        
		expect( assetHistoryList.length, lessThanOrEqualTo(5));

        expect( assetHistoryList, contains(expectedAssetHistory));
    });

       
    test('test_getAssetHistory_willReturn_allAssetHistory', ()async {
    
        List<AssetHistory> assetHistoryList = await service.getAssetHistory(asset_id); //?correct func?
            
		expect(assetHistoryList.length, greaterThanOrEqualTo(0));

    });

        
   


    test('test_getAssetTransaction_willReturn_assetTransactionForCountPageAndOrder', ()async {
       
        AssetTransaction expectedAssetTransaction = new AssetTransaction();
        expectedAssetTransaction.tx_hash = "e252be4c7e40d35919f741c9649ff207c3e49d53bb819e5c1cb458055fd363ed";
        expectedAssetTransaction.block_height = 5406748;
        expectedAssetTransaction.tx_index = 8;
        expectedAssetTransaction.block_time = 1614635257;
        
        
        List<AssetTransaction> assetTransactionList = await service.getAssetTransactions(asset_id, count:5, page:1, order:"asc" );
          
		//print(assetTransactionList[0].tx_hash);
		//print(assetTransactionList[0].block_height);
		//print(assetTransactionList[0].tx_index);
		//print(assetTransactionList[0].block_time);

        expect( assetTransactionList.length, lessThanOrEqualTo(5));
        
        expect( assetTransactionList, contains(expectedAssetTransaction));

    });

        
    test('test_getAssetTransaction_willReturn_assetTransactionForCountAndPage', ()async {
       
        AssetTransaction expectedAssetTransaction = new AssetTransaction();
        expectedAssetTransaction.tx_hash = "e252be4c7e40d35919f741c9649ff207c3e49d53bb819e5c1cb458055fd363ed";
        expectedAssetTransaction.block_height = 5406748;
        expectedAssetTransaction.tx_index = 8;
        expectedAssetTransaction.block_time = 1614635257;
        
        
        List<AssetTransaction> assetTransactionList = await service.getAssetTransactions(asset_id, count:5, page:1 );
          
        expect( assetTransactionList.length, lessThanOrEqualTo(5));
        
        expect( assetTransactionList, contains(expectedAssetTransaction));
    });

        
    test('test_getAssetTransaction_willReturn_allAssetTransactions', ()async {
    
        List<Asset> assetTransactionList = await service.getAssetList();
        
		expect(assetTransactionList.length, greaterThanOrEqualTo(0));

    });


  


    test('test_getAssetAddresses_willReturn_assetAddressesForCountPageAndOrder', ()async {
    
        AssetAddress expectedAssetAddress = new AssetAddress();
        expectedAssetAddress.address = "addr_test1qrus2mgpuv3nqvmusfszhhy0pyk8m92qgnfng3s3kj6vwndre5df3pzwwmyq946axfcejy5n4x0y99wqpgtp2gd0k09q5z0f76";
        expectedAssetAddress.quantity = "1";
                    
        List<AssetAddress> assetAddressList = await service.getAssetByAddresses(asset_id, count:5, page:1, order:"asc" );
		
		expect(assetAddressList.length, lessThanOrEqualTo(5));

    });

        
    test('test_getAssetAddresses_willReturn_assetAddressesForCountAndPage', ()async {
    
       AssetAddress expectedAssetAddress = new AssetAddress();
        expectedAssetAddress.address = "addr_test1qrus2mgpuv3nqvmusfszhhy0pyk8m92qgnfng3s3kj6vwndre5df3pzwwmyq946axfcejy5n4x0y99wqpgtp2gd0k09q5z0f76";
        expectedAssetAddress.quantity = "1";
                    
        List<AssetAddress> assetAddressList = await service.getAssetByAddresses(asset_id, count:5, page:1, order:"asc" );
		
		expect(assetAddressList.length, lessThanOrEqualTo(5));
    });

        
    test('test_getAssetAddresses_willReturn_allAssetAddresses', ()async {
    
        List<AssetAddress> assetAddressList = await service.getAssetByAddresses(asset_id);
           
        expect( assetAddressList.length, greaterThanOrEqualTo(0) );
    });

        
  

    test('test_getPolicyAssets_willReturn_policyAssetsForCountPageAndOrder', ()async {
    
       List<AssetAddress> policyAssetsList = await service.getAssetsByPolicy(policy_id, count:5, page:1, order:"asc");
            
		expect(policyAssetsList.length, lessThanOrEqualTo(5));

    });

        
    test('test_getPolicyAssets_willReturn_policyAssetsForCountAndPage', ()async {
   
        List<AssetAddress> policyAssetsList = await service.getAssetsByPolicy(policy_id, count:5, page:1 );
            
		expect(policyAssetsList.length, lessThanOrEqualTo(5));
    });

        
    test('getPolicyAssets_willReturn_allPolicyAssets', ()async {
    
        List<AssetAddress> policyAssetsList = await service.getAssetsByPolicy(policy_id);
        
		expect(policyAssetsList.length, greaterThanOrEqualTo(0));
    });

   

}