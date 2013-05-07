using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NLog;

namespace WebformsMultipleChoiceQuestions.Infrastructure
{
    public class NLogger : ILogger
    {
        Logger _logger;
        public NLogger()
        {
            _logger = LogManager.GetCurrentClassLogger();
        }
        public void LogInfo(string message)
        {
            _logger.Info(message);
        }
        public void LogWarning(string message)
        {
            _logger.Warn(message);
        }
        public void LogDebug(string message)
        {
            _logger.Debug(message);
        }
        public void LogError(string message)
        {
            _logger.Error(message);
        }
        public void LogError(Exception message)
        {
            _logger.Error(message);
        }
        public void LogFatal(string message)
        {
            _logger.Fatal(message);
        }
        public void LogFatal(Exception message)
        {
            _logger.Fatal(message);
        }

    }
}