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

    public function alumni() {
        return $this->belongsTo(Alumni::class);
    }

    public function skill() {
        return $this->belongsTo(Skill::class);
    }
}
