using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace WebformsMultipleChoiceQuestions.Business
{
  public  class Answer
    {
      [Key]
      public int aid { get; set; }
      public string text { get; set; }
      public bool selected { get; set; }
    }
}
