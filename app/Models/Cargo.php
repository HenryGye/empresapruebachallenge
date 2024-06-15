<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Cargo extends Model
{
    use HasFactory;

    protected $table = 'cargos';
    protected $primaryKey = 'id';

    public function personas(): HasMany {
        return $this->hasMany(Persona::class, 'codigo', 'id');
    }

    public function liquidacionesHistoricas(): HasMany {
        return $this->hasMany(LiquidacionHistorico::class, 'cargo', 'id');
    }
}
