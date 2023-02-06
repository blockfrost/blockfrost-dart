import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

void main()
{
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	PoolsService service = PoolsService(Service.networkCardanoMainnet, projectId);
	
	String pool_id = "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy";
	
   	test('test_pool_willReturn_poolForPoolId', ()async {
    
    
        PoolStakePool pool = await service.getStakePool(pool_id);
        
		expect(pool, isNotNull);

        expect(pool.pool_id, equals(pool_id) );
       
    });


    test('test_pools_willReturn_poolsForCountPageAndAscendingOrder', ()async {
    
        List<String> expectedPoolList = [
                    "pool1z5uqdk7dzdxaae5633fqfcu2eqzy3a3rgtuvy087fdld7yws0xt",
                    "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy",
                    "pool1q80jjs53w0fx836n8g38gtdwr8ck5zre3da90peuxn84sj3cu0r",
                    "pool1ddskftmsscw92d7vnj89pldwx5feegkgcmamgt5t0e4lkd7mdp8",
                    "pool1qqqqqdk4zhsjuxxd8jyvwncf5eucfskz0xjjj64fdmlgj735lr9"
            ];

        List<String> poolList = await service.getStakePools(count:5, page:1, order:"asc");

		expect( poolList.length, equals(5));

        for(final value in expectedPoolList)
		{
			expect(poolList, contains(value));
		}
        
            

    });
    
    test('test_pools_willReturn_allPools', ()async {
    
        List<String> poolList = await service.getStakePools();

		expect(poolList.length, greaterThanOrEqualTo(0));

       
    });

        
    test('test_pools_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getStakePools(count:101, page:1), throwsException); //"querystring.count should be <= 100""

    });


    test('test_retiredPools_willReturn_retiredPoolsForCountPageAndAscendingOrder', ()async {
    
     
        List<Pool> poolList = await service.getRetiredStakePools(count:3, page:1, order:"asc");

      
		expect( poolList.length, equals(3));

    
            
    });

       
    test('test_retiredPools_willReturn_allRetiredPools', ()async {
    
        List<Pool> poolList = await service.getRetiredStakePools();

		expect( poolList.length, greaterThanOrEqualTo(0));


    });

        
    test('test_retiredPools_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getRetiredStakePools(count:101, page:1), throwsException); //"querystring.count should be <= 100""

        
    });


    test('test_retiringPools_willReturn_retiringPoolsForCountPageAndAscendingOrder', ()async {
    
        List<Pool> poolList = await service.getRetiringStakePools(count:2, page:1, order:"asc");

		expect( poolList.length, lessThanOrEqualTo(2));

    });

    test('test_retiringPools_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getRetiredStakePools(count:101, page:1), throwsException); //"querystring.count should be <= 100""

    });


    test('test_poolHistory_willReturn_poolHistoryForCountPageAndAscendingOrder', ()async {
    
     
        List<PoolHistory> poolHistory = await service.getStakePoolHistory(pool_id,count:3, page:1, order:"asc");

		expect(poolHistory.length, equals(3));

   
    });


    test('test_poolHistory_willReturn_entireHistory', ()async {
    
        List<PoolHistory> poolList = await service.getStakePoolHistory(pool_id);

		expect(poolList.length, greaterThanOrEqualTo(0));


    });

    test('test_poolHistory_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getStakePoolHistory(pool_id, count:101, page:1), throwsException); //"querystring.count should be <= 100""

    });


    test('test_poolMetadata_willReturn_poolMetadataForPoolId', ()async {
    
            
        PoolMetadata poolMetadata = await service.getStakePoolMetadata(pool_id);
        
		expect( poolMetadata, isNotNull);

        expect( poolMetadata.pool_id, pool_id);

        
    });

    test('test_poolRelays_willReturn_poolRelaysForPoolId', ()async {
    
        PoolRelay expectedPoolRelays = PoolRelay();
        expectedPoolRelays.ipv4 = "120.12.13.43";
        expectedPoolRelays.ipv6 = null;
        expectedPoolRelays.dns = null;
        expectedPoolRelays.dns_srv = null;
        expectedPoolRelays.port = 6000;
                            
        List<PoolRelay> poolRelays = await service.getStakePoolRelays(pool_id);
        
		expect( poolRelays.length, equals(1));
		
		//print(poolRelays[0].ipv4);
		
      

		expect(poolRelays[0].ipv4, isNull);
        
    });


    test('test_poolDelegators_willReturn_poolDelegatorsForCountPageAndAscendingOrder', ()async {
    
      
        List<PoolDelegator> poolDelegatorList = await service.getStakePoolDelegators(pool_id, count:3, page:1, order:"asc");

		expect( poolDelegatorList.length, equals(3));

    
        
        
    });

      
    test('test_poolDelegators_willReturn_allPoolDelegators', ()async {
    
        List<PoolDelegator> poolList = await service.getStakePoolDelegators(pool_id);

		expect( poolList.length, greaterThanOrEqualTo(0));
       
    });

        
    test('test_poolDelegators_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getStakePoolDelegators(pool_id, count:101, page:1), throwsException); //"querystring.count should be <= 100""

        
    });



    test('test_poolBlocks_willReturn_poolBlocksForCountPageAndAscendingOrder', ()async {
    
        List<String> poolBlockList = await service.getStakePoolBlocks(pool_id, count:3, page:1, order:"asc" );

		expect(poolBlockList.length, greaterThanOrEqualTo(0));

        
    });

  
    test('test_poolBlocks_willReturn_allPoolBlocks', ()async {
    
        List<String> poolList = await service.getStakePoolBlocks(pool_id);

		expect(poolList.length, greaterThanOrEqualTo(0));


    });

        
    test('test_poolBlocks_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getStakePoolBlocks(pool_id, count:101, page:1), throwsException); //"querystring.count should be <= 100""

        
    });

       
    test('test_poolUpdates_willReturn_poolUpdatesForCountPageAndAscendingOrder', ()async {
    
    

        List<PoolUpdate> poolUpdateList = await service.getStakePoolUpdates(pool_id, count:2, page:1, order:"asc");

		expect( poolUpdateList.length, greaterThanOrEqualTo(0));

    
    });


    test('test_poolUpdates_willReturn_allPoolUpdates', ()async {
    
      	 List<PoolUpdate> poolList = await service.getStakePoolUpdates(pool_id);

		expect(poolList.length, greaterThanOrEqualTo(0));

       
    });

        
    test('test_poolUpdates_willThrowAPIException_onCountGreaterThan100', ()async {
       
		expect( () async => await service.getStakePoolUpdates(pool_id, count:101, page:1), throwsException); //"querystring.count should be <= 100""



    });


}	