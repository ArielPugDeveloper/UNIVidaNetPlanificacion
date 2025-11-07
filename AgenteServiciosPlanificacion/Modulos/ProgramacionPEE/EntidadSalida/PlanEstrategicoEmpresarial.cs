using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AgenteServiciosPlanificacion.Modulos.ProgramacionPEE.EntidadSalida
{
    public class PlanEstrategicoEmpresarial
    {
        public string Perspectiva { get; set; }
        public string ObjetivoEstrategico { get; set; }
        public string AccionEstrategica     { get; set; }
        public string Resultado { get; set; }
        public string LineaBase { get; set; }
        public string Indicador { get; set; }
        public string TipoEjecucion { get; set; }
        public decimal? Meta1 { get; set; }
        public decimal? Meta2 { get; set; }
        public decimal? Meta3 { get; set; }
        public decimal? Meta4 { get; set; }
        public decimal? Meta5 { get; set; }
        public string Meta { get; set; }
        public string ResponsablePEE { get; set; }

    }
}
