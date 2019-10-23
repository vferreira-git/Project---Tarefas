<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditarTarefas.aspx.cs" Inherits="Tarefas.EditarTarefas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="divEditarTarefas" class="container-fluid">
        <h3 style="text-align: center; margin-top: 20px;">Editar/Excluir tarefas</h3>
        <hr />
        <div id="divTabela" class="container-fluid">
            <div runat="server" visible="false" id="divForm" style="width: 50%; margin: auto;margin-bottom:50px;" class="container">
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
                <asp:Button CssClass="btn btn-primary" OnClick="Unnamed_Click2" Text="Salvar" runat="server" />
                <br />
            </div>
                <asp:Label runat="server" ID="lblSuccess" class="text-success" Visible="false">Tarefa atualizada com sucesso!</asp:Label>
            <asp:DataGrid GridLines="Horizontal" AutoGenerateColumns="false" class="table table-light" Style="background-color: white; color: midnightblue; border-left: 0px; border-right: 0px;" ID="datagridTarefas" runat="server">
                <Columns>

                    <asp:TemplateColumn HeaderText="Descrição" HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true">
                        <ItemTemplate>
                            <asp:Label ID="lblDescricao" runat="server" Text='<%# Eval("Descricao")%>' />
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Disciplina" HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true">
                        <ItemTemplate>
                            <asp:Label ID="lblDisciplina" runat="server" Text='<%# Eval("Nome_Disciplina")%>' />
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Tipo de Trabalho" HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true">
                        <ItemTemplate>
                            <asp:Label ID="lblTipoTarefa" runat="server" Text='<%# Eval("Tipo_Tarefa")%>' />
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Data para entrega" HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true">
                        <ItemTemplate>
                            <asp:Label ID="lblDataEntrega" runat="server" Text='<%# ((DateTime)Eval("Data_Entrega")).ToString("dd-MM-yyyy")%>' />
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderStyle-BackColor="#007df2" HeaderStyle-Width="50">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" CommandArgument='<%# Container.ItemIndex %>' runat="server" Text="Editar" UseSubmitBehavior="false" OnClick="Unnamed_Click1" CausesValidation="false" CssClass="btn btn-primary" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderStyle-BackColor="#007df2" HeaderStyle-Width="50">
                        <ItemTemplate>
                            <asp:Button CommandArgument='<%# Container.ItemIndex %>' runat="server" Text="Excluir" OnClick="Unnamed_Click" UseSubmitBehavior="false" CausesValidation="false" CssClass="btn btn-danger" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("navDelTarefas").style.backgroundColor = "gray";
        });
    </script>
</asp:Content>
