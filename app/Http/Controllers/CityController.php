<?php

namespace App\Http\Controllers;


use App\Http\Controllers\Controller;


use App\Model\City;
use App\Model\Flight_class;


class CityController extends Controller{
    public function main()
    {
        $cities = City::all();
        $Flight_class = Flight_class::all();
        return view('index',[
            'cities' => $cities,
            'Flight_class'=> $Flight_class,
        ]);
    }
}