@{
   RootModule         = 'console'
   ModuleVersion      = '0.3'

   RequiredAssemblies = @()

   RequiredModules    = @()

   FunctionsToExport  = @(
     'get-textInConsoleWarningColor', 'write-textInConsoleWarningColor'
     'get-textInConsoleErrorColor'  , 'write-textInConsoleErrorColor',
     'get-consoleLineText'
   )

   AliasesToExport   = @()
}
