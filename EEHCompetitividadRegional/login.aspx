<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="EEHCompetitividadRegional.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
    <title>EEH Regional | Login</title>
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/colors/default.css" id="theme" rel="stylesheet">
</head>
<!-- Preloader -->
<body>
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <section id="wrapper" class="new-login-register">
        <div class="lg-info-panel">
            <div class="inner-panel">

                <div class="lg-content">
                </div>
            </div>
        </div>
        <form id="FormaCliente" runat="server" class="form-horizontal new-lg-form">
            <div class="new-login-box">
                <div class="white-box">
                    <h3 class="box-title m-b-0">EEH Regional | Login</h3>
                    <small>Ingrese su usuario y contraseña</small>


                    <div class="form-group  m-t-20">
                        <div class="col-xs-12">
                            <label>Usuario</label>
                            <asp:TextBox ID="TxUsuario" class="form-control" required="" placeholder="Usuario" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label>Contraseña</label>
                            <asp:TextBox ID="TxPassword" class="form-control" TextMode="Password" required="" placeholder="Contraseña" runat="server"></asp:TextBox>
                        </div>
                    </div>


                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <asp:Button ID="BtnEntrar" class="btn btn-info btn-lg btn-block btn-rounded text-uppercase " runat="server" Text="Entrar" OnClick="BtnEntrar_Click" />
                        </div>
                    </div>
                    <center>
                        <b><asp:Label ID="LbMensaje" runat="server" Text="" Style="color: brown;"></asp:Label></b>
                    </center>


                </div>
            </div>
        </form>


    </section>
    <script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/waves.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>
