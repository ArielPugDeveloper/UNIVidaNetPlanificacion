using System;
using System.Globalization;
using System.Web;
using System.Web.UI;
using UNIVidaNetPlanificacion.Parametrizacion;

namespace UNIVidaNetPlanificacion
{
    public partial class SiteMaster : MasterPage
    {
        public static string RutaDominio = MasterUD.Dominio();
        protected void Page_Load(object sender, EventArgs e)
        {
            spnNombreCompleto.InnerText = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(MasterUD.ObtenerNombreCompleto().ToLower());
        }
    }
}
