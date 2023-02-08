import 'package:blockfrost_api/blockfrost_api.dart';

import  'dart:convert';

void main() async  {

	String projectId = "<insert project id>";
		
	IPFSService service = IPFSService(Service.networkIPFS, projectId);
	
	
	Stream<List<int>> content = Stream.value( utf8.encode("Hello World!") );
    
	IPFSAdd ipfsObject = await service.addFile("hello.txt", content);
            
	IPFSPinChange pinChange = await service.pinObject(ipfsObject.ipfs_hash);
	
	print(pinChange.ipfs_hash);
	
}
