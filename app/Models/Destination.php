<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Destination extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'photo',
        'title',
        'departure_date',
        'budget',
        'duration_days',
        'is_achieved'
    ];

    protected $casts = [
        'departure_date' => 'date',
        'budget' => 'decimal:2',
        'is_achieved' => 'boolean'
    ];

    // Relation with user
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Relation with itineraries
    public function itineraries()
    {
        return $this->hasMany(Itinerary::class);
    }
}
