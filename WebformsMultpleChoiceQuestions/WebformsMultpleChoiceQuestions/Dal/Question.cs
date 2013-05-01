using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebformsMultipleChoiceQuestions.Dal
{
  public  class Question
    {
      public string Text{get;set;}
      public int id { get; set; }
      public List<Answer> answers { get; set; }
      public Question()
      {
          id = 0;
          answers = new List<Answer>();
          Answer a = null;
          for (int i = 0; i < 3; i++)
          {
              a = new Answer();
              a.aid = i;
              a.text = "Answer "+i+ " "+DateTime.Now.ToString()+" " + Guid.NewGuid().ToString();
              answers.Add(a);
          }
      }
      public List<Answer> GetAnswers() { return answers; }
    }
}
