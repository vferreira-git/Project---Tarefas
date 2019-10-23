using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tarefas.Classes;

namespace Tarefas
{
    public partial class AdicionarTarefas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        } 

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            if (!string.IsNullOrEmpty(txtBoxDescricao.Text) && !string.IsNullOrEmpty(txtBoxDisciplina.Text) && !string.IsNullOrEmpty(txtBoxData.Text) && (DateTime.Parse(txtBoxData.Text) - DateTime.Now).TotalDays > 0)
            {
                txtBoxDescricao.CssClass = txtBoxDescricao.CssClass.Replace(" is-invalid", "");
                txtBoxDisciplina.CssClass = txtBoxDisciplina.CssClass.Replace(" is-invalid", "");
                txtBoxData.CssClass = txtBoxData.CssClass.Replace(" is-invalid", "");

                Tarefa t = new Tarefa();
                t.Descricao = txtBoxDescricao.Text;
                t.Disciplina = txtBoxDisciplina.Text;
                t.TipoTarefa = (Auxiliares.Enums.TipoTrabalho) int.Parse(ddlTipoTrabalho.SelectedValue);
                t.DataEntrega = DateTime.Parse(txtBoxData.Text);
                t.Entregue = false;
                t.Nota = 0;
                if (DAL.AdicionarTarefa(t)) lblSuccess.Visible = true;

                txtBoxDescricao.Text = "";
                txtBoxDisciplina.Text = "";
                ddlTipoTrabalho.SelectedIndex = 0;
                txtBoxData.Text = "";
                
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