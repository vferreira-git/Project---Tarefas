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
    public partial class VerTrabalhosEntregues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            datagridTarefas.DataSource = DAL.GetTarefasCompletas();
            datagridTarefas.DataBind();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            int index = int.Parse((sender as Button).CommandArgument);
            Tarefa t = new Tarefa();
            t.Id = int.Parse(((DataTable)datagridTarefas.DataSource).Rows[index]["Id"].ToString());
            DAL.ApagarTarefa(t);

            datagridTarefas.DataSource = DAL.GetTarefasCompletas();
            datagridTarefas.DataBind();
        }
    }
}