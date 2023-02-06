import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import 'dart:io' show Platform;

bool MetadataLabelEquality(MetadataLabel a, MetadataLabel b)
{
	return a.label == b.label && a.count == b.count;
}

void main()
{
	String projectId = Platform.environment['PROJECT_ID_MAINNET'] as String;
	
	MetadataService service = MetadataService(Service.networkCardanoMainnet, projectId);
	
  	test('test_transactionMetadataLabels_willReturn_transactionMetadataLabelsForCountPageAndAscendingOrder', ()async {
    
    
        List<MetadataLabel> metadataList = await service.getTransactionMetadataLabels( count:3, page:1, order:"asc");

		expect(metadataList.length, equals(3));

		//print(metadataList[0].label);
		//print(metadataList[0].count);

       
    });

        
        
    test('test_transactionMetadataLabels_willReturn_allTransactionMetadataLabels', ()async {
    
        List<MetadataLabel> metadataList = await service.getTransactionMetadataLabels();
        
		expect(metadataList.length, greaterThanOrEqualTo(0));


    });

        
    test('test_transactionMetadataLabels_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getTransactionMetadataLabels(count:101, page:1), throwsException); //"querystring.count should be <= 100"

    });


    test('transactionMetadataCborForLabel_willReturn_transactionMetadataLabelCborForCountPageAndAscendingOrder', ()async {
      
     
                    
        List<MetadataCBOR> transactionMetadataLabelCborList = await service.getTransactionMetadataAsCBOR("0",count:3, page:1, order:"asc" );

		expect(transactionMetadataLabelCborList.length, equals(3));

    });

    test('test_transactionMetadataCborForLabel_willReturn_allTransactionMetadataLabelCbors', ()async {
    
        List<MetadataCBOR> transactionMetadataLabelCborList = await service.getTransactionMetadataAsCBOR("100");
        
		expect( transactionMetadataLabelCborList.length, greaterThanOrEqualTo(0));

    });


    test('test_transactionMetadataCborForLabel_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getTransactionMetadataAsCBOR("0", count:101, page:1), throwsException); //"querystring.count should be <= 100"
    });

       
    test('test_transactionMetadataJsonForLabel_willReturn_transactionMetadataLabelJsonForCountPageAndAscendingOrder', ()async {
    
     
          
        List<MetadataJSON> transactionMetadataLabelJsonList = await service.getTransactionMetadataAsJSON("0",count:3, page:1, order:"asc");
		
		expect(transactionMetadataLabelJsonList.length, equals(3));

     

    });

        

    test('test_transactionMetadataJsonForLabel_willReturn_allTransactionMetadataLabelJson', ()async {
    
        List<MetadataJSON> transactionMetadataLabelJsonList = await service.getTransactionMetadataAsJSON("10");
        
		expect(transactionMetadataLabelJsonList.length, greaterThanOrEqualTo(0));

    });

        
    test('test_transactionMetadataJsonForLabel_willThrowAPIException_onCountGreaterThan100', ()async {
    
		expect( () async => await service.getTransactionMetadataAsJSON("0", count:101, page:1), throwsException); //"querystring.count should be <= 100"


    });

        
   

}	