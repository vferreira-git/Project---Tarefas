<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VerTrabalhosEntregues.aspx.cs" Inherits="Tarefas.VerTrabalhosEntregues" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="divTrabalhosEntregues" class="container-fluid">
        <h3 style="text-align: center; margin-top: 20px;">Tarefas entregues</h3>
        <hr />
        <div id="divTabela" class="container-fluid">
            <asp:DataGrid GridLines="Horizontal" AutoGenerateColumns="false" class="table table-light" Style="background-color: white; color: midnightblue; border-left: 0px; border-right: 0px;" ID="datagridTarefas" runat="server">
                <Columns>
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Descricao" HeaderText="Descrição:" />
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Nome_Disciplina" HeaderText="Disciplina" />
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Tipo_Tarefa" HeaderText="Tipo de trabalho" />
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Data_Entrega" HeaderText="Data para entrega" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundColumn HeaderStyle-BackColor="#007df2" HeaderStyle-ForeColor="white" HeaderStyle-Font-Bold="true" DataField="Nota" HeaderText="Nota do trabalho" />
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
            document.getElementById("navTrabalhosEntregues").style.backgroundColor = "gray";
        });
    </script>
</asp:Content>
