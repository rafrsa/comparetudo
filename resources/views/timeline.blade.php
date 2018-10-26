@if($timeline)
    @foreach($timeline['posts'] as $key => $value)
        <div class="col-md-8  col-xl-8" style="margin: 0px auto">
            <div class="card">
                <div class="card-header">
                    <div class="circletag" id="nay">
                        <img class="avatar" src="{{ URL::asset('images/faces/female/1.jpg') }}">
                    </div>
                    <span class="nomePost"><h3 class="card-title">{{$value->nome}}</h3></span>
                    <div class="card-options">
                        <a href="#" class="btn btn-primary btn-sm">Action 1</a>
                        <a href="#" class="btn btn-secondary btn-sm ml-2">Action 2</a>
                    </div>
                </div>
                <div class="card-body">
                    {{$value->mensagem_post}}
                </div>
                <div class="card-footer">
                    @if(isset($value->comentarios))
                        @foreach($value->comentarios as $keyCmt => $valueCmt)
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="col-sm-2">
                                        <img class="avatar" src="{{ URL::asset('images/faces/female/1.jpg') }}">
                                    </div>
                                    <div class="col-sm-10">
                                        <a href="#!">{{$valueCmt->mensagem_comentario}}</a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </div>
    @endforeach
@else
    <h1>Sem atividade para exibir!</h1>
@endif
