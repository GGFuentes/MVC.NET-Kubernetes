using Microsoft.EntityFrameworkCore;

namespace MVCPrototipo.Models
{
    public class ContextoCursos : DbContext
    {
        public ContextoCursos(DbContextOptions<ContextoCursos> options) : base(options){}

         public DbSet<Instructor> Instructor{get;set;}
    }
}