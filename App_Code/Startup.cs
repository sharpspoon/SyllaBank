using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SyllaBank1.Startup))]
namespace SyllaBank1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
