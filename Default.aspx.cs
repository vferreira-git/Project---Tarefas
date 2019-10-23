using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tarefas.Classes;
using Tarefas.Auxiliares;
using static Tarefas.Auxiliares.Enums;
using System.Data;

namespace Tarefas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int MaiorDez = 0;
            int MenorDez = 0;
            int MenorTres = 0;
            DataTable tarefas = DAL.GetTarefasPorCompletar();
            if (tarefas != null)
            {
                for (int i = 0; i < tarefas.Rows.Count; i++)
                {
                    if ((DateTime.Parse(tarefas.Rows[i]["Data_Entrega"].ToString()) - DateTime.Now).TotalDays <= 3)
                        MenorTres++;
                    else if ((DateTime.Parse(tarefas.Rows[i]["Data_Entrega"].ToString()) - DateTime.Now).TotalDays <= 9)
                        MenorDez++;
                    else if ((DateTime.Parse(tarefas.Rows[i]["Data_Entrega"].ToString()) - DateTime.Now).TotalDays > 9)
                        MaiorDez++;
                }
            }
            lblAvisoMaior.Text = MaiorDez.ToString();
            lblAvisoMedio.Text = MenorDez.ToString();
            lblAvisoMenor.Text = MenorTres.ToString();
        }
    }
}