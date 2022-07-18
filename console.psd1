@{
   RootModule         = 'console'
   ModuleVersion      = '0.5'

   RequiredAssemblies = @()

   RequiredModules    = @()

   FunctionsToExport  = @(
     'get-ansiEscapedText',
     'set-cursorPosition',
     'move-cursorUp', 'move-cursorDown', 'move-cursorLeft', 'move-cursorRight',
     'move-cursorNextLine', 'move-cursorPreviousLine',
     'move-cursorLine', 'move-cursorColumn',
     'save-cursorPosition', 'restore-cursorPosition',
     'get-paletteIndexOfConsoleColor',
     'set-consolePaletteColor',
     'set-consoleSize',
     'get-textInConsoleWarningColor', 'write-textInConsoleWarningColor'
     'get-textInConsoleErrorColor'  , 'write-textInConsoleErrorColor',
     'get-consoleLineText'
   )

   AliasesToExport   = @()

   ScriptsToProcess  = @(
      'console.ps1'
   )
}
