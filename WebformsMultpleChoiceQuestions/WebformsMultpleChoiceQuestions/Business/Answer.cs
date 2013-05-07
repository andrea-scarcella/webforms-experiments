using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebformsMultipleChoiceQuestions.Business
{
  public  class Answer
    {
      public int aid { get; set; }
      public string text { get; set; }
      public bool selected { get; set; }
    }
}
