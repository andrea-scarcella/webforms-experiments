using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebformsMultipleChoiceQuestions.Infrastructure
{
    public interface ILogger
    {
        void LogDebug(string message);
        void LogError(Exception message);
        void LogError(string message);
        void LogFatal(Exception message);
        void LogFatal(string message);
        void LogInfo(string message);
        void LogWarning(string message);
    }
}
