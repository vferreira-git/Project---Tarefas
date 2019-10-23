<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdicionarTarefas.aspx.cs" Inherits="Tarefas.AdicionarTarefas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="divAdicionarTarefa" class="container-fluid">
        <h3 style="text-align: center; margin-top: 20px;">Adicionar tarefa</h3>
        <hr />
        <div id="divForm"  style="width:50%;margin:auto;" class="container">
            <div class="form-group">
                <label class="form-text" for="txtBoxDescricao">Descrição:</label>
                <asp:TextBox ID="txtBoxDescricao" CssClass="form-control" runat="server" placeholder="Inserir descrição" />
                <div class="invalid-feedback">Campo obrigatório!</div>
            </div>
            <div class="form-group">
                <label class="form-text" for="txtBoxDisciplina">Disciplina:</label>
                <asp:TextBox ID="txtBoxDisciplina" CssClass="form-control" runat="server" placeholder="Inserir disciplina" />
                <div class="invalid-feedback">Campo obrigatório!</div>
            </div>
            <div class="form-group">
                <label class="form-text" for="ddlTipoTrabalho">Tipo de trabalho:</label>
                <asp:DropDownList ID="ddlTipoTrabalho" CssClass="form-control" runat="server" placeholder="Escolher tipo de trabalho" >
                    <asp:ListItem Text="Trabalho" Value="0" />
                    <asp:ListItem Text="PIM" Value="1" />
                    <asp:ListItem Text="Prova" Value="2" />
                    <asp:ListItem Text="Outro" Value="3" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="form-text" for="txtBoxData">Data de entrega:</label>
                <asp:TextBox ID="txtBoxData" CssClass="form-control" TextMode="Date" runat="server" />
                <div class="invalid-feedback">Data inválida!</div>
            </div>
            <asp:Button CssClass="btn btn-primary" OnClick="Unnamed_Click" Text="Adicionar" runat="server" />
            <br />
            <asp:Label runat="server" id="lblSuccess" class="text-success" Visible="false">Tarefa adicionada com sucesso!</asp:Label>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("navAddTarefas").style.backgroundColor = "gray";
        });
    </script>
</asp:Content>
