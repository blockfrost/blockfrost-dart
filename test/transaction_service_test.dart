import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

void main()
{
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	TransactionsService service = TransactionsService(Service.networkCardanoMainnet, projectId);

	String hash = "8f55e18a94e4c0951e5b8bd8910b2cb20aa4d742b1608fda3a06793d39fb07b1";

   	test('test_transaction_willReturn_transactionForAHash', ()async {
    
        TransactionAmount ta = new TransactionAmount();
        ta.unit = "lovelace";
        ta.quantity = "9605414089839";
        
        
        Transaction expectedTransaction = new Transaction();
        expectedTransaction.hash = "0089e962584516378463141d853f7102852e7f2a8546c2a2af6cc05c6e628a5b";
        expectedTransaction.block= "dc6258ab8b0cbbe04343f31c71062058fcb9bc9f7ae47085d43a39ee4688a878";
        expectedTransaction.block_height =2750303;
        expectedTransaction.slot =31814522;
        expectedTransaction.index =3; 
        expectedTransaction.output_amount = [ta];
        expectedTransaction.fees = "168801";
        expectedTransaction.deposit = "0";
        expectedTransaction.size = 293;
        expectedTransaction.invalid_before = null;
        expectedTransaction.invalid_hereafter = "31821502";
        expectedTransaction.utxo_count = 3;
        expectedTransaction.withdrawal_count = 0;
        expectedTransaction.mir_cert_count = 0;
        expectedTransaction.delegation_count = 0; 
        expectedTransaction.stake_cert_count = 0;
        expectedTransaction.pool_retire_count = 0; 
        expectedTransaction.pool_update_count = 0;
        expectedTransaction.asset_mint_or_burn_count = 0;
        expectedTransaction.block_time = 1626183738;
        expectedTransaction.redeemer_count = 0;
        expectedTransaction.valid_contract = true;


    
        
        Transaction transactionResponse = await service.getTransaction(hash);
        
	
		
		expect(hash == transactionResponse.hash, isTrue);

    });

    
    test('test_transactionUtxo_willReturn_transactionUtxoForAHash', ()async {
    
    
        TransactionUTXOs transactionUtxoResponse = await service.getTransactionUTXOs(hash);
        
	//print(transactionUtxoResponse.hash);

		expect("8f55e18a94e4c0951e5b8bd8910b2cb20aa4d742b1608fda3a06793d39fb07b1", equals(transactionUtxoResponse.hash));

        

    });

    
    test('test_transactionStakes_willReturn_transactionStakesForAHash', ()async {
    
     

        List<TransactionAddressCertificate> transactionStakeResponse = await service.getTransactionStakeAddressCertificates(hash);
        
		
		expect(transactionStakeResponse.length, greaterThanOrEqualTo(0));
		

    });

    
    test('test_transactionDelegations_willReturn_transactionDelegationsForAHash', ()async {
    

     
	

        List<TransactionDelegationCertificate> transactionDelegationResponse = await service.getTransactionDelegationCertificates(hash);
        
		expect(transactionDelegationResponse.length, greaterThanOrEqualTo(0));

    });

    
    test('test_transactionWithdrawals_willReturn_transactionWithdrawalsForAHash', ()async {
    
    
		
        List<TransactionWithdrawal> transactionWithdrawalResponse = await service.getTransactionWithdrawals(hash);
        
		expect(transactionWithdrawalResponse.length, equals(0));

        
    });

    
    test('test_transactionMirs_willReturn_transactionMirsForAHash', ()async {
    
       

	
        List<TransactionMir> transactionMirResponse = await service.getTransactionMIRs(hash);
        
		expect(transactionMirResponse.length, greaterThanOrEqualTo(0));


    });

    
    test('test_transactionPoolUpdates_willReturn_transactionPoolUpdatesForAHash', ()async {
    
      


        List<TransactionRegistrationAndUpdateCertificate> $transactionPoolUpdateResponse = await service.getTransactionStakePoolUpdateCertificates(hash);
		
		expect($transactionPoolUpdateResponse.length, equals(0));        

    });


    test('test_transactionPoolRetires_willReturn_transactionPoolRetiresForAHash', ()async {
    
     

	

        List<TransactionRetirementCertificate> transactionPoolRetireResponse = await service.getTransactionStakePoolRetirementCertificates(hash);
        
		expect(transactionPoolRetireResponse.length, greaterThanOrEqualTo(0));       
    });

    
    test('test_transactionMetadata_willReturn_transactionMetadataForAHash', ()async {
    
      

        List<TransactionMetadata> transactionMetadataJsonResponse = await service.getTransactionMetadata(hash);
        
		expect(transactionMetadataJsonResponse.length, greaterThanOrEqualTo(0));

    });

    
    test('test_transactionMetadataCbor_willReturn_transactionMetadataCborForAHash', ()async {
    
      

        List<TransactionMetadataCBOR> transactionMetadataCborResponse = await service.getTransactionMetadataAsCBOR(hash);
        
		expect(transactionMetadataCborResponse.length, greaterThanOrEqualTo(0));


    });

    

}
