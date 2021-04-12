@{
   RootModule         = 'console'
   ModuleVersion      = '0.0.2'

   RequiredAssemblies = @()

   RequiredModules    = @()

   FunctionsToExport  = @(
     'get-textInConsoleWarningColor', 'write-textInConsoleWarningColor'
     'get-textInConsoleErrorColor'  , 'write-textInConsoleErrorColor'
   )

   AliasesToExport   = @()
}
