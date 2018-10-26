<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Controllers\TimelineController;

class AppController extends Controller
{
    public function index(Request $request)
    {
        // dd("logado");
        // $objTimeline = new TimelineController();
        // $data['timeline'] = $objTimeline->getTimeline();
        // //dd($data);

        // return view('app', $data);
    }
}
