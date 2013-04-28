using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebformsMultipleChoiceQuestions.Dal;

namespace WebformsMultipleChoiceQuestions.Secure
{
    public partial class Test : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // _columnDataBoundFields = new Dictionary<int, string>();
            //for (int i = 0; i < AnswerGV.Columns.Count; i++)
            //{
            //    var column = AnswerGV.Columns[i];
            //    BoundField bfield = column as BoundField;
            //    if (bfield != null)
            //    {
            //         _columnDataBoundFields.Add(i, bfield.DataField);
            //    }
            //}
           
        }

        protected void AnswerGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            var dataKey = AnswerGV.SelectedDataKey.Value;
            var barf = QuestionODS.EnableViewState;
            CheckBox checkBox = AnswerGV.SelectedRow.Cells[3].Controls[0] as CheckBox;
            checkBox.Checked = true;
            string selected = checkBox.Checked.ToString();
            //manually bind extra parameters not bound automatically when edit = false
            QuestionODS.UpdateParameters["selected"].DefaultValue = selected;
            AnswerGV.UpdateRow(AnswerGV.SelectedRow.RowIndex, true);
        }

        protected void AnswerGV_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (AnswerGV.SelectedRow!=null)
            {
                CheckBox checkBox = AnswerGV.SelectedRow.Cells[3].Controls[0] as CheckBox;
                checkBox.Checked = false;
                AnswerGV.UpdateRow(AnswerGV.SelectedRow.RowIndex, true); 
            }
        }

        //public Dictionary<int, string> _columnDataBoundFields { get; set; }
    }
}