using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebformsMultipleChoiceQuestions.Infrastructure;

namespace WebformsMultipleChoiceQuestions.Business
{
    public class Test
    {
        private readonly ILogger log;

        public int id { get; set; }
        private List<Question> _questions=new List<Question>();
        public Test()
        {
            Question q = null;
            for (int i = 0; i < 4; i++)
            {
                q = new Question();
                q.Text = "Q" + i;
                q.id = i;
                _questions.Add(q);
            }
        }
        public List<Question> GetQuestions() { return _questions; }
    }
}