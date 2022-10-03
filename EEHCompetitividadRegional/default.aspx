<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="EEHCompetitividadRegional._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="FormaCliente" runat="server">
        <div class="row">
            <div class="col-md-12">
                <h4 class="box-title m-b-20">Como utilizar la plataforma</h4>
                <div class="panel-group" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="font-bold">¿Donde ingreso la información del cliente?</a></h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                Para ingresar información y que sea revisado por el equipo de la Empresa Energía Honduras debes entrar al boton de Ingresar Información que esta ubicado al lado izquierdo de la pantalla, llenar todos los campos requeridos y dara al botón de enviar.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title"><a class="collapsed font-bold" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">¿Donde actualizo el numero de OS y el estado de mi gestión? </a></h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                Esta información la actualizas en el boton de Actualización analisis, este botón se encuentra en la parte baja del menu izquierdo, busca por el codigo de cliente y se desbloqueara los campos para que introduzcas lo requerido.
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>

        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
