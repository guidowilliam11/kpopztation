﻿using KpopZtations.Model;
using KpopZtations.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtations.Handler
{
    public class TransactionHeaderHandler
    {
        private TransactionHeaderRepository thr = new TransactionHeaderRepository();

        public void insertTh(String date, int customerId)
        {
            thr.add(date, customerId);
        }

        public List<TransactionHeader> getTh()
        {
            return thr.fetchAll();
        }

        public List<TransactionHeader> getUserTh(int customerId)
        {
            return thr.fetchByCustomer(customerId);
        }
    }
}