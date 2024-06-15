<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Query\JoinClause;

use App\Models\Cargo;
use App\Models\Persona;
use App\Models\Liquidacion;
use App\Models\LiquidacionHistorico;

class PersonasLiquidadasController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return view('welcome');
    }

    public function listar(Request $request)
    {
        // dd($request);
        $liquidacionIngresos = DB::table('liquidacion')
            ->select('persona_codigo', DB::raw('SUM(liquidacion.valor) as total_ingresos'))
               ->where('clase', 'I')
            ->groupBy('persona_codigo');

        $liquidacionDescuentos = DB::table('liquidacion')
            ->select('persona_codigo', DB::raw('SUM(liquidacion.valor) as total_descuentos'))
            ->where('clase', 'D')
            ->groupBy('persona_codigo');

        $liquidacionPrestaciones = DB::table('liquidacion')
            ->select('persona_codigo', DB::raw('SUM(liquidacion.valor) as total_prestaciones'))
            ->where('clase', 'P')
            ->groupBy('persona_codigo');

        $personasLiquidadas = DB::table('persona')
            ->join('cargos', 'persona.cargo', '=', 'cargos.id')
            ->joinSub($liquidacionIngresos, 'liquidacionIngreso', function (JoinClause $join) {
                $join->on('persona.codigo', '=', 'liquidacionIngreso.persona_codigo');
            })
            ->joinSub($liquidacionDescuentos, 'liquidacionDescuento', function (JoinClause $join) {
                $join->on('persona.codigo', '=', 'liquidacionDescuento.persona_codigo');
            })
            ->joinSub($liquidacionPrestaciones, 'liquidacionPrestaciones', function (JoinClause $join) {
                $join->on('persona.codigo', '=', 'liquidacionPrestaciones.persona_codigo');
            })
            ->join('liquidacionhistorico', 'persona.codigo', '=', 'liquidacionhistorico.persona_codigo')
            ->select('persona.codigo', 'persona.documento', 
                'persona.primerNombre',
                'persona.segundoNombre',
                'persona.primerApellido',
                'persona.segundoApellido',
                'cargos.nombreCargo',
                'liquidacionhistorico.fechaLiquidacion',
                'liquidacionIngreso.total_ingresos',
                'liquidacionDescuento.total_descuentos',
                'liquidacionPrestaciones.total_prestaciones'
            );
            // ->where('persona.codigo', $request->codigo)
            // ->get();

        $query = $personasLiquidadas;

        if ($request->codigo) {
            $query->where('persona.codigo', $request->codigo);
        }

        if ($request->documento) {
            $query->where('persona.documento', $request->documento);
        }

        if ($request->genero) {
            $query->where('persona.genero', $request->genero);
        }

        if ($request->fechaDesde && $request->fechaHasta) {
            $query->where('liquidacionhistorico.fechaLiquidacion', '>=', $request->fechaDesde);
            $query->where('liquidacionhistorico.fechaLiquidacion', '<=', $request->fechaHasta);
        }

        $result = $query->get();

        return response()->json($result);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
