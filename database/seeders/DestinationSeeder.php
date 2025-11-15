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
                'departure_date' => '2024-03-15',
                'budget' => 2500000,
                'duration_days' => 3,
                'is_achieved' => true,
            ],
            [
                'user_id' => $users[0]->id,
                'title' => 'City Tour Jakarta',
                'departure_date' => '2024-06-01',
                'budget' => 3000000,
                'duration_days' => 4,
                'is_achieved' => false,
            ],

            // User 2 has 2 destinations
            [
                'user_id' => $users[1]->id,
                'title' => 'Liburan ke Pantai Kuta Bali',
                'departure_date' => '2024-04-20',
                'budget' => 5000000,
                'duration_days' => 5,
                'is_achieved' => false,
            ],
            [
                'user_id' => $users[1]->id,
                'title' => 'Wisata Kuliner Bandung',
                'departure_date' => '2024-07-12',
                'budget' => 2000000,
                'duration_days' => 3,
                'is_achieved' => true,
            ],

            // User 3 has 2 destinations
            [
                'user_id' => $users[2]->id,
                'title' => 'Camping di Gunung Cikuray',
                'departure_date' => '2024-05-10',
                'budget' => 1500000,
                'duration_days' => 2,
                'is_achieved' => false,
            ],
            [
                'user_id' => $users[2]->id,
                'title' => 'Backpacker Jogja',
                'departure_date' => '2024-08-05',
                'budget' => 1800000,
                'duration_days' => 4,
                'is_achieved' => true,
            ],
        ];

        foreach ($destinations as $destinationData) {
            Destination::create($destinationData);
        }
    }
}
