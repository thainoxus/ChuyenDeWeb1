<?php


    Route::get('/index', 'CityController@main')->name('index');
    Route::get('/', 'CityController@main')->name('index');
    
    
    Route::get('/register', 'RegisterController@index')->name('register');
    Route::post('/register', 'RegisterController@postRegister');

    Route::get('/login', 'LoginController@index')->name('login');
    Route::post('/login', 'LoginController@postLogin');
    Route::get('/logout', 'LoginController@logout')->name('logout')->middleware('auth');
    
    Route::get('/update', 'UpdateController@getInfor')->name('update')->middleware('auth');
    Route::post('/update', 'UpdateController@postUpdate')->name('attendupdate');

    Route::get('/flight-list', 'FlightListController@index')->name('flight-list');
