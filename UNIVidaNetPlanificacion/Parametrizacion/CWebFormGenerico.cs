using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using UVNetDTOs.DTOsGenericas.Resultado;
using UVNetTransversal.AgenteServicios.Almacenamiento.Archivos.EntidadesSalida;
using UVNetTransversal.Almacenamiento.Archivos;
using UVNetTransversal.Notificaciones.Mail;
using UVNetTransversal.ProgramacionFront.Web.WebForm;

namespace UNIVidaNetPlanificacion.Parametrizacion
{
    public class CWebFormGenerico : CBWebFormGenerico
    {
        public CWebFormGenerico()
        {
            this.LoadComplete += new EventHandler(CustomPage_LoadComplete);
        }
        protected void CustomPage_LoadComplete(object sender, EventArgs e)
        {
            EjecutarDesdeJavaScript();
        }
        private void EjecutarDesdeJavaScript()
        {
            string evento = Request.Params["__EVENTTARGET"];
            if (!string.IsNullOrEmpty(evento))
            {
                Type tipo = this.GetType();
                MethodInfo metodo = tipo.GetMethod(evento);
                if (metodo != null)
                    metodo.Invoke(this, null);
            }
        }
        protected void AbrirModal(string idModal)
        {
            string ejecucion = "$('#" + idModal + "').modal('show'); registrarModal('" + idModal + "'); ";
            ejecucion = "$(function() { " + ejecucion + "});";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ejecucion, true);
        }
        protected void CerrarModal(string idModal)
        {
            string ejecucion = "$('#" + idModal + "').modal('hide'); quitarRegistroModal('" + idModal + "');";
            ejecucion = "$(function() { " + ejecucion + "});";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ejecucion, true);
        }
        public void SwalAtencion(string texto, string url = "")
        {
            texto = HttpUtility.JavaScriptStringEncode(texto);
            Swal(texto, url, "Atención", "warning");
        }
        public void SwalError(string texto, string url = "")
        {
            texto = HttpUtility.JavaScriptStringEncode(texto);
            Swal(texto, url, "Error", "error");
        }
        public void SwalCorrecto(string texto, string url = "")
        {
            texto = HttpUtility.JavaScriptStringEncode(texto);
            Swal(texto, url, "Correcto", "success");
        }
        public void SwalConfirmar(string mensaje, string eventoSi)
        {
            mensaje = HttpUtility.JavaScriptStringEncode(mensaje);
            string ejecucion = $"swalConfirmarBack(\"{mensaje}\",\"{eventoSi}\");";
            ejecucion = "$(function() { " + ejecucion + "})";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ejecucion, true);
        }
        public void SwalEvento(string titulo, string mensaje, string tipo, string funcionAceptar, string txtbtnConfirmar = "Si, continuar", string txtbtnCancelar = "Cancelar")
        {
            mensaje = HttpUtility.JavaScriptStringEncode(mensaje);
            string ejecucion = $"swalEventoBack(\"{titulo}\",\"{mensaje}\",\"{tipo}\",\"{funcionAceptar}\",\"{txtbtnConfirmar}\",\"{txtbtnCancelar}\");";
            ejecucion = "$(function() { " + ejecucion + "})";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ejecucion, true);
        }
        public void ToastCorrecto(string texto)
        {
            texto = HttpUtility.JavaScriptStringEncode(texto);
            string ejecucion = "$(function() { ToastCorrecto('" + texto + "')})";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ejecucion, true);
        }
        public string NullAString(string Cadena)
        {
            return string.IsNullOrWhiteSpace(Cadena) ? "" : Cadena;
        }
        public decimal ConvertirStringEnDecimal(string Cadena)
        {
            Cadena = Cadena.Trim();
            decimal retornarDecimal = 0;
            if (EsDecimal(Cadena))
            {
                retornarDecimal = decimal.Parse(Cadena);
            }
            return retornarDecimal;
        }
        public int ConvertirStringEnInt(string Cadena)
        {
            Cadena = string.IsNullOrWhiteSpace(Cadena) ? "" : Cadena;
            Cadena = Cadena.Trim();
            int retornarEntero = 0;
            if (EsNumero(Cadena))
            {
                retornarEntero = int.Parse(Cadena);
            }
            return retornarEntero;
        }

        public bool EsNumero(string input)
        {
            int test;
            return int.TryParse(input, out test);
        }
        public bool EsDecimal(string input)
        {
            decimal test;
            return decimal.TryParse(input, out test);
        }
        public string MayusculasEspacios(string Cadena)
        {
            string cadena = Cadena.Trim().ToUpper();
            return cadena;
        }


        public void DescargaArchivo(decimal TAdjuntoFk)
        {
            CAlmacenamientoArchivosO oAlmacenamientoArchivoObtenerDatos = new CAlmacenamientoArchivosO();
            oAlmacenamientoArchivoObtenerDatos.Secuencial = TAdjuntoFk;

            CArchivosAdjuntos Archivo = new CArchivosAdjuntos();
            CResultadoDecimal oResultadoDecimal = base.AlmacenamientoArchivos_ArchivosAdjuntosO(oAlmacenamientoArchivoObtenerDatos, ref Archivo);

            if (oResultadoDecimal.Exito)
            {
                string Extension = string.Empty;

                Extension = Archivo.ArchivoExtension;
                Response.Clear();
                MemoryStream ms = new MemoryStream(Archivo.ArchivoAdjunto);
                Response.ContentType = Archivo.ArchivoTipoContenido;
                Response.AddHeader("content-disposition", "attachment;filename=" + Archivo.ArchivoDescripcion.Replace(' ', '_'));
                Response.Buffer = true;
                ms.WriteTo(Response.OutputStream);
                Response.End();
            }
            else
            {
                SwalAtencion(oResultadoDecimal.Mensaje);
            }
        }

        public void EnviaNotificacion(int Secuencial, List<CDestinatario> lDestinatarios, List<CCc> lCc, List<CParametroMail> lParametroMail, string Asunto)
        {
            CNotificacionesMailO oNotificacionesMailO = new CNotificacionesMailO();

            oNotificacionesMailO.Secuencial = Secuencial;
            oNotificacionesMailO.lDestinatario = lDestinatarios;
            oNotificacionesMailO.lCc = lCc;
            oNotificacionesMailO.lParametroMail = lParametroMail;
            oNotificacionesMailO.Asunto = Asunto;

            bool ValEnviarCorreo = Convert.ToBoolean(ConfigurationManager.AppSettings["EnviarCorreo"].ToString());
            if (ValEnviarCorreo)
                base.EnviarCorreo(oNotificacionesMailO);
        }



    }
}
