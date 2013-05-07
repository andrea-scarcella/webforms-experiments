using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Configuration;
using WebformsMultipleChoiceQuestions.Business;

namespace WebformsMultipleChoiceQuestions.Dal
{
    public class QuizContext : DbContext
    {
        public QuizContext(string connectionStringName)
            : base(connectionStringName)
        {
        }
        public  DbSet<Test> Tests;
        public  DbSet<Question> Questions;
        public  DbSet<Answer> Answers;
    }
}