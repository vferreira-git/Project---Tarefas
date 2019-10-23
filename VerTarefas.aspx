<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VerTarefas.aspx.cs" Inherits="Tarefas.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="divVerTarefas" class="container-fluid">
        <h3 style="text-align: center; margin-top: 20px;">Tarefas por entregar</h3>
        <hr />
        <div id="divTabela" class="container-fluid">
            <div runat="server" visible="false" id="divForm" style="width: 50%; margin: auto; margin-bottom: 50px;" class="container">
                <fieldset disabled>
                    <asp:Label ID="hiddenId" runat="server" Visible="false" />
                    <asp:Label ID="hiddenIndex" runat="server" Visible="false" />
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
                        <asp:DropDownList ID="ddlTipoTrabalho" CssClass="form-control" runat="server" placeholder="Escolher tipo de trabalho">
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
                </fieldset>
                <label class="form-text" for="txtBoxDisciplina">Nota:</label>
                <asp:TextBox ID="txtBoxNota" CssClass="form-control" runat="server" TextMode="Number" placeholder="Inserir nota" />
                <div class="invalid-feedback">Campo obrigatório!</div>
                <br />
                <asp:Button CssClass="btn btn-primary" OnClick="Unnamed_Click2" Text="Confirmar" runat="server" />
            </div>
            <asp:Label runat="server" ID="lblSuccess" class="text-success" Visible="false">Tarefa atualizada com sucesso!</asp:Label>
            <asp:DataGrid GridLines="Horizontal" AutoGenerateColumns="false" class="table table-light" Style="background-color: white; color: midnightblue; border-left: 0px; border-right: 0px;" ID="datagridTarefas" runat="server">
                <Columns>
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Descricao" HeaderText="Descrição:" />
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Nome_Disciplina" HeaderText="Disciplina" />
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Tipo_Tarefa" HeaderText="Tipo de trabalho" />
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Data_Entrega" HeaderText="Data para entrega" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateColumn HeaderStyle-BackColor="#007df2" HeaderStyle-Width="50">
                        <ItemTemplate>
                            <asp:Button CommandArgument='<%# Container.ItemIndex %>' runat="server" Text="Confirmar Entrega" OnClick="Unnamed_Click" UseSubmitBehavior="false" CausesValidation="false" CssClass="btn btn-success" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
        </div>
    </div>



    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("navTarefas").style.backgroundColor = "gray";
        });
    </script>
</asp:Content>
