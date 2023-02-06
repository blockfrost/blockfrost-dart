
import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

void main()
{

	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	AccountsService service = AccountsService(Service.networkCardanoMainnet, projectId);
	
	
	String stakeAddress = "stake1ux3g2c9dx2nhhehyrezyxpkstartcqmu9hk63qgfkccw5rqttygt7";
	
	test('test_getAccountByStakeAddress_willReturn_Account', ()async {
		
        var account = await service.getAccount(stakeAddress);
        
		expect( account.stake_address, equals(stakeAddress));
		
	});
	
	

   	test('test_history_willReturn_historyForCountPageAndAscendingOrder', () async {
    
        List<AccountHistory> historyList = await service.getAccountHistory(stakeAddress, count:3, page:1, order:"asc" );
		
		expect(historyList.length, lessThanOrEqualTo(3) );
		
        for(final object in historyList)
		{
            expect(object.pool_id,  isNotNull);
		}
    });

    test('test_history_willReturn_historyForCountAndPage', () async {
    
        List<AccountHistory> historyList = await service.getAccountHistory(stakeAddress, count:3, page:1 );
    
       expect(historyList.length, lessThanOrEqualTo(3) );
		
        for(final object in historyList)
		{
            expect(object.pool_id,  isNotNull);
		}
    });
    
    test('test_rewardHistory_willReturn_rewardHistoryForCountPageAndAscendingOrder', () async {
    
        List<AccountRewardHistory> rewardHistoryList = await service.getAccountRewardHistory(stakeAddress, count:3, page:1, order:"asc" );

		expect(rewardHistoryList.length, lessThanOrEqualTo(3) );
    });

    test('test_rewardHistory_willReturn_rewardHistoryForCountAndPage', () async {
   
        List<AccountRewardHistory> rewardHistoryList = await service.getAccountRewardHistory(stakeAddress, count:3, page:1, order:"asc" );

		expect(rewardHistoryList.length, lessThanOrEqualTo(3) );

    });

    test('test_rewardHistory_willReturn_entireRewardHistory', () async {
    
        List<AccountRewardHistory> rewardHistoryList = await service.getAccountRewardHistory(stakeAddress);
        
		expect(rewardHistoryList.length, greaterThanOrEqualTo(0) );
    });

    test('test_delegationHistory_willReturn_delegationHistoryForCountPageAndAscendingOrder', () async {
    
        List<AccountDelegationHistory> delegationHistoryList = await service.getAccountDelegationHistory(stakeAddress,  count:3, page:1, order:"asc" );

        expect(delegationHistoryList.length, lessThanOrEqualTo(3) );
    });

    test('test_delegationHistory_willReturn_delegationHistoryForCountAndPage', () async {
    
        List<AccountDelegationHistory> delegationHistoryList = await service.getAccountDelegationHistory(stakeAddress,  count:3, page:1 );

        expect(delegationHistoryList.length, lessThanOrEqualTo(3) );
    });

    test('test_delegationHistory_willReturn_entireDelegationHistory', () async {
    
        List<AccountDelegationHistory> delegationHistoryList = await service.getAccountDelegationHistory(stakeAddress );

        expect(delegationHistoryList.length, greaterThanOrEqualTo(0) );
    });


    test('test_registrationHistory_willReturn_registrationHistoryForCountPageAndAscendingOrder', () async {
    
        List<AccountRegistrationHistory> registrationHistoryList = await service.getAccountRegistrationHistory(stakeAddress,count:3, page:1, order:"asc" );

        expect(registrationHistoryList.length, lessThanOrEqualTo(3) );
    });

    test('test_registrationHistory_willReturn_registrationHistoryForCountAndPage', () async {
    
        List<AccountRegistrationHistory> registrationHistoryList = await service.getAccountRegistrationHistory(stakeAddress,count:3, page:1);

        expect(registrationHistoryList.length, lessThanOrEqualTo(3) );
    });


    test('test_withdrawalHistory_willReturn_withdrawalHistoryForCountPageAndAscendingOrder', () async {
    
        List<AccountWithdrawalHistory> withdrawalHistoryList = await service.getAccountWithdrawalHistory(stakeAddress, count:3, page:1, order:"asc" );

        expect(withdrawalHistoryList.length, lessThanOrEqualTo(3) );
    });

    test('test_withdrawalHistory_willReturn_withdrawalHistoryForCountAndPage', () async {
    
        List<AccountWithdrawalHistory> withdrawalHistoryList = await service.getAccountWithdrawalHistory(stakeAddress,count:3, page:1);

        expect(withdrawalHistoryList.length, lessThanOrEqualTo(3) );
    });


    test('test_mirHistory_willReturn_mirHistoryForCountPageAndAscendingOrder', () async {
    
        List<AccountMirHistory> mirHistoryList = await service.getAccountMirHistory(stakeAddress, count:3, page:1, order:"asc" );

		expect(mirHistoryList.length, lessThanOrEqualTo(3) );
    });

    test('test_mirHistory_willReturn_mirHistoryForCountAndPage', () async {
    
        List<AccountMirHistory> mirHistoryList = await service.getAccountMirHistory(stakeAddress, count:3, page:1 );
        
        expect(mirHistoryList.length, lessThanOrEqualTo(3) );
    });

    test('test_addresses_willReturn_addressesForCountPageAndAscendingOrder', () async {
    
        List<AccountAssociatedAddress> addressesList = await service.getAccountAssociatedAddresses(stakeAddress, count:3, page:1, order:"asc" );
	
		expect(addressesList.length, lessThanOrEqualTo(3) );
    });

    test('test_addresses_willReturn_addressesForCountAndPage', () async {
    
        List<AccountAssociatedAddress> addressesList  = await service.getAccountAssociatedAddresses(stakeAddress, count:3, page:1 );
        
		expect(addressesList.length, lessThanOrEqualTo(3) );
    });

  
    test('test_assets_willReturn_assetsForCountPageAndAscendingOrder', () async {
    
        List<AccountAsset> assetsList = await service.getAccountAssociatedAssets(stakeAddress, count:3, page:1, order:"asc");

        expect(assetsList.length, lessThanOrEqualTo(3) );
    });

    
    test('test_assets_willReturn_assetsForCountAndPage', () async {
    
        List<AccountAsset> assetsList = await service.getAccountAssociatedAssets(stakeAddress, count:3, page:1 );
        
        expect(assetsList.length, lessThanOrEqualTo(3) );
    });



}


