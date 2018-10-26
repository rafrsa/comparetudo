<?php

namespace App\Http\Middleware;

use Closure;
use Exception;
//use Firebase\JWT\ExpiredException;
//use Firebase\JWT\JWT;

class AuthMiddleware
{
    public function handle($request, Closure $next)
    {
//        if ( !auth()->id() )
//            dd("nao to logado");
//            return redirect()->route('login');
        $a = session('login');
        if(!$a){
            return redirect()->route('login', ["status" => 0]);
        }

//        $headers = apache_request_headers();
//
//        if (!isset($headers['Authorization'])) {
//            return response()->json([
//                'error' => 'Token not provided.',
//            ], 401);
//        }
//        $token = $headers['Authorization'];
//        try {
//            $credentials = JWT::decode($token, env('JWT_SECRET'), ['HS256']);
//        } catch (ExpiredException $e) {
//            JWT::$leeway = 7200000;
//            $credentials = JWT::decode($token, env('JWT_SECRET'), ['HS256']);
//
//            if (env('USE_MESSAGE_BROKER_TO_RENEW_JWT')) {
//                if (!$this->verificationLoggedWithCommunicator($credentials->sub)) {
//                    return $this->responseError('Provided token is expired.');
//                }
//            } else {
//                return $this->responseError('Provided token is expired.');
//            }
//        } catch (Exception $e) {
//            return $this->responseError('An error while decoding token.');
//        }
//
//        $user = \App\User::find($credentials->sub);
//
//        $request->auth = $user;
        return $next($request);

    }

    private function responseError($error, $code = 401)
    {
        return response()->json([
            'error' => $error,
        ], 401);
    }

    private function verificationLoggedWithCommunicator($agentId)
    {
//        $action = (new Actions\AgentLoggedVerificationAction($agentId))->toArray();
//        $response = InterationMessageBroker::sendWithResponse($action, 'COMMUNICATOR');
//        return isset($response['loggedInBroker']) && $response['loggedInBroker'];
    }
}
