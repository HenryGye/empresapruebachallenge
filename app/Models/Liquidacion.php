<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Liquidacion extends Model
{
    use HasFactory;

    protected $table = 'liquidacion';
    protected $primaryKey = 'id';

    public function persona(): BelongsTo
    {
        return $this->belongsTo(Persona::class, 'persona_codigo');
    }
}
