<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="actualizaciones.aspx.cs" Inherits="EEHCompetitividadRegional.actualizaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

    <script type="text/javascript">
        function soloLetras(e){
           key = e.keyCode || e.which;
           tecla = String.fromCharCode(key).toLowerCase();
           letras = " áéíóúabcdefghijklmnñopqrstuvwxyz1234567890-._,;()$%&=?¿¡!:";
           especiales = "8-37-39-46";

            tecla_especial = false;
           for(var i in especiales){
                if(key == especiales[i]){
                    tecla_especial = true;
                    break;
                }
            }

            if(letras.indexOf(tecla)==-1 && !tecla_especial){
                return false;
            }
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="FormaCliente" runat="server">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Actualizaciones de analisis</h3>
                    <p class="text-muted m-b-30 font-13">Por favor ingrese el codigo a buscar</p>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="m-t-20">Codigo Cliente</label>
                                    <div class="input-group">
                                        <asp:TextBox type="text" class="form-control" ID="txCodigoCliente" placeholder="Codigo" runat="server"></asp:TextBox>
                                        <div class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <label for="m-t-20">Acciones</label>
                                    <div class="text-left">
                                        <asp:Button ID="BtnConsultar" class="btn btn-success  m-r-10" runat="server" Text="Buscar" OnClick="BtnConsultar_Click"/>
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
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="white-box">
                    <p class="text-muted m-b-30 font-13">Por favor actualizar los campos del analisis.</p>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="exampleInputpwd1">Analisis defensoria</label>
                                <div class="input-group">
                                    <asp:TextBox type="text" class="form-control" id="txAnalisisDefensoria" placeholder="Analisis de defensoria" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <div class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputpwd1">Dictamen</label>
                                <div class="input-group">
                                    <asp:TextBox type="text" onkeypress="return soloLetras(event);" class="form-control" id="txDictamen" placeholder="Dictamen" runat="server"  TextMode="MultiLine"></asp:TextBox>
                                    <div class="input-group-addon"><i class="glyphicon glyphicon-copy"></i></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputpwd1">Camara de Comercio</label>
                                <div class="input-group">
                                    <asp:TextBox type="text" class="form-control" id="txCameraComercio" placeholder="Camara de Comercio" runat="server" ReadOnly="true"></asp:TextBox>
                                    <div class="input-group-addon"><i class="glyphicon glyphicon-blackboard"></i></div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="m-t-20">Numero de OS</label>
                                    <div class="input-group">
                                        <asp:TextBox type="text" class="form-control" id="txNumeroOs" placeholder="Codigo" runat="server"></asp:TextBox>
                                        <div class="input-group-addon"><i class="glyphicon glyphicon-bookmark"></i></div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <label for="m-t-20">Estado</label>
                                    <asp:DropDownList ID="SelectEstado" class="form-control" runat="server">
                                        <asp:ListItem Value="0" Text ="Seleccionar un estado"></asp:ListItem>
                                        <asp:ListItem Value="1" Text ="Resuelto"></asp:ListItem>
                                        <asp:ListItem Value="2" Text ="En proceso de resolución final"></asp:ListItem>
                                        <asp:ListItem Value="3" Text ="Improcedente"></asp:ListItem>
                                        <asp:ListItem Value="4" Text ="Con problemas en información"></asp:ListItem>
                                    </asp:DropDownList>
                      

                                </div>
                            </div>
                            <br />
                            <div class="text-left">
                                <asp:Button ID="BtnGuardarCaso" class="btn btn-success  m-r-10" runat="server" Text="Guardar" OnClick="BtnGuardarCaso_Click" />
                                <asp:Button ID="BtnCancelarCaso" class="btn btn-inverse " runat="server" Text="Cancelar" OnClick="BtnCancelarCaso_Click"  />
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
