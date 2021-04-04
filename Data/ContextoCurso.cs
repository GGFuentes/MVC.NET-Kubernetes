using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using MVCPrototipo.Models;

    public class ContextoCurso : DbContext
    {
        public ContextoCurso (DbContextOptions<ContextoCurso> options)
            : base(options)
        {
        }

        public DbSet<MVCPrototipo.Models.Instructor> Instructor { get; set; }
    }
