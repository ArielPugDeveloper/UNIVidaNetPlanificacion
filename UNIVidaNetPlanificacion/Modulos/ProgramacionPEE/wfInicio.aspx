<%@ Page Title="PEE - POA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfInicio.aspx.cs" Inherits="UNIVidaNetPlanificacion.Modulos.ProgramacionPEE.wfInicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .inicio-container {
            min-height: 70vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        
        .btn-inicio-verde {
            width: 280px;
            height: 80px;
            font-size: 1.2rem;
            font-weight: 600;
            margin: 10px;
            border-radius: 8px;
            background: linear-gradient(to bottom, #7bc47f 0%, #5cb85c 100%);
            border: none;
            color: #2d5f2e;
            box-shadow: 0 3px 6px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        
        .btn-inicio-verde:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 12px rgba(0,0,0,0.15);
            background: linear-gradient(to bottom, #8cd08f 0%, #6bc66e 100%);
        }
        
        .btn-inicio-azul {
            width: 280px;
            height: 80px;
            font-size: 1.2rem;
            font-weight: 600;
            margin: 10px;
            border-radius: 8px;
            background: linear-gradient(to bottom, #5a9fd4 0%, #007bff 100%);
            border: none;
            color: #fff;
            box-shadow: 0 3px 6px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        
        .btn-inicio-azul:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 12px rgba(0,0,0,0.15);
            background: linear-gradient(to bottom, #6aaee0 0%, #0069d9 100%);
            color: #fff;
        }
        
        .btn-ver-registros {
            margin-top: 30px;
            padding: 12px 30px;
            font-size: 1rem;
            border-radius: 6px;
            background-color: #e0e0e0;
            border: 1px solid #d0d0d0;
            color: #555;
            transition: all 0.3s ease;
        }
        
        .btn-ver-registros:hover {
            background-color: #d0d0d0;
            border-color: #c0c0c0;
        }
        
        .link-inicio {
            position: absolute;
            top: 20px;
            left: 30px;
            color: #17a2b8;
            font-size: 1.1rem;
            text-decoration: none;
            font-weight: 500;
        }
        
        .link-inicio:hover {
            color: #138496;
            text-decoration: none;
        }
        
        .grid-botones {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            max-width: 600px;
            margin: 0 auto;
        }
    </style>

    <div style="position: relative;">
        <a href="~/Default.aspx" runat="server" class="link-inicio">INICIO</a>
    </div>

    <div class="inicio-container">
        <div class="text-center">
            <div class="grid-botones">
                <asp:Button ID="btnSeguimientoPOA" runat="server" 
                    Text="Seguimiento POA" 
                    CssClass="btn-inicio-verde" 
                    OnClick="btnSeguimientoPOA_Click" />
                
                <asp:Button ID="btnSeguimientoPEE" runat="server" 
                    Text="Seguimiento PEE" 
                    CssClass="btn-inicio-verde" 
                    OnClick="btnSeguimientoPEE_Click" />
                
                <asp:Button ID="btnProgramacionPOA" runat="server" 
                    Text="Programación POA" 
                    CssClass="btn-inicio-azul" 
                    OnClick="btnProgramacionPOA_Click" />
                
                <asp:Button ID="btnReprogramacionPOA" runat="server" 
                    Text="Reprogramacion POA" 
                    CssClass="btn-inicio-azul" 
                    OnClick="btnReprogramacionPOA_Click" />
        </div>
            
            <div class="mt-4">
                <asp:Button ID="btnVerTodosRegistros" runat="server" 
                    Text="Ver todos los registros" 
                    CssClass="btn btn-ver-registros" 
                    OnClick="btnVerTodosRegistros_Click" />
            </div>
        </div>
    </div>
</asp:Content>
