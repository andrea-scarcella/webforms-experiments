using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ReturnMgmtWebapp.Startup))]
namespace ReturnMgmtWebapp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
