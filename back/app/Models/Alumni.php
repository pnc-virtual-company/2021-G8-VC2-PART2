<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Alumni extends Model
{
    use HasFactory;
    protected $fillable = [
        'gender',
        'profile',
        'batch',
        'major',
        'phone'
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function alumni_skill() {
        return $this->hasMany(Alumni_skill::class);
    }
}
