using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static Tarefas.Auxiliares.Enums;

namespace Tarefas.Classes
{
    public class Tarefa
    {
        public int Id;
        public string Descricao;
        public string Disciplina;
        public TipoTrabalho TipoTarefa;
        public DateTime DataEntrega;
        public bool Entregue;
        public decimal Nota;
    }
}