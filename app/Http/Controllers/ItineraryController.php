<?php

namespace App\Http\Controllers;

use App\Models\Destination;
use App\Models\Itinerary;
use Illuminate\Http\Request;

class ItineraryController extends Controller
{
    public function indexByDestination(Request $request, Destination $destination)
    {
        if ($destination->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        return $destination->itineraries()->orderBy('day_number')->orderBy('schedule_time')->get();
    }

    public function store(Request $request)
    {
        $request->validate([
            'destination_id' => 'required|exists:destinations,id',
            'day_number' => 'required|integer|min:1',
            'location' => 'required|string',
            'description' => 'required|string',
            'schedule_time' => 'nullable|date_format:H:i',
            'activities' => 'nullable|string'
        ]);

        $destination = Destination::find($request->destination_id);

        if ($destination->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $itinerary = Itinerary::create($request->all());

        return response()->json($itinerary, 201);
    }

    public function show(Request $request, Itinerary $itinerary)
    {
        if ($itinerary->destination->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        return $itinerary;
    }

    public function update(Request $request, Itinerary $itinerary)
    {
        if ($itinerary->destination->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $request->validate([
            'day_number' => 'sometimes|required|integer|min:1',
            'location' => 'sometimes|required|string',
            'description' => 'sometimes|required|string',
            'schedule_time' => 'nullable|date_format:H:i',
            'activities' => 'nullable|string'
        ]);

        $itinerary->update($request->all());

        return response()->json($itinerary);
    }

    public function destroy(Request $request, Itinerary $itinerary)
    {
        if ($itinerary->destination->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $itinerary->delete();

        return response()->json(['message' => 'Itinerary deleted successfully']);
    }
}
