using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tarefas.Classes;

namespace Tarefas
{
    public partial class EditarTarefas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            datagridTarefas.DataSource = DAL.GetTarefasPorCompletar();
            datagridTarefas.DataBind();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            int index = int.Parse((sender as Button).CommandArgument);
            Tarefa t = new Tarefa();
            t.Id = int.Parse(((DataTable)datagridTarefas.DataSource).Rows[index]["Id"].ToString());
            DAL.ApagarTarefa(t);

            datagridTarefas.DataSource = DAL.GetTarefasPorCompletar();
            datagridTarefas.DataBind();
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            int index = int.Parse((sender as Button).CommandArgument);
            if (!string.IsNullOrEmpty(hiddenIndex.Text))
            {
                int oldindex = int.Parse(hiddenIndex.Text);
                (datagridTarefas.Items[oldindex].Cells[4].FindControl("btnEdit") as Button).Visible = true;
            }
            var row = datagridTarefas.Items[index];


            ((Button)sender).Visible = false;

            txtBoxDescricao.Text = (row.Cells[0].FindControl("lblDescricao") as Label).Text;
            txtBoxDisciplina.Text = (row.Cells[0].FindControl("lblDisciplina") as Label).Text;
            ddlTipoTrabalho.SelectedValue = ((int)Enum.Parse(typeof(Auxiliares.Enums.TipoTrabalho), (row.Cells[0].FindControl("lblTipoTarefa") as Label).Text)).ToString();
            txtBoxData.Text = DateTime.Parse((row.Cells[0].FindControl("lblDataEntrega") as Label).Text).ToString("yyyy-MM-dd");
            hiddenId.Text = (datagridTarefas.DataSource as DataTable).Rows[index]["Id"].ToString();
            hiddenIndex.Text = index.ToString();

            divForm.Visible = true;

        }

        protected void Unnamed_Click2(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            if (!string.IsNullOrEmpty(txtBoxDescricao.Text) && !string.IsNullOrEmpty(txtBoxDisciplina.Text) && !string.IsNullOrEmpty(txtBoxData.Text) && (DateTime.Parse(txtBoxData.Text) - DateTime.Now).TotalDays > 0)
            {
                txtBoxDescricao.CssClass = txtBoxDescricao.CssClass.Replace(" is-invalid", "");
                txtBoxDisciplina.CssClass = txtBoxDisciplina.CssClass.Replace(" is-invalid", "");
                txtBoxData.CssClass = txtBoxData.CssClass.Replace(" is-invalid", "");

                Tarefa t = new Tarefa();
                t.Id = int.Parse(hiddenId.Text);
                t.Descricao = txtBoxDescricao.Text;
                t.Disciplina = txtBoxDisciplina.Text;
                t.TipoTarefa = (Auxiliares.Enums.TipoTrabalho)int.Parse(ddlTipoTrabalho.SelectedValue);
                t.DataEntrega = DateTime.Parse(txtBoxData.Text);
                t.Entregue = false;
                t.Nota = 0;
                if (DAL.EditarTarefa(t)) lblSuccess.Visible = true;

                txtBoxDescricao.Text = "";
                txtBoxDisciplina.Text = "";
                ddlTipoTrabalho.SelectedIndex = 0;
                txtBoxData.Text = "";
                divForm.Visible = false;

                datagridTarefas.DataSource = DAL.GetTarefasPorCompletar();
                datagridTarefas.DataBind();
            }
            else
            {
                if (string.IsNullOrEmpty(txtBoxDescricao.Text))
                {
                    txtBoxDescricao.CssClass += " is-invalid";
                }
                if (string.IsNullOrEmpty(txtBoxDisciplina.Text))
                {
                    txtBoxDisciplina.CssClass += " is-invalid";
                }
                if (string.IsNullOrEmpty(txtBoxData.Text) || (DateTime.Parse(txtBoxData.Text) - DateTime.Now).TotalDays <= 0)
                {
                    txtBoxData.CssClass += " is-invalid";
                }
            }
        }
    }
}