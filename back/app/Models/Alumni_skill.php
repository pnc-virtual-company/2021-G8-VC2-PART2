<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class alumni_skill extends Model
{
    use HasFactory;
    protected $fillable = [
        'alumni_id',
        'skill_name'
    ];

    public function alumni() {
        return $this->belongsTo(Alumni::class);
    }
}
