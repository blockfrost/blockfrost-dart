[![Build status](https://github.com/blockfrost/blockfrost-dart/actions/workflows/dart.yml/badge.svg)](https://github.com/blockfrost/blockfrost-dart/actions/workflows/dart.yml)


<img src="https://blockfrost.io/images/logo.svg" width="250" align="right" height="90">

# blockfrost-dart

<br/>

<p align="center">Dart SDK for Blockfrost.io API.</p>
<p align="center">
  <a href="#getting-started">Getting started</a> •
  <a href="#usage">Usage</a>
</p>
<br>

## Getting started

To use this SDK, you first need login into to [blockfrost.io](https://blockfrost.io) create your project to retrive your API token.

<img src="https://i.imgur.com/smY12ro.png">

<br/>

## Usage

Using the SDK is pretty straight-forward as you can see from the following example.

### Cardano

```dart
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
```


