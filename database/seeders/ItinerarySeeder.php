<?php

namespace Database\Seeders;

use App\Models\Destination;
use App\Models\Itinerary;
use Illuminate\Database\Seeder;

class ItinerarySeeder extends Seeder
{
    public function run(): void
    {
        // Get all destinations
        $destinations = Destination::all();

        // Generate an itinerary for each destination
        foreach ($destinations as $destination) {

            if ($destination->title === 'Trip ke Gunung Bromo') {
                $this->createBromoItinerary($destination);
            }
            elseif ($destination->title === 'Liburan ke Pantai Kuta Bali') {
                $this->createBaliItinerary($destination);
            }
            else {
                // For other destination (default itinerary)
                $this->createDefaultItinerary($destination);
            }
        }
    }

    // ITINERARY FOR BROMO (3 DAYS)
    private function createBromoItinerary($destination)
    {
        $itineraries = [
            // Day 1
            [
                'destination_id' => $destination->id,
                'day_number' => 1,
                'location' => 'Stasiun Kereta - Malang',
                'description' => 'Berangkat dari Jakarta ke Malang',
                'schedule_time' => '07:00',
                'activities' => 'Naik kereta dari Gambir, perjalanan menuju Malang'
            ],
            [
                'destination_id' => $destination->id,
                'day_number' => 1,
                'location' => 'Hotel Malang',
                'description' => 'Check-in hotel dan istirahat',
                'schedule_time' => '16:00',
                'activities' => 'Check-in hotel, makan malam, persiapan pendakian'
            ],

            // Day 2
            [
                'destination_id' => $destination->id,
                'day_number' => 2,
                'location' => 'Penanjakan Bromo',
                'description' => 'Sunrise view di Penanjakan',
                'schedule_time' => '04:00',
                'activities' => 'Naik jeep menuju Penanjakan, foto sunrise'
            ],
            [
                'destination_id' => $destination->id,
                'day_number' => 2,
                'location' => 'Kawah Bromo',
                'description' => 'Trekking menuju kawah Bromo',
                'schedule_time' => '08:00',
                'activities' => 'Trekking dari lautan pasir ke kawah Bromo'
            ],

            // Day 3
            [
                'destination_id' => $destination->id,
                'day_number' => 3,
                'location' => 'Hotel Malang',
                'description' => 'Check-out dan persiapan pulang',
                'schedule_time' => '10:00',
                'activities' => 'Packing, check-out hotel, makan siang'
            ],
            [
                'destination_id' => $destination->id,
                'day_number' => 3,
                'location' => 'Stasiun Kereta - Jakarta',
                'description' => 'Perjalanan pulang ke Jakarta',
                'schedule_time' => '14:00',
                'activities' => 'Naik kereta kembali ke Jakarta'
            ],
        ];

        foreach ($itineraries as $itinerary) {
            Itinerary::create($itinerary);
        }
    }

    // ITINERARY FOR BALI (5 DAYS)
    private function createBaliItinerary($destination)
    {
        $itineraries = [
            // Day 1
            [
                'destination_id' => $destination->id,
                'day_number' => 1,
                'location' => 'Bandara Ngurah Rai',
                'description' => 'Tiba di Bali dan check-in hotel',
                'schedule_time' => '12:00',
                'activities' => 'Jemputan dari bandara, check-in hotel di Kuta'
            ],

            // Day 2
            [
                'destination_id' => $destination->id,
                'day_number' => 2,
                'location' => 'Pantai Kuta',
                'description' => 'Bersantai di pantai Kuta',
                'schedule_time' => '09:00',
                'activities' => 'Sunbathing, berenang, surfing lesson'
            ],

            // Day 3
            [
                'destination_id' => $destination->id,
                'day_number' => 3,
                'location' => 'Ubud',
                'description' => 'Day trip ke Ubud',
                'schedule_time' => '08:00',
                'activities' => 'Visit monkey forest, rice terrace, art market'
            ],

            // Day 4
            [
                'destination_id' => $destination->id,
                'day_number' => 4,
                'location' => 'Tanah Lot',
                'description' => 'Sunset di Tanah Lot',
                'schedule_time' => '17:00',
                'activities' => 'Foto sunset, visit temple, cultural performance'
            ],

            // Day 5
            [
                'destination_id' => $destination->id,
                'day_number' => 5,
                'location' => 'Bandara Ngurah Rai',
                'description' => 'Check-out dan pulang',
                'schedule_time' => '10:00',
                'activities' => 'Packing, check-out, transfer ke bandara'
            ],
        ];

        foreach ($itineraries as $itinerary) {
            Itinerary::create($itinerary);
        }
    }

    // Make other destination with itinerary default
    private function createDefaultItinerary($destination)
    {
        for ($day = 1; $day <= $destination->duration_days; $day++) {

            $activities = [
                "Check-in hotel dan istirahat",
                "Explore tempat wisata sekitar",
                "Makan di restoran lokal",
                "Foto-foto di spot menarik",
                "Belanja souvenir",
                "Persiapan untuk hari berikutnya",
                "Check-out dan perjalanan pulang"
            ];

            Itinerary::create([
                'destination_id' => $destination->id,
                'day_number' => $day,
                'location' => 'Lokasi Day ' . $day,
                'description' => 'Aktivitas hari ke-' . $day . ' di ' . $destination->title,
                'schedule_time' => '08:00',
                'activities' => $activities[$day - 1] ?? 'Aktivitas hari ke-' . $day
            ]);

            // Add 1 itinerary for last day (check-out)
            if ($day == $destination->duration_days) {
                Itinerary::create([
                    'destination_id' => $destination->id,
                    'day_number' => $day,
                    'location' => 'Bandara/Stasiun',
                    'description' => 'Perjalanan pulang',
                    'schedule_time' => '14:00',
                    'activities' => 'Check-out, packing, transfer ke bandara/stasiun'
                ]);
            }
        }
    }
}
