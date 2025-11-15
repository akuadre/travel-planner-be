<?php

namespace App\Http\Controllers;

use App\Models\Destination;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DestinationController extends Controller
{
    public function index(Request $request)
    {
        return $request->user()->destinations()->with('itineraries')->get();
    }

    public function store(Request $request)
    {
        $request->validate([
            'photo' => 'nullable|image|max:2048',
            'title' => 'required|string|max:255',
            'departure_date' => 'required|date',
            'budget' => 'required|numeric|min:0',
            'duration_days' => 'required|integer|min:1',
            'is_achieved' => 'boolean'
        ]);

        $data = $request->all();
        $data['user_id'] = $request->user()->id;

        if ($request->hasFile('photo')) {
            $data['photo'] = $request->file('photo')->store('destinations', 'public');
        }

        $destination = Destination::create($data);

        return response()->json($destination, 201);
    }

    public function show(Request $request, Destination $destination)
    {
        if ($destination->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        return $destination->load('itineraries');
    }

    public function update(Request $request, Destination $destination)
    {
        if ($destination->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $request->validate([
            'photo' => 'nullable|image|max:2048',
            'title' => 'sometimes|required|string|max:255',
            'departure_date' => 'sometimes|required|date',
            'budget' => 'sometimes|required|numeric|min:0',
            'duration_days' => 'sometimes|required|integer|min:1',
            'is_achieved' => 'sometimes|boolean'
        ]);

        $data = $request->all();

        if ($request->hasFile('photo')) {
            if ($destination->photo) {
                Storage::disk('public')->delete($destination->photo);
            }
            $data['photo'] = $request->file('photo')->store('destinations', 'public');
        }

        $destination->update($data);

        return response()->json($destination);
    }

    public function destroy(Request $request, Destination $destination)
    {
        if ($destination->user_id !== $request->user()->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        if ($destination->photo) {
            Storage::disk('public')->delete($destination->photo);
        }

        $destination->delete();

        return response()->json(['message' => 'Destination deleted successfully']);
    }
}
