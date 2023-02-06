import 'package:test/test.dart';

import 'package:blockfrost_api/blockfrost_api.dart';

import  'dart:convert';

import 'dart:io' show Platform;

void main()
{

	String projectId = Platform.environment['PROJECT_ID_IPFS'] as String;
	

	
	IPFSService service = IPFSService(Service.networkIPFS, projectId);
	
	
	Stream<List<int>> createFileWithContent(String content)
    {
		return Stream.value( utf8.encode(content) );
    }
	 
    Future<IPFSAdd> addFileToIpfs(String name, String content) async 
    {
        Stream<List<int>> file = createFileWithContent(content);
           
        return await service.addFile(name, file);
    }
	
    test('test_add_willReturn_ipfsObject', ()async {
    
        Stream<List<int>> tempFile = createFileWithContent("Hello Temp File\n");

        IPFSAdd ipfsObject = await service.addFile("test", tempFile);
        
        //System.out.println(ipfsObject);
        
		expect( ipfsObject.name, isNotNull);

        expect( ipfsObject.ipfs_hash, equals("QmWAhBXx11KUkLxkYMNNCvriLWtPLRqw8Eo4EKHFeMBA5a"));
        
        expect(ipfsObject.size, equals("24"));
        

    });
	
	
  
    test('test_get_willReturnContent_WhenValidIpfsHash', ()async {
    
        Stream<List<int>> content = await service.getFile("QmWAhBXx11KUkLxkYMNNCvriLWtPLRqw8Eo4EKHFeMBA5a");
        
		String str = await Service.byteStreamToUtf8String(content);

		expect( str , equals("Hello Temp File\n") );


    });

    
    test('test_pinAdd_willReturn_pinState', ()async {
    
        //Add the file incase it's removed
        Stream<List<int>> tempFile = createFileWithContent("Hello Temp File\n");
        
        IPFSAdd ipfsObject = await service.addFile("test", tempFile);

        String ipfsHash = "QmWAhBXx11KUkLxkYMNNCvriLWtPLRqw8Eo4EKHFeMBA5a";
        
        IPFSPinChange pinResponse = await service.pinObject(ipfsHash);

        //System.out.println(pinResponse);

		expect(pinResponse.ipfs_hash, equals(ipfsHash));       

        expect(pinResponse.state == "queued" || pinResponse.state =="pinned" , isTrue);
        
        
        
    });

    
    test('test_getPinnedObjectsWithPagination_willReturn_pinnedObjects', ()async {
    
        //Add 15 items
        List<IPFSPinChange> ipfsObjects = [];
        
        for(int i=0; i < 14; i++)
        {
            Stream<List<int>> file = createFileWithContent("Hello Temp File-$i");
            
            IPFSAdd ipfsObject = await service.addFile("test", file);
            
           	IPFSPinChange ipfsService = await service.pinObject(ipfsObject.ipfs_hash);
            ipfsObjects.add( ipfsService );
           
            await Future.delayed(Duration(seconds: 1));
        }

        List<IPFSPinnedObject> pinnedItems1 = await service.listPinnedObjects( count:5, page:1, order:"desc");
        List<IPFSPinnedObject> pinnedItems2 = await service.listPinnedObjects( count:5, page:2, order:"desc");
        List<IPFSPinnedObject> pinnedItems3 = await service.listPinnedObjects( count:5, page:3, order:"desc");
        //System.out.println(pinnedItems1);

		expect(pinnedItems1.length, equals(5));
		expect(pinnedItems2.length, equals(5));
        expect(pinnedItems3.length, greaterThanOrEqualTo(4));
        
        expect( pinnedItems1[0].ipfs_hash, isNotNull);
        
        expect( pinnedItems1[0].time_created, isNot(equals(0)));
		expect( pinnedItems1[0].time_pinned, isNot(equals(0)));

        
        expect( pinnedItems1[0].state, isNotNull);
        
        
        
    });

    
    test('test_getPinnedObjects_willReturn_AllPinItems', ()async {
    
        //Add 14 items
        List<IPFSPinChange> ipfsObjects = [];
        
        for(int i=0; i < 14; i++)
        {
            Stream<List<int>> file = createFileWithContent("Hello Temp File-$i");
            
            IPFSAdd ipfsObject = await service.addFile("test", file);
            
            IPFSPinChange ipfsService =await service.pinObject(ipfsObject.ipfs_hash);
            ipfsObjects.add(ipfsService);
            
            await Future.delayed(Duration(seconds: 1));
        }

        //((IPFSServiceImpl)ipfsService).setDefaultFetchSize(10);
        
        List<IPFSPinnedObject> pinnedItems = await service.listPinnedObjects();
        
        expect(pinnedItems.length, greaterThanOrEqualTo(14));
        
    });

    
    test('test_getPinnedObjectByIpfsPath_willReturn_pinnedObject', ()async {
    
        //Add object and pin
        IPFSAdd ipfsObject = await addFileToIpfs("test", "Hello Temp File\n");
        
        String ipfsHash = ipfsObject.ipfs_hash;
        
        service.pinObject(ipfsHash);

        IPFSPinnedObject pinItem = await service.getPinnedObject(ipfsHash);
        //System.out.println(pinItem);

		expect(pinItem.time_created, greaterThan(0));
		expect(pinItem.time_pinned, greaterThan(0));
		
		expect(pinItem.ipfs_hash, equals(ipfsHash));

		expect(pinItem.state, isNotNull);
		expect(pinItem.size, equals("24"));        

    });

    
    test('test_getPinnedObjectByIpfsPath_willUnpinAndReturn_UnpinnedObject', ()async {
    
        //Add object and pin
        IPFSAdd ipfsObject = await addFileToIpfs("test", "Hello Temp File");
        service.pinObject( ipfsObject.ipfs_hash );

        //Remove pin
        IPFSPinChange pinItem = await service.removePinnedObject( ipfsObject.ipfs_hash );
        //System.out.println(pinItem);
		
		expect(pinItem.ipfs_hash, equals(ipfsObject.ipfs_hash));
		
		expect( pinItem.state, equals("unpinned"));

    });
}