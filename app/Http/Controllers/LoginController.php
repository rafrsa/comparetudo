<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    public function authUser(Request $request){
        $data = $request->all();
        $retorno = [];

        $sql = "SELECT *
                FROM usuarios u
                WHERE u.usuario_email = '{$data['email']}'
                  AND u.usuario_senha = '{$data['senha']}'";
        $user = DB::select($sql);
        dd($user);

        if(count($user)){
            session(['login' => true]);
            $retorno['status'] = 1;
            $retorno['erro'] = "Usuário logado com sucesso!";
        }else{
            session(['login' => false]);
            $retorno['status'] = 0;
            $retorno['erro'] = "Usuário não existe!";
        }

        return $retorno;
    }

    public function registerUser(Request $request){
        $data = $request->all();
        $retorno = [];

        $sql = "SELECT *
                FROM usuarios u
                WHERE u.usuario_email = '{$data['email']}'";
        $user = DB::select($sql);

        if(count($user)){
            $retorno['status'] = 0;
            $retorno['erro'] = "Usuário já cadastrado com esse email!";
        }else{
            $sql = "INSERT INTO usuarios(usuario_nome, usuario_email, usuario_senha, niveis_nivel_id) VALUES('". $data['nome'] ."', '". $data['email'] ."', '". md5($data['senha']) ."', 2)";

            $user = DB::select($sql);

            $retorno['status'] = 1;
            $retorno['erro'] = "Usuário cadastrado com sucesso!";
        }

        return $retorno;
    }
}
