
import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

bool blockEquality(BlockContent a, BlockContent b)
{
	/*print(a.time);
		print(a.height);
		print(a.hash);
		print(a.slot);
		print(a.epoch);
		print(a.epoch_slot);
		print(a.slot_leader);
		print(a.size);
		print(a.tx_count);;
		print(a.previous_block);
		print(a.next_block);
		print("---");
		
		
		print(b.time);
		print(b.height);
		print(b.hash);
		print(b.slot);
		print(b.epoch);
		print(b.epoch_slot);
		print(b.slot_leader);
		print(b.size);
		print(b.tx_count);;
		print(b.previous_block);
		print(b.next_block);*/
		
	
	
	
	
	
	return  
	  // a.time == b.time
     a.height == b.height
  //  && a.hash == b.hash
    && a.slot == b.slot
    && a.epoch == b.epoch
    && a.epoch_slot == b.epoch_slot
    && a.slot_leader == b.slot_leader
    && a.size == b.size
    && a.tx_count == b.tx_count
    && a.previous_block == b.previous_block
    && a.next_block == b.next_block;
        
}

void main()
{
	BlockContent expectedBlock = BlockContent();
        expectedBlock.time = 1506203091;
        expectedBlock.height = 1;
     //   expectedBlock.hash = "f0f7892b5c333cffc4b3c4344de48af4cc63f55e44936196f365a9ef2244134f";
        expectedBlock.slot = 0;
        expectedBlock.epoch = 0;
        expectedBlock.epoch_slot = 0;
        expectedBlock.slot_leader = "ByronGenesis-52df0f2c5539b2b1";
        expectedBlock.size = 665;
        expectedBlock.tx_count = 0;
        expectedBlock.previous_block = "89d9b5a5b8ddc8d7e5a6795e9774d97faf1efea59b2caf7eaf9f8c5b32059df4";
        expectedBlock.next_block = "1dbc81e3196ba4ab9dcb07e1c37bb28ae1c289c0707061f28b567c2f48698d50";
        expectedBlock.confirmations = 8361881;
        // public $output;         //"128314491794",
	
	
	
	BlockContent nextExpectedBlock = BlockContent();
       expectedBlock.time = 1564020256;
       expectedBlock.height = 2;
       expectedBlock.hash = "f4e96309537d15682211fcac4c249c2bdff8464476e047be99d80edf97bcf3ff";
        expectedBlock.slot = 1032;
        expectedBlock.epoch = 0;
        expectedBlock.epoch_slot = 1032;
        expectedBlock.slot_leader = "ByronGenesis-42186a6a0079ef39";
        expectedBlock.size = 5799;
        expectedBlock.tx_count = 0;
        expectedBlock.previous_block = "388a82f053603f3552717d61644a353188f2d5500f4c6354cc1ad27a36a7ea91";
        expectedBlock.next_block = "067e773e6ffd66ea06f7f1c967e18a1ee0916797f6a1c1abdf410379eb8b1dbe";
        expectedBlock.confirmations = 2803485;
        // public $output;         //"128314491794",
        
	
	
	
	
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	String hash = "796b28e192f1c9040e3749feb1bd2b35ce9a262976c7db95b43a3d3c417d37d4";
	int epoch_number = 304;
	
	
	BlockService service = BlockService(Service.networkCardanoMainnet, projectId);
	
   test('test_latestBlock_willReturn_latestBlock', ()async {
   
        BlockContent latestBlock = await service.getLatestBlock();
        
        expect(latestBlock, isNotNull);
    });


    test('test_block_willReturn_BlockForHash', ()async {
    
   
        BlockContent blockForHash = await service.getBlock(hash);
        
		expect(blockForHash, isNotNull);
		
		//print(blockForHash.time);
		//print(blockForHash.height);
		//print(blockForHash.hash);
		//print(blockForHash.slot);
		//print(blockForHash.epoch);
		//print(blockForHash.epoch_slot);
		//print(blockForHash.slot_leader);
		//print(blockForHash.size);
		//print(blockForHash.tx_count);
		//print(blockForHash.output);
		//print(blockForHash.fees);
		//print(blockForHash.block_vrf);
		//print(blockForHash.previous_block);
		//.print(blockForHash.next_block);
	//	print(blockForHash.confirmations);

	

    });

    
    test('test_blockForSlot_willReturn_blockForGivenSlot', ()async {
    
     
        

        BlockContent blockInSlot = await service.getSpecificBlockInSlot(0);

		expect( blockInSlot, isNotNull);        




    });

    
    test('test_blockForEpochSlot_willReturn_blockForGivenEpochAndSlot', ()async {
    
     

        BlockContent blockInSlot = await service.getSpecificBlockInSlotInEpoch(0, 0);
        
        
        expect( blockInSlot, isNotNull);        

      
    });


    test('test_transactionsInLatestBlock_willReturn_transactionsInLatestBlockForCountPageAndAscendingOrder', ()async {
    
        List<String> transactionsInLatestBlock = await service.getLatestBlockTransactions( count:5, page:1, order:"asc" );

		expect( transactionsInLatestBlock.length, lessThanOrEqualTo(5));

    });

        
    test('test_transactionsInLatestBlock_willReturn_transactionsInLatestBlockForCountPage', ()async {
    
         List<String> transactionsInLatestBlock = await service.getLatestBlockTransactions( count:5, page:1 );

		expect( transactionsInLatestBlock.length, lessThanOrEqualTo(5));
    });

    test('test_transactionsInLatestBlock_willReturn_allTransactionsInLatestBlock', ()async {
    
        List<String> transactionsInLatestBlock = await service.getLatestBlockTransactions();
        
        expect( transactionsInLatestBlock.length, greaterThanOrEqualTo(0));
    });


    test('test_nextBlocks_willReturn_nextBlocksForCountAndPage', ()async {
    
        
        List<BlockContent> nextBlocks = await service.listNextBlocks("1", count:1, page:1 );
        
		expect(nextBlocks.length, equals(1));

	
       
    });

        
    test('test_nextBlocks_willReturn_allNextBlocks', ()async {
    
        BlockContent block = await service.getLatestBlock();
        
        num latestBlockNumber = (block.height as num)-5;
        
       	List<BlockContent> nextBlocks = await service.listNextBlocks("$latestBlockNumber" );
        
        expect(nextBlocks.length, greaterThanOrEqualTo(0));
    });


  

    test('previousBlocks_willReturn_previousBlocksForCountAndPage', ()async {
    
       

        List<BlockContent> previousBlocks = await service.listPreviousBlocks("2", count:1, page:1 );

        expect( previousBlocks.length, equals(1) );

	        

       
    });


    test('previousBlocks_willReturn_allPreviousBlocks', ()async {
    
        List<BlockContent> previousBlocks = await service.listPreviousBlocks("2");
        
		expect( previousBlocks.length, greaterThanOrEqualTo(0));

    });

        
  

}
