<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class alumni_skill extends Model
{
    use HasFactory;
    protected $fillable = [
        'alumni_id',
        'skill_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'created_at',
        'updated_at',
    ];
    
    public function alumni() {
        return $this->belongsTo(Alumni::class);
    }
}