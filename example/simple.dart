import 'package:blockfrost_api/blockfrost_api.dart';

void main() async  {

	String projectId = "<insert project id>";
		
	String out;
	
	try
	{
		BlockService service = BlockService(Service.networkCardanoMainnet, projectId);
    	
		BlockContent block = await service.getLatestBlock();
			  	
		out = block.hash;
	}	
	
	catch(e)
	{
		out = e.toString();
	}
	
	print(out);

}
