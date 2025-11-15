<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Itinerary extends Model
{
    use HasFactory;

    protected $fillable = [
        'destination_id',
        'day_number',
        'location',
        'description',
        'schedule_time',
        'activities'
    ];

    protected $casts = [
        'schedule_time' => 'datetime:H:i'
    ];

    // Relation with destination
    public function destination()
    {
        return $this->belongsTo(Destination::class);
    }
}
