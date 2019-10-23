<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Nota.aspx.cs" Inherits="Tarefas.Notas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="divNota" class="container-fluid">
        <h3 style="text-align: center; margin-top: 20px;">Calcular Nota</h3>
        <hr />
        <div id="divCalcNota"  style="width:50%;margin:auto;" class="container">
            <div class="form-group">
                <label class="form-text" for="txtBoxNotaProva">Nota da prova:</label>
                <asp:TextBox TextMode="Number" ID="txtBoxNotaProva" CssClass="form-control" runat="server" placeholder="Inserir nota" />
                <div class="invalid-feedback">Campo obrigatório!</div>
            </div>
            <div class="form-group">
                <label class="form-text" for="txtBoxNotaPIM">Nota do PIM:</label>
                <asp:TextBox TextMode="Number" ID="txtBoxNotaPIM" CssClass="form-control" runat="server" placeholder="Inserir nota" />
                <div class="invalid-feedback">Campo obrigatório!</div>
            </div>
            <div class="form-group">
                <label class="form-text" for="txtBoxNotaAVA">Nota do AVA:</label>
                <asp:TextBox TextMode="Number" ID="txtBoxNotaAVA" CssClass="form-control" runat="server" placeholder="Inserir nota" />
                <div class="invalid-feedback">Campo obrigatório!</div>
            </div>
            <asp:Label runat="server" id="lblSuccess" Visible="false"></asp:Label>
            <div id="frmNotaExame" class="form-group" runat="server" visible="false">
                <label class="form-text" for="txtBoxExame">Nota do exame:</label>
                <asp:TextBox TextMode="Number" ID="txtBoxNotaExame" CssClass="form-control" runat="server" />
                <div class="invalid-feedback">Campo obrigatório!</div>
            </div>
            <asp:Label runat="server" id="lblFinal" Visible="false"></asp:Label>
            <br />
            <br />
            <asp:Button CssClass="btn btn-primary" OnClick="Unnamed_Click" Text="Calcular" runat="server" />
            <br />
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("navNotas").style.backgroundColor = "gray";
        });
    </script>
</asp:Content>
