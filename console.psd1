@{
   RootModule         = 'console'
   ModuleVersion      = '0.9'

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
     'get-consoleFont',
     'set-consoleFontSize',
     'set-consoleFontName'
   )

   AliasesToExport   = @()

   ScriptsToProcess  = @(
    # 'console.ps1'       # V0.9: apparently not used, why has it ever gotten into the psd?
   )
}
