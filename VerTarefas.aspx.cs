using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tarefas.Classes;

namespace Tarefas
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            datagridTarefas.DataSource = DAL.GetTarefasPorCompletar();
            datagridTarefas.DataBind();

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            int index = int.Parse((sender as Button).CommandArgument);
            if (!string.IsNullOrEmpty(hiddenIndex.Text))
            {
                int oldindex = int.Parse(hiddenIndex.Text);
                (datagridTarefas.Items[oldindex].Cells[4].FindControl("btnEdit") as Button).Visible = true;
            }
            var row = datagridTarefas.Items[index];


            ((Button)sender).Visible = false;

            txtBoxDescricao.Text = row.Cells[0].Text;
            txtBoxDisciplina.Text = row.Cells[1].Text;
            ddlTipoTrabalho.SelectedValue = ((int)Enum.Parse(typeof(Auxiliares.Enums.TipoTrabalho),row.Cells[2].Text)).ToString();
            txtBoxData.Text = DateTime.Parse(row.Cells[3].Text).ToString("yyyy-MM-dd");
            hiddenId.Text = (datagridTarefas.DataSource as DataTable).Rows[index]["Id"].ToString();
            hiddenIndex.Text = index.ToString();

            divForm.Visible = true;
        }

        protected void Unnamed_Click2(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            int index = int.Parse(hiddenIndex.Text);
            var row = datagridTarefas.Items[index];

            Tarefa t = new Tarefa();
            t.Id = int.Parse(hiddenId.Text);
            t.Descricao = row.Cells[0].Text;
            t.Disciplina = row.Cells[1].Text;
            t.TipoTarefa = (Auxiliares.Enums.TipoTrabalho)Enum.Parse(typeof(Auxiliares.Enums.TipoTrabalho), row.Cells[2].Text);
            t.DataEntrega = DateTime.Parse(row.Cells[3].Text);
            t.Entregue = true;
            t.Nota = decimal.Parse(txtBoxNota.Text);
            if (DAL.EditarTarefa(t)) lblSuccess.Visible = true;

            txtBoxDescricao.Text = "";
            txtBoxDisciplina.Text = "";
            ddlTipoTrabalho.SelectedIndex = 0;
            txtBoxData.Text = "";
            divForm.Visible = false;

            datagridTarefas.DataSource = DAL.GetTarefasPorCompletar();
            datagridTarefas.DataBind();
        }
    }
}