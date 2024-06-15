<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LiquidacionHistorico extends Model
{
    use HasFactory;

    protected $table = 'liquidacionhistorico';
    protected $primaryKey = 'persona_codigo';

    public function persona(): BelongsTo
    {
        return $this->belongsTo(Persona::class, 'persona_codigo');
    }

    public function cargo(): BelongsTo
    {
        return $this->belongsTo(Cargo::class, 'cargo');
    }
}
