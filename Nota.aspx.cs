using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tarefas
{
    public partial class Notas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            

            lblSuccess.Visible = false;
            lblFinal.Visible = false;
            if (!string.IsNullOrEmpty(txtBoxNotaProva.Text) && !string.IsNullOrEmpty(txtBoxNotaPIM.Text) && !string.IsNullOrEmpty(txtBoxNotaAVA.Text))
            {
                txtBoxNotaProva.CssClass = txtBoxNotaProva.CssClass.Replace(" is-invalid", "");
                txtBoxNotaPIM.CssClass = txtBoxNotaPIM.CssClass.Replace(" is-invalid", "");
                txtBoxNotaAVA.CssClass = txtBoxNotaAVA.CssClass.Replace(" is-invalid", "");
                txtBoxNotaExame.CssClass = txtBoxNotaExame.CssClass.Replace(" is-invalid", "");

                decimal media = ((decimal.Parse(txtBoxNotaProva.Text) * 7) + (decimal.Parse(txtBoxNotaPIM.Text) * 2) + (decimal.Parse(txtBoxNotaAVA.Text) * 1)) / 10;
                if (media >= 10)
                {
                    frmNotaExame.Visible = false;
                    lblSuccess.ForeColor = System.Drawing.Color.Green;
                    lblSuccess.Text = $"Aprovado! Média: {media}";
                    lblSuccess.Visible = true;
                }
                else
                {
                    if (!frmNotaExame.Visible)
                    {
                        lblSuccess.ForeColor = System.Drawing.Color.Red;
                        lblSuccess.Text = $"Reprovado! Média: {media}. Por favor preencha a nota do exame";
                        lblSuccess.Visible = true;
                        frmNotaExame.Visible = true;
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(txtBoxNotaExame.Text))
                        {
                            media = (media + decimal.Parse(txtBoxNotaExame.Text)) / 2;
                            if (media >= 10)
                            {
                                lblFinal.ForeColor = System.Drawing.Color.Green;
                                lblFinal.Text = $"Aprovado! Média: {media}";
                                lblFinal.Visible = true;
                            }
                            else
                            {
                                lblFinal.ForeColor = System.Drawing.Color.Red;
                                lblFinal.Text = $"Reprovado! Média: {media}";
                                lblFinal.Visible = true;
                            }
                        }
                        else
                        {
                            txtBoxNotaExame.CssClass += " is-invalid";
                        }
                    }
                }
            }
            else
            {
                if (string.IsNullOrEmpty(txtBoxNotaProva.Text))
                {
                    txtBoxNotaProva.CssClass += " is-invalid";
                }
                if (string.IsNullOrEmpty(txtBoxNotaPIM.Text))
                {
                    txtBoxNotaPIM.CssClass += " is-invalid";
                }
                if (string.IsNullOrEmpty(txtBoxNotaAVA.Text))
                {
                    txtBoxNotaAVA.CssClass += " is-invalid";
                }
            }
        }
    }
}