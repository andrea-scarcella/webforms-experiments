using System;
using System.Collections.Generic;
using System.Linq;
using ContosoUniversity.DAL;

namespace ContosoUniversity.DAL
{
    public class SchoolRepository : IDisposable
    {
        private SchoolEntities context = new SchoolEntities();
        //IQueryable can cause db access when used, but the repository that would implement it might have been garbage collected already..
        //IEnumerable allows you to perform read-only list-processing tasks, such as querying and filtering
        public IEnumerable<Department> GetDepartments()
        {
            return context.Departments.Include("Person").ToList();
        }
        public IEnumerable<InstructorName> GetInstructorNames()
        {
            return context.InstructorNames.OrderBy("it.FullName").ToList();
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposedValue = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public void InsertDepartment(Department department)
        {
            try
            {
                department.DepartmentID = GenerateDepartmentID();
                context.Departments.AddObject(department);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                //Include catch blocks for specific exceptions first,
                //and handle or log the error as appropriate in each.
                //Include a generic catch block like this one last.
                throw ex;
            }
        }

        public void DeleteDepartment(Department department)
        {
            try
            {
                context.Departments.Attach(department);
                context.Departments.DeleteObject(department);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                //Include catch blocks for specific exceptions first,
                //and handle or log the error as appropriate in each.
                //Include a generic catch block like this one last.
                throw ex;
            }
        }

        private Int32 GenerateDepartmentID()
        {
            Int32 maxDepartmentID = 0;
            var department = (from d in GetDepartments()
                              orderby d.DepartmentID descending
                              select d).FirstOrDefault();
            if (department != null)
            {
                maxDepartmentID = department.DepartmentID + 1;
            }
            return maxDepartmentID;
        }
    }
}