<%--<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="consultas.aspx.cs" Inherits="EEHCompetitividadRegional.consultas" %>--%>
<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="consultas.aspx.cs"  Inherits="EEHCompetitividadRegional.consultas" MasterPageFile="~/main.master"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="plugins/bower_components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <style>
        .gridview a{
              margin:auto 1%;
              border-radius:50%;
              background-color:#444;
              padding:5px 10px 5px 10px;
              color:#fff;
              text-decoration:none;
              -o-box-shadow:1px 1px 1px #111;
              -moz-box-shadow:1px 1px 1px #111;
              -webkit-box-shadow:1px 1px 1px #111;
              box-shadow:1px 1px 1px #111;
        }
        .gridview a:hover{
            background-color:#808080;
            color:#fff;
        }
        .gridview span{
            background-color:cornflowerblue;
            color:#fff;
            -o-box-shadow:1px 1px 1px #111;
            -moz-box-shadow:1px 1px 1px #111;
            -webkit-box-shadow:1px 1px 1px #111;
            box-shadow:1px 1px 1px #111;
            border-radius:50%;
            padding:5px 10px 5px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="FormaCliente" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title m-b-0">Consulta por codigo</h3>
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
                                                <asp:Button ID="BtnConsultar" class="btn btn-success  m-r-10" runat="server" Text="Buscar" OnClick="BtnConsultar_Click" />
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
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title m-b-0">Resultado de busqueda</h3>
                            <p class="text-muted m-b-30">Para actualizar los resultados de la busqueda por favor ir a la ventana de Actualización.</p>
                            <asp:Button ID="ExportXls" class="btn btn-mini" runat="server" Text=".xls" style="margin:0 0 1% 80%;" OnClick="ExportXls_Click" />
                            <br />
                            <div class="table-responsive">

                                <asp:GridView ID="GridViewConsulta" runat="server"
                                    GridLines="None"
                                    AllowPaging="True"
                                    AutoGenerateColumns="False"
                                    PagerStyle-CssClass="gridview"
                                    CssClass="table table-striped" OnRowCommand="GridViewConsulta_RowCommand" OnPageIndexChanging="GridViewConsulta_PageIndexChanging">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" EditText="Modificar" ItemStyle-Font-Underline="true" />
                                        <asp:BoundField DataField="codigoCliente" HeaderText="Codigo" />
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                        <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                                        <asp:BoundField DataField="reclamo" HeaderText="Reclamo" />
                                        <asp:BoundField DataField="dictamen" HeaderText="Dictamen" />
                                        <asp:BoundField DataField="os" HeaderText="Numero OS" />
                                        <asp:BoundField DataField="fechaIngreso" HeaderText="Fecha" />
                                        <asp:BoundField DataField="fechaResolucion" HeaderText="Resolución" />
                                        <asp:BoundField DataField="sector" HeaderText="Sector" />
                                        <asp:BoundField DataField="username" HeaderText="Camara" />
                                        <asp:BoundField DataField="estado" HeaderText="Estado" />
                                    </Columns>


                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="plugins/bower_components/datatables/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#GridViewConsulta').DataTable();
            $(document).ready(function () {
                var table = $('#GridViewConsulta').DataTable({
                    "columnDefs": [
                        {
                            "visible": false
                            , "targets": 2
                        }
                    ]
                    , "order": [[2, 'asc']]
                    , "displayLength": 25
                    , "drawCallback": function (settings) {
                        var api = this.api();
                        var rows = api.rows({
                            page: 'current'
                        }).nodes();
                        var last = null;
                        api.column(2, {
                            page: 'current'
                        }).data().each(function (group, i) {
                            if (last !== group) {
                                $(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
                                last = group;
                            }
                        });
                    }
                });
                // Order by the grouping
                $('#GridViewConsulta tbody').on('click', 'tr.group', function () {
                    var currentOrder = table.order()[0];
                    if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                        table.order([2, 'desc']).draw();
                    }
                    else {
                        table.order([2, 'asc']).draw();
                    }
                });
            });
        });
        $('#example23').DataTable({
            dom: 'Bfrtip'
            , buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]
        });
    </script>
</asp:Content>
