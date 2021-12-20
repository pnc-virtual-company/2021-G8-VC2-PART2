<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    use HasFactory;
    protected $fillable =['company_name','location','logo'];
    public function domain_company()
    {
        return $this->belongsTo(DomainCompany::class);
    }

}
