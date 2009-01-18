-module(yammerl).

-compile(export_all).
-include_lib("src/yammer-api-keys.hrl").

-define(YAMMER_URL, "http://www.yammer.com"). 

-define(REQUEST_TOKEN_URL, ?YAMMER_URL++"/oauth/request_token.xml").
-define(ACCESS_TOKEN_URL, ?YAMMER_URL++"/oauth/request_token").
-define(AUTHORIZATION_URL, ?YAMMER_URL++"/oauth/request_token").
-define(REALM, "").

request_token(Consumer)->
	{ok, ResponseR} = oauth:post(?REQUEST_TOKEN_URL, [], Consumer, "", ""),
	ParamsR = oauth_http:response_params(ResponseR),
	TokenR = oauth:token(ParamsR),
	TokenSecretR = oauth:token_secret(ParamsR),
	io:format(TokenR),
	io:format(TokenSecretR).

main() ->
	Consumer = {?CONSUMER_KEY, ?CONSUMER_SECRET, hmac_sha1},
	try request_token(Consumer)
	catch
		_:_ -> io:format("DEBUG: an error as occured while processing the response to request_token~n")
	end.