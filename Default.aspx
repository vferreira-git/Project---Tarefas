<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tarefas.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="WelcomePage" class="container-fluid">
        <h3>Bem vindo ao sistema de gerenciamento de tarefas!</h3>
        <hr />
        <div id="divInfo" class="container">
            <p>Para ver todas as tarefas por entregar, vá a Ver tarefas.</p>
            <hr />
            <p>Para adicionar uma tarefa nova, vá a Adicionar tarefas.</p>
            <hr />
            <p>Caso queira editar ou remover uma tarefa, vá a Editar/Excluir tarefas.</p>
            <hr />
            <p>Por fim, para calcular uma nota final vá a Notas.</p>
        </div>
        <div id="divAvisos" class="container" style="padding: 0px;display:inline-block">
            <div class="nav-fill" style="width: 75%; background-color: wheat; padding: 0px; margin-bottom: 0; border: 1px solid black; border-bottom: 0px; border-bottom-left-radius: 0px; border-bottom-right-radius: 0px;">
                <h4>Avisos:</h4>
            </div>
            <div style="border: 1px solid black; border-top: 0px; background-color: wheat; border-radius: 0px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding: 0;margin-left:4.5px; padding-bottom: 25px; margin-top: 0; width: 75%; height: 100%;">
                <div class="nav-fill" style="width: 90%; background-color: green; border-radius: 0px; color: white; text-align: center; padding: 0px; margin: 0; border-top: 1px solid black;">
                    <label>Tarefas com prazo maior de 10 dias:&nbsp;</label><asp:Label runat="server" ID="lblAvisoMaior" />
                </div>
                <div class="nav-fill" style="width: 90%; background-color: yellow; border-radius: 0px; color: black; text-align: center; padding: 0px; margin: 0; border-top: 1px solid black;">
                    <label>Tarefas com prazo menor que 10 dias:&nbsp;</label><asp:Label runat="server" ID="lblAvisoMedio" />
                </div>
                <div class="nav-fill" style="width: 90%; background-color: red; border-radius: 0px; color: white; text-align: center; padding: 0px; margin: 0; border-top: 1px solid black;">
                    <label>Tarefas com prazo menor que 3 dias:&nbsp;</label><asp:Label runat="server" ID="lblAvisoMenor" />
                </div>
            </div>
            <br />
            <br />
            <label style="color: white;padding:5px;background-color:green;border-radius:20px;">Verde </label>
            <label>&rarr; PRAZO MAIOR QUE 10 DIAS</label>
            <br />
            <label style="color: black;padding:5px;background-color:yellow;border-radius:20px;">Amarelo: </label>
            <label>&rarr; PRAZO MENOR QUE 10 DIAS</label>
            <br />
            <label style="color: white;padding:5px;background-color:red;border-radius:20px;">Vermelho: </label>
            <label>&rarr; PRAZO MENOR QUE 3 DIAS</label>
            <br />
        </div>
    </div>


    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("navHome").style.backgroundColor = "gray";
        });
    </script>
</asp:Content>

