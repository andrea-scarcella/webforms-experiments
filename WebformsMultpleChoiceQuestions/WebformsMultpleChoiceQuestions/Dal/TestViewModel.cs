using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebformsMultipleChoiceQuestions.Business;

namespace WebformsMultipleChoiceQuestions.Dal
{
    public class TestViewModel
    {
        public TestViewModel()
        {
            if (_test==null)
            {
                _test = new Test(); 
            }
        }
        public List<Question> getQuestions() { return _test.GetQuestions(); }
        public List<Answer> getAnswersToQuestion(int qid)
        {
            Question q0 = _test.GetQuestions().FirstOrDefault(question => question.id == qid);
            if (q0!=null)
            {
                return q0.answers;
            } 
            return null;
        }
        public void updateSelectedAnswerForQuestion(int id,int aid,bool selected){
        //{
            int u = 0;
            var qu = _test.GetQuestions().FirstOrDefault(q => q.id == id);
            if (qu != null)
            {
                var ans = qu.answers.FirstOrDefault(a => a.aid == aid);
                if (ans != null)
                {
                    ans.selected = selected;
                }
            }

        }

        public static Test _test { get; set; }
    }
}