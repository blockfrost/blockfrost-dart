import 'dart:async';

class Throttler
{
    static Throttler create()
    {
        Throttler._instance ??= Throttler();
	
        return Throttler._instance as Throttler;
    }
    
    static Throttler? _instance;
    
    static num _secsNow()
    {
		return DateTime.now().millisecondsSinceEpoch / 1000.0;
    }
    
    Throttler()
		: _requestCount = 0, _lastRequestTime = Throttler._secsNow();
    
   
    static const num burstLimit                  = 500;
    static const num burstCooldown               = 10;
    static const int burstCooldownIntervalSecs   = 1;
    
    num _requestCount;
    num _lastRequestTime;

    next() async
    {
        num secsSinceLastCall = Throttler._secsNow() - _lastRequestTime;
            
        num cooledOffRequests = secsSinceLastCall * Throttler.burstCooldown;
         
        _requestCount = _requestCount > cooledOffRequests ? _requestCount - cooledOffRequests : 0;

        while ( _requestCount >= Throttler.burstLimit)
        {
			await Future.delayed(Duration(seconds: Throttler.burstCooldownIntervalSecs));
            
            _requestCount -= Throttler.burstCooldown;
        }

        _lastRequestTime = Throttler._secsNow();
        _requestCount++;
    }
    
}
   
