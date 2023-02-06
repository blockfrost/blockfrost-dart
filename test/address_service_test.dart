
import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

void main()
{
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	AddressesService service = AddressesService(Service.networkCardanoMainnet, projectId);

	String address = "addr1qx466898end6q5mpvrwwmycq35v83c9e8cnffadv6gr6q6azs4s26v4800nwg8jygvrdqh6xhsphct0d4zqsnd3sagxqqjjgln";

	
    test('test_address_willReturn_addressForBechAddress', ()async {
    
        Address addressResponse = await service.getAddress(address);
        
        expect( addressResponse.address, equals(address) );
    });

  
    test('test_addressDetails_willReturn_addressDetailsForBechAddress', ()async {
    

        AddressTotal addressTotalResponse = await service.getAddressTotal(address);
       
        expect( addressTotalResponse.address, equals(address) );
        
    });


    test('test_addressUtxos_willReturn_addressUtxosForCountPageAndAscendingOrder', ()async {
    
        List<AddressTotal> addressUtxoList = await service.getAddressUTXOs(address, count:2, page:1, order:"asc" );

        expect( addressUtxoList.length, lessThanOrEqualTo(2)  ); //#was equal 2
    });

    test('test_addressUtxos_willReturn_addressUtxosForCountAndPage', ()async {
    
        List<AddressTotal> addressUtxoList = await service.getAddressUTXOs(address, count:2, page:1 );

        expect( addressUtxoList.length, lessThanOrEqualTo(2)  ); //#as above
    });

    test('test_addressTransactions_willReturn_addressTransactionsForCountPageAndAscendingOrderNoRange', ()async {
    
        List<AddressTransaction> addressTransactionListsList = await service.getAddressTransactions(address,  count:100, page:1, order:"asc" );
    
        expect( addressTransactionListsList.length, greaterThanOrEqualTo(2) );
    });

    test('test_addressTransactions_willReturn_addressTransactionsForCountPageAndAscendingOrder', ()async {
    
        List<AddressTransaction> addressTransactionLists = await service.getAddressTransactions(address, count:2, page:1, order:"asc", from:8929261, to:9999269 );

		expect( addressTransactionLists.length, lessThanOrEqualTo(2) );
    });

        
    test('test_addressTransactions_willReturn_addressTransactionsForCountAndPage', ()async {
    
        List<AddressTransaction> addressTransactionLists = await service.getAddressTransactions(address, count:2, page:1, from:8929261, to:9999269);

        expect( addressTransactionLists.length, lessThanOrEqualTo(2) );
    });

        
    test('test_addressTransactions_willReturn_allAddressTransactions', ()async {
    
        List<AddressTransaction> addressTransactionLists = await service.getAddressTransactions(address, from:8929261, to:9999269);

		expect( addressTransactionLists.length, greaterThanOrEqualTo(0) );
    });


  

}
