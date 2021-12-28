<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employment extends Model
{
    use HasFactory;
    protected $fillable = [
        'alumni_id',
        'position_id',
        'company_id'
    ];

    public function alumni() {
        return $this->belongsTo(Alumni::class);
    }

    public function position() {
        return $this->belongsTo(Position::class);
    }
    
    public function company() {
        return $this->belongsTo(Company::class);
    }

}
