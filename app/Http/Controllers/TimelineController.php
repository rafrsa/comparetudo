<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Post;

class TimelineController extends Controller
{
    public function getTimeline(){
        $sql = "SELECT pst.id
                     , pst.data as data_post
                     , pst.mensagem as mensagem_post
                     , usr.nome
        FROM posts pst
        INNER JOIN usuarios usr ON usr.id = pst.usuario_id";

        $posts['posts'] = DB::select($sql);

        foreach($posts['posts'] as $key => $value){
            $tmpComentario = $this->getComentariosPost($value->id);
            if($tmpComentario){
                $posts['posts'][$key]->comentarios = $tmpComentario;
            }
        }

        return $posts;
    }

    public function getComentariosPost($postId){
        $sql = "SELECT cmt.data as data_comentario
                     , cmt.mensagem as mensagem_comentario
                     , usr.nome as nome_comentarista
                     , usr.imagem as imagem_comentarista                     
        FROM comentarios cmt
        INNER JOIN usuarios usr ON usr.id = cmt.usuario_id
        WHERE cmt.post_id = {$postId}";

        $comentarios = DB::select($sql);

        return $comentarios;
    }
}
