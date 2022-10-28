using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace RentGameAPI.Models
{
    [Table("user")]
    public partial class User
    {
        public User()
        {
            Rents = new HashSet<Rent>();
        }

        [Key]
        [Column("id_user")]
        public int IdUser { get; set; }
        [Column("id_client")]
        public int IdClient { get; set; }
        [Column("admin")]
        public bool Admin { get; set; }
        [Column("password")]
        [StringLength(10)]
        [Unicode(false)]
        public string Password { get; set; } = null!;

        [ForeignKey("IdClient")]
        [InverseProperty("Users")]
        public virtual Client IdClientNavigation { get; set; } = null!;
        [InverseProperty("IdUserNavigation")]
        public virtual ICollection<Rent> Rents { get; set; }
    }
}
