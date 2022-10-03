<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="analisis.aspx.cs" Inherits="EEHCompetitividadRegional.analisis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="FormaCliente" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title m-b-0">Información de la Empresa</h3>
                            <p class="text-muted m-b-30 font-13">Datos importantes</p>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label for="m-t-20">Codigo Cliente</label>
                                            <div class="input-group">
                                                <asp:TextBox class="form-control" ID="txCodigoCliente" placeholder="Codigo" runat="server"></asp:TextBox>
                                                <div class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></div>
                                            </div>
                                            <br />
                                            <label for="m-t-40">Telefono</label>
                                            <div class="input-group" data-placement="bottom" data-align="top" data-autoclose="true">
                                                <asp:TextBox type="tel" class="form-control" ID="txTelefonoCliente" placeholder="Telefono" runat="server"></asp:TextBox>
                                                <div class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <label for="m-t-20">Nombre del cliente</label>
                                            <div class="input-group">
                                                <asp:TextBox type="text" class="form-control" ID="txNombreCliente" placeholder="Nombre completo" runat="server"></asp:TextBox>
                                                <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                                            </div>
                                            <br />
                                            <label for="m-t-40">Identidad</label>
                                            <div class="input-group" data-placement="left" data-align="top" data-autoclose="true">
                                                <asp:TextBox type="text" class="form-control" ID="txIdentidad" placeholder="Identidad" runat="server"></asp:TextBox>
                                                <div class="input-group-addon"><i class="glyphicon glyphicon-book"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />


                                    <div class="form-group">
                                        <label for="exampleInputpwd1">Correo Electrónico</label>
                                        <div class="input-group">
                                            <asp:TextBox type="text" class="form-control" ID="txCorreo" placeholder="Correo Electrónico" runat="server"></asp:TextBox>
                                            <div class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputpwd1">Reclamo</label>
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" TextMode="MultiLine" ID="txReclamoCliente" placeholder="Reclamo" Style="height: 200px;" runat="server"></asp:TextBox>
                                            <div class="input-group-addon"><i class="glyphicon glyphicon-certificate"></i></div>
                                        </div>
                                    </div>

                                    <div class="text-right">
                                        <asp:Button ID="BtnGuardar" class="btn btn-success  m-r-10" runat="server" Text="Guardar Analisis" OnClick="BtnGuardar_Click" />
                                        <asp:Button ID="BtnCancelar" class="btn btn-inverse " runat="server" Text="Cancelar" OnClick="BtnCancelar_Click" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <center>
                                <b><asp:Label ID="LbMensaje" runat="server" Text="" Style="color: cornflowerblue;"></asp:Label></b>
                            </center>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
