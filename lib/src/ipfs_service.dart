import './service.dart';

import 'package:http/http.dart' as http;

class IPFSAdd  extends DartPenance<IPFSAdd>
{
    late String name;           // : "README.md",
    late String ipfs_hash;      // : "QmZbHqiCxKEVX7QfijzJTkZiSi3WEVTcvANgNAWzDYgZDr",
    late String size;           // "125297"

	@override IPFSAdd fromJson(Map<String, dynamic> json)
	{
		name 			= json['name'];
		ipfs_hash 			= json['ipfs_hash'];
		size 			= json['size'];

		return this;
	}
	
	@override IPFSAdd create()
	{
		return IPFSAdd();
	}
}

class IPFSPinChange extends DartPenance<IPFSPinChange>
{
    late String ipfs_hash;      // : "QmZbHqiCxKEVX7QfijzJTkZiSi3WEVTcvANgNAWzDYgZDr",
    late String state;          // "queued"

	@override IPFSPinChange fromJson(Map<String, dynamic> json)
	{
		ipfs_hash 			= json['ipfs_hash'];
		state 			= json['state'];
		

		return this;
	}
	
	@override IPFSPinChange create()
	{
		return IPFSPinChange();
	}
}

class IPFSPinnedObject extends DartPenance<IPFSPinnedObject>
{
    late num time_created;   // 1615551024,
    late num time_pinned;    // 1615551024,
    late String ipfs_hash;      // "QmdVMnULrY95mth2XkwjxDtMHvzuzmvUPTotKE1tgqKbCx",
    late String size;           //": "1615551024",
    late String state;          //: "pinned"

	@override IPFSPinnedObject fromJson(Map<String, dynamic> json)
	{
		time_created 			= json['time_created'];
		time_pinned 			= json['time_pinned'];
		ipfs_hash 			= json['ipfs_hash'];
		size 			= json['size'];
		state 			= json['state'];

		return this;
	}
	
	@override IPFSPinnedObject create()
	{
		return IPFSPinnedObject();
	}
}

///IPFS
class IPFSService extends Service 
{
    IPFSService(network, projectId)
		:super(network, projectId);

	///You need to /ipfs/pin/add an object to avoid it being garbage collected. This usage is being counted in your user account quota.
    Future<IPFSAdd> addFile(String name, Stream<List<int>> stream)
    {
		Future<http.StreamedResponse> resp = postFile("/ipfs/add", name, stream, null, null);
		
		
		
		return objectFromRespStreamed(resp, IPFSAdd() );
    }
    
    ///Retrieve an object from the IPFS gateway (useful if you do not want to rely on a public gateway, such as ipfs.blockfrost.dev).
    Future<Stream<List<int>>> getFile(String ipfs_path) async
    {       
		Future<http.StreamedResponse> futureResp = getStreamed("/ipfs/gateway/$ipfs_path");
	
		http.StreamedResponse resp = await futureResp;
	
		return Future.value( (resp).stream );
    }
    
    ///Pinned objects are counted in your user storage quota.
    Future<IPFSPinChange> pinObject(String IPFS_path)
    {
		Future<http.Response> resp = postVoid("/ipfs/pin/add/$IPFS_path", null);
	
		return objectFromResp(resp, IPFSPinChange() );
    }
    
    ///List objects pinned to local storage
    Future<List<IPFSPinnedObject>> listPinnedObjects({int? count, int? page, String? order})
    {
		Future<http.Response> resp = get("/ipfs/pin/list", createPage(count, page, order));
	
		return listFromResp(resp, IPFSPinnedObject() );
	
    }
   
    ///Get information about locally pinned IPFS object
    Future<IPFSPinnedObject> getPinnedObject(String IPFS_path)
    {
		Future<http.Response> resp = get("/ipfs/pin/list/$IPFS_path", null);
	
		return objectFromResp(resp, IPFSPinnedObject() );
    }
    
    ///Remove pinned objects from local storage
    Future<IPFSPinChange> removePinnedObject(String IPFS_path)
    {
		Future<http.Response> resp = postVoid("/ipfs/pin/remove/$IPFS_path", null);
	
        return objectFromResp(resp, IPFSPinChange() );
    }
}




