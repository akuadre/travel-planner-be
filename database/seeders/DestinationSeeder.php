<?php

namespace Database\Seeders;

use App\Models\Destination;
use App\Models\User;
use Illuminate\Database\Seeder;

class DestinationSeeder extends Seeder
{
    public function run(): void
    {
        // Get All User
        $users = User::all();

        $destinations = [

            // User 1 has 2 destinations
            [
                'user_id' => $users[0]->id,
                'title' => 'Trip ke Gunung Bromo',
                'photo' => 'bromo.png',
                'departure_date' => '2026-03-15',
                'budget' => 2500000,
                'duration_days' => 3,
                'is_achieved' => false,
            ],
            [
                'user_id' => $users[0]->id,
                'title' => 'City Tour Jakarta',
                'photo' => 'jakarta.png',
                'departure_date' => '2026-06-01',
                'budget' => 3000000,
                'duration_days' => 4,
                'is_achieved' => false,
            ],

            // User 2 has 2 destinations
            [
                'user_id' => $users[1]->id,
                'title' => 'Liburan ke Pantai Kuta Bali',
                'photo' => 'pantaibali.png',
                'departure_date' => '2026-04-20',
                'budget' => 5000000,
                'duration_days' => 5,
                'is_achieved' => false,
            ],
            [
                'user_id' => $users[1]->id,
                'title' => 'Wisata Kuliner Bandung',
                'photo' => 'bandung.png',
                'departure_date' => '2026-07-12',
                'budget' => 2000000,
                'duration_days' => 3,
                'is_achieved' => false,
            ],

            // User 3 has 2 destinations
            [
                'user_id' => $users[2]->id,
                'title' => 'Camping di Gunung Cikuray',
                'photo' => 'cikuray.png',
                'departure_date' => '2026-05-10',
                'budget' => 1500000,
                'duration_days' => 2,
                'is_achieved' => false,
            ],
            [
                'user_id' => $users[2]->id,
                'title' => 'Backpacker Jogja',
                'photo' => 'jogja.png',
                'departure_date' => '2026-08-05',
                'budget' => 1800000,
                'duration_days' => 4,
                'is_achieved' => false,
            ],
        ];

        foreach ($destinations as $destinationData) {
            Destination::create($destinationData);
        }
    }
}
