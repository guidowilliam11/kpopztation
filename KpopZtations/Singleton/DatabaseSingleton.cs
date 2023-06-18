using KpopZtations.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtations.Singleton
{
    public class DatabaseSingleton
    {
        private static DatabaseEntities db = null;

        private DatabaseSingleton()
        {
        }

        public static DatabaseEntities getInstance()
        {
            if (db == null) db = new DatabaseEntities();
            return db;
        }
    }
}