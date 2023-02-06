import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

void main()
{

	int epoch_number = 225;
	String pool_id = "pool1pu5jlj4q9w9jlxeu370a3c9myx47md5j5m2str0naunn2q3lkdy";

	Epoch expectedEpoch1 = Epoch();
        expectedEpoch1.epoch = epoch_number;
        expectedEpoch1.start_time =1603403091;
        expectedEpoch1.end_time = 1603835086;
        expectedEpoch1.first_block_time = 1603403092;
        expectedEpoch1.last_block_time  =1603835084;
        expectedEpoch1.block_count  =21298;
        expectedEpoch1.tx_count  = 17856;
        expectedEpoch1.output = "4203312194";
        expectedEpoch1.fees = "54105620";
        expectedEpoch1.active_stake = "784953934049314";

	Epoch expectedEpoch2 = Epoch();
        expectedEpoch2.epoch = 2;
        expectedEpoch2.start_time =1564863616;
        expectedEpoch2.end_time = 1565295616;
        expectedEpoch2.first_block_time = 1564863616;
        expectedEpoch2.last_block_time  =1565295596;
        expectedEpoch2.block_count  =21601;
        expectedEpoch2.tx_count  = 182;
        expectedEpoch2.output = "35581408008991";
        expectedEpoch2.fees = "40548594";
        expectedEpoch2.active_stake = null;

	EpochParameters expectedEpochParam = EpochParameters();
        expectedEpochParam.epoch = 140;
        expectedEpochParam.min_fee_a = 44;
        expectedEpochParam.min_fee_b = 155381;
        expectedEpochParam.max_block_size = 65536;
        expectedEpochParam.max_tx_size = 16384;
        expectedEpochParam.max_block_header_size = 1100;
        expectedEpochParam.key_deposit = "2000000";
        expectedEpochParam.pool_deposit = "500000000";
        expectedEpochParam.e_max = 18;
        expectedEpochParam.n_opt = 150;
        expectedEpochParam.a0 = 0.3;
        expectedEpochParam.rho = 0.003;
        expectedEpochParam.tau = 0.2;
        expectedEpochParam.decentralisation_param = 0.5;
        expectedEpochParam.extra_entropy = null;
        expectedEpochParam.protocol_major_ver = 2;
        expectedEpochParam.protocol_minor_ver = 0;
        expectedEpochParam.min_utxo = "1000000";
        expectedEpochParam.min_pool_cost = "340000000";
        expectedEpochParam.nonce = "1a3be38bcbb7911969283716ad7aa550250226b76a61fc51cc9a9a35d9276d81";

	
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	EpochsService service = EpochsService(Service.networkCardanoMainnet, projectId);

   test('test_latestEpoch_willReturn_latestEpoch', ()async {
    
        Epoch latestEpoch = await service.getLatestEpoch();
        
		expect(latestEpoch, isNotNull);
    });

    
    test('test_latestEpochParam_willReturn_latestEpochParam', ()async {
    
        EpochParameters latestEpochParam = await service.getLatestEpochProtocolParameters();
        
        expect(latestEpochParam, isNotNull);
    });

    
    test('test_getEpoch_willReturn_epochForEpochNumber', ()async {
      
        Epoch epoch = await service.getEpoch(epoch_number);
        
		
		/*print(epoch.epoch);
        print(epoch.start_time);
        print(epoch.end_time);
        print(epoch.first_block_time);
        print(epoch.last_block_time);
        print(epoch.block_count);
        print(epoch.tx_count);
        print(epoch.output);
        print(epoch.fees);
        print(epoch.active_stake);*/

expect(epoch.start_time == 1603403091, isTrue);


       
    });

    
    test('test_nextEpochs_willReturn_nextEpochsForCountAndPage', ()async {
    
        

       
        List<Epoch> nextEpochs = await service.getNextEpochs(1, count:5, page:1 );

		expect(nextEpochs.length, equals(5));

       
        
    });

    
    test('test_nextEpochs_willReturn_allNextEpochs', ()async {
    
		
        Epoch latestEpoch = await service.getLatestEpoch();
        
        List<Epoch> nextEpochs = await service.getNextEpochs(  latestEpoch.epoch - 5 as int );
        
		expect( nextEpochs.length , greaterThanOrEqualTo(0));

       
    });

    
    test('test_previousEpochs_willReturn_previousEpochsForCountAndPage', ()async {
    
       
        List<Epoch> previousEpochs = await service.getPreviousEpochs(2, count:1, page:1 );

		expect( previousEpochs.length, equals(1));

       
        
        
    });

    
    test('test_previousEpochs_willReturn_allPreviousEpochs', ()async {
    
        List<Epoch> previousEpochs = await service.getPreviousEpochs(2);
        
		expect( previousEpochs.length, greaterThanOrEqualTo(0));

    });

    
    test('test_activeStakesForEpoch_willReturn_activeStakesForEpochForCountAndPage', ()async {
    
        List<EpochStakeAndPool> activeStakes = await service.getStakeDistribution(225, count:5, page:1 );

		expect(activeStakes.length, lessThanOrEqualTo(5));

        expect(activeStakes[0].pool_id, isNotNull);
		expect(activeStakes[0].stake_address, isNotNull);
        
      
       
    });

    
    test('test_activeStakesForEpoch_willReturn_allActiveStakesForEpoch', ()async {
    
        List<EpochStakeAndPool> activeStakes = await service.getStakeDistribution(149);
		
		expect(activeStakes.length, greaterThanOrEqualTo(0));
		        
       

    }   );

    
    test('test_activeStakesForEpochAndPool_willReturn_activeStakesForEpochAndPoolForCountAndPage', ()async {
    
        List<EpochStake> activeStakesForPool = await service.getStakeDistributionByPool(149, pool_id, count:5, page:1 );

		expect(activeStakesForPool.length, lessThanOrEqualTo(5));


       
    });

    
    test('test_activeStakesForEpochAndPool_willReturn_allActiveStakesForEpochAndPool', ()async {
    

        List<EpochStake> activeStakesForPool = await service.getStakeDistributionByPool(149, pool_id );
        
		expect(activeStakesForPool.length, greaterThanOrEqualTo(0));

        

    });

   
    
    test('test_epochParam_willReturn_epochParamForEpoch', ()async {
    
        
        EpochParameters latestEpochParam = await service.getProtocolParameters(epoch_number);
        
		
		
		expect(latestEpochParam.e_max == expectedEpochParam.e_max, isTrue);

       

    });

    
    test('test_blocksForEpoch_willReturn_blocksForEpochForCountPageAndOrder', ()async {
    
        String blockHash = "ef491c14d6041b750f09662ff6dcf0171e3ee1f5ce7b9966ce2470b4f732064e";

        List<String> blocksForEpoch = await service.getBlockDistribution(epoch_number, count:5, page:1, order:"asc");

		expect(blocksForEpoch.length, lessThanOrEqualTo(5));

        expect(blocksForEpoch, contains(blockHash));
        

        

    });

    
    test('test_blocksForEpoch_willReturn_blocksForEpochForCountPage', ()async {
    
       String blockHash = "ef491c14d6041b750f09662ff6dcf0171e3ee1f5ce7b9966ce2470b4f732064e";

        List<String> blocksForEpoch = await service.getBlockDistribution(epoch_number, count:5, page:1);

		expect(blocksForEpoch.length, lessThanOrEqualTo(5));

        expect(blocksForEpoch, contains(blockHash));
    });

    
    test('test_blocksForEpochAndPool_willReturn_blocksForEpochAndPoolForCountPageAndOrder', ()async {
    
        Epoch latestEpoch = await service.getLatestEpoch();
        
        List<EpochStakeAndPool> activeStakes = await service.getStakeDistribution(latestEpoch.epoch as int, count:1, page:1 );
        
        List<EpochStake> blocksForEpoch = await service.getStakeDistributionByPool(latestEpoch.epoch as int, activeStakes[0].pool_id, count:5, page:1, order:"asc");


		expect(blocksForEpoch.length, lessThanOrEqualTo(5));
        
        
    });

    
    test('test_blocksForEpochAndPool_willReturn_blocksForEpochAndPoolForCountPage', ()async {
    
         Epoch latestEpoch = await service.getLatestEpoch();
        
        List<EpochStakeAndPool> activeStakes = await service.getStakeDistribution(latestEpoch.epoch as int, count:1, page:1 );
        
        List<EpochStake> blocksForEpoch = await service.getStakeDistributionByPool(latestEpoch.epoch as int, activeStakes[0].pool_id, count:5, page:1);


		expect(blocksForEpoch.length, lessThanOrEqualTo(5));

    });

    
    test('test_blocksForEpochAndPool_willReturn_allBlocksForEpochAndPool', ()async {
    
        Epoch latestEpoch = await service.getLatestEpoch();
        
        List<EpochStakeAndPool> activeStakes = await service.getStakeDistribution(latestEpoch.epoch as int, count:1, page:1 );
        
        List<EpochStake> blocksForEpoch = await service.getStakeDistributionByPool(latestEpoch.epoch as int, activeStakes[0].pool_id);
        
		expect(blocksForEpoch.length, greaterThanOrEqualTo(0));

        

    });
}	