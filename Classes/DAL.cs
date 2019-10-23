using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Tarefas.Classes
{
    public static class DAL
    {
        static string connString = "";
        public static DataTable GetTarefasPorCompletar()
        {
            try
            {
                if (connString == "")
                    connString = WebConfigurationManager.ConnectionStrings["AccessDB"].ConnectionString.Replace("|relativepath|", HttpContext.Current.Server.MapPath(WebConfigurationManager.AppSettings["dbPath"]));
                using (OleDbConnection _conn = new OleDbConnection(connString))
                {
                    _conn.Open();
                    using (OleDbCommand cmd = new OleDbCommand("SELECT * FROM Tarefas WHERE Entregue = @p1", _conn))
                    {
                        cmd.Parameters.AddWithValue("@p1", false);
                        using (OleDbDataReader reader = cmd.ExecuteReader())
                        {
                            DataTable tarefas = new DataTable();
                            tarefas.Load(reader);
                            return tarefas;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public static DataTable GetTarefasCompletas()
        {
            try
            {
                if (connString == "")
                    connString = WebConfigurationManager.ConnectionStrings["AccessDB"].ConnectionString.Replace("|relativepath|", HttpContext.Current.Server.MapPath(WebConfigurationManager.AppSettings["dbPath"]));
                using (OleDbConnection _conn = new OleDbConnection(connString))
                {
                    _conn.Open();
                    using (OleDbCommand cmd = new OleDbCommand("SELECT * FROM Tarefas WHERE Entregue = @p1", _conn))
                    {
                        cmd.Parameters.AddWithValue("@p1", true);
                        using (OleDbDataReader reader = cmd.ExecuteReader())
                        {
                            DataTable tarefas = new DataTable();
                            tarefas.Load(reader);
                            return tarefas;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public static bool AdicionarTarefa(Tarefa t)
        {
            try
            {
                if (connString == "")
                    connString = WebConfigurationManager.ConnectionStrings["AccessDB"].ConnectionString.Replace("|relativepath|", HttpContext.Current.Server.MapPath(WebConfigurationManager.AppSettings["dbPath"]));
                using (OleDbConnection _conn = new OleDbConnection(connString))
                {
                    _conn.Open();
                    using (OleDbCommand cmd = new OleDbCommand("INSERT INTO Tarefas (Descricao,Nome_Disciplina,Tipo_Tarefa,Data_Entrega,Entregue,Nota) VALUES (@p1,@p2,@p3,@p4,@p5,@p6)", _conn))
                    {
                        cmd.Parameters.AddWithValue("@p1", t.Descricao);
                        cmd.Parameters.AddWithValue("@p2", t.Disciplina);
                        cmd.Parameters.AddWithValue("@p3", Enum.GetName(typeof(Auxiliares.Enums.TipoTrabalho),t.TipoTarefa));
                        cmd.Parameters.AddWithValue("@p4", OleDbType.Date).Value = t.DataEntrega.Date;
                        cmd.Parameters.AddWithValue("@p5", t.Entregue);
                        cmd.Parameters.AddWithValue("@p6", t.Nota);
                        return (cmd.ExecuteNonQuery() > 0 ? true : false);
                    }
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool EditarTarefa(Tarefa t)
        {
            try
            {
                if (connString == "")
                    connString = WebConfigurationManager.ConnectionStrings["AccessDB"].ConnectionString.Replace("|relativepath|", HttpContext.Current.Server.MapPath(WebConfigurationManager.AppSettings["dbPath"]));
                using (OleDbConnection _conn = new OleDbConnection(connString))
                {
                    _conn.Open();
                    using (OleDbCommand cmd = new OleDbCommand("UPDATE Tarefas SET Descricao = @p1, Nome_Disciplina = @p2,Tipo_Tarefa = @p3, Data_Entrega = @p4, Entregue = @p5, Nota = @p6 WHERE Id = @p7", _conn))
                    {
                        cmd.Parameters.AddWithValue("@p1", t.Descricao);
                        cmd.Parameters.AddWithValue("@p2", t.Disciplina);
                        cmd.Parameters.AddWithValue("@p3", Enum.GetName(typeof(Auxiliares.Enums.TipoTrabalho), t.TipoTarefa));
                        cmd.Parameters.AddWithValue("@p4", OleDbType.Date).Value = t.DataEntrega;
                        cmd.Parameters.AddWithValue("@p5", t.Entregue);
                        cmd.Parameters.AddWithValue("@p6", t.Nota);
                        cmd.Parameters.AddWithValue("@p7", t.Id);
                        return (cmd.ExecuteNonQuery() > 0 ? true : false);
                    }
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool ApagarTarefa(Tarefa t)
        {
            try
            {
                if (connString == "")
                    connString = WebConfigurationManager.ConnectionStrings["AccessDB"].ConnectionString.Replace("|relativepath|", HttpContext.Current.Server.MapPath(WebConfigurationManager.AppSettings["dbPath"]));
                using (OleDbConnection _conn = new OleDbConnection(connString))
                {
                    _conn.Open();
                    using (OleDbCommand cmd = new OleDbCommand("DELETE FROM Tarefas WHERE Id = @p1", _conn))
                    {
                        cmd.Parameters.AddWithValue("@p1", t.Id);
                        return (cmd.ExecuteNonQuery() > 0 ? true : false);
                    }
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}