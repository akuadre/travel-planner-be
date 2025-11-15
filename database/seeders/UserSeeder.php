<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        User::create([
            'name' => 'Adrenalin',
            'email' => 'adrenalin@gmail.com',
            'password' => Hash::make('adrenalin'),
        ]);

        User::create([
            'name' => 'Andhika',
            'email' => 'andhika@gmail.com',
            'password' => Hash::make('andhika'),
        ]);

        User::create([
            'name' => 'Reyva',
            'email' => 'reyva@gmail.com',
            'password' => Hash::make('reyva'),
        ]);
    }
}
