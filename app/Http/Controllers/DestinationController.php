<?php

namespace App\Http\Controllers;

use App\Models\Destination;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
            $fileName = $request->file('photo')->hashName(); // Generate unique name
            $request->file('photo')->storeAs('destinations', $fileName, 'public');
            $data['photo'] = $fileName; // Hanya nama file: "abc123.jpg"
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
            // Hapus foto lama jika ada
            if ($destination->photo) {
                Storage::disk('public')->delete('destinations/' . $destination->photo);
            }

            // Simpan file baru
            $fileName = $request->file('photo')->hashName();
            $request->file('photo')->storeAs('destinations', $fileName, 'public');
            $data['photo'] = $fileName;
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
            Storage::disk('public')->delete('destinations/' . $destination->photo);
        }

        $destination->delete();

        return response()->json(['message' => 'Destination deleted successfully']);
    }

    public function bulkUpdate(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'required|integer|exists:destinations,id',
            'is_achieved' => 'required|boolean'
        ]);

        $user = $request->user();
        $destinationIds = $request->ids;

        // Verify all destinations belong to the user
        $userDestinationIds = $user->destinations()->whereIn('id', $destinationIds)->pluck('id');

        if (count($userDestinationIds) !== count($destinationIds)) {
            return response()->json(['message' => 'Unauthorized to update some destinations'], 403);
        }

        // Update status achieved
        Destination::whereIn('id', $userDestinationIds)->update([
            'is_achieved' => $request->is_achieved
        ]);

        // Return updated destinations
        $updatedDestinations = Destination::whereIn('id', $userDestinationIds)->get();

        return response()->json([
            'message' => 'Destinations updated successfully',
            'updated_count' => count($userDestinationIds),
            'destinations' => $updatedDestinations
        ]);
    }

    public function bulkDelete(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'required|integer|exists:destinations,id'
        ]);

        $user = $request->user();
        $destinationIds = $request->ids;

        // Verify all destinations belong to the user
        $userDestinationIds = $user->destinations()->whereIn('id', $destinationIds)->pluck('id');

        if (count($userDestinationIds) !== count($destinationIds)) {
            return response()->json(['message' => 'Unauthorized to delete some destinations'], 403);
        }

        // Use transaction for safety
        DB::transaction(function () use ($userDestinationIds) {
            // Get destinations with photos to delete files
            $destinationsWithPhotos = Destination::whereIn('id', $userDestinationIds)
                ->whereNotNull('photo')
                ->get();

            // Delete photo files
            foreach ($destinationsWithPhotos as $destination) {
                Storage::disk('public')->delete('destinations/' . $destination->photo);
            }

            // Delete destinations
            Destination::whereIn('id', $userDestinationIds)->delete();
        });

        return response()->json([
            'message' => 'Destinations deleted successfully',
            'deleted_count' => count($userDestinationIds)
        ]);
    }
}
