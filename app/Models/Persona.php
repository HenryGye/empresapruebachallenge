<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Persona extends Model
{
    use HasFactory;

    protected $table = 'persona';
    protected $primaryKey = 'codigo';

    public function cargo(): BelongsTo
    {
        return $this->belongsTo(Cargo::class, 'cargo');
    }

    public function liquidaciones(): HasMany {
        return $this->hasMany(Liquidacion::class, 'persona_codigo', 'codigo');
    }

    public function liquidacionesHistoricas(): HasMany {
        return $this->hasMany(LiquidacionHistorico::class, 'persona_codigo', 'codigo');
    }
}
