set-strictMode -version latest

function get-ansiForConsoleColor {
    param (
      [parameter(mandatory=$true)]
       [System.ConsoleColor]           $consoleColor,
      [parameter(mandatory=$false)]
       [bool]                          $is_bg = $false
    )

    [byte] $color = $consoleColor.value__

    if ($color -gt 7) {
       $color = $color - 8
       $dark  = $true
    }
    else {
       $dark  = $false
    }

    if     ( $color -eq 0 ) { $code = 0 }
    elseif ( $color -eq 1 ) { $code = 4 }
    elseif ( $color -eq 2 ) { $code = 2 }
    elseif ( $color -eq 3 ) { $code = 6 }
    elseif ( $color -eq 4 ) { $code = 1 }
    elseif ( $color -eq 5 ) { $code = 5 }
    elseif ( $color -eq 6 ) { $code = 3 }
    elseif ( $color -eq 7 ) { $code = 7 } # gray, white...

    $ret = "$([char] 27)["

    if ($dark) { if ($is_bg) { $ret += '3' } else { $ret +=  '9'}}
    else       { if ($is_bg) { $ret += '4' } else { $ret += '10'}}

    $ret += $code
    $ret += 'm'

    return $ret
}

function get-textInConsoleXColor {
   param (
      [parameter(mandatory=$true)]
      [System.ConsoleColor]           $bg,
      [parameter(mandatory=$true)]
      [System.ConsoleColor]           $fg,
      [parameter(mandatory=$true)]
      [string]                        $text
   )

   $ret += ( get-ansiForConsoleColor  $bg $true )
   $ret += ( get-ansiForConsoleColor  $fg $false)

   $ret += $text

   $ret += "$([char] 27)[0m"

   return $ret

}

function get-textInConsoleWarningColor {
   param (
      [parameter(mandatory=$true)]
      [string]                     $text
   )

   return get-textInConsoleXColor $host.PrivateData.WarningBackgroundColor $host.PrivateData.WarningForegroundColor $text
}

function write-textInConsoleWarningColor {
   param (
      [parameter(mandatory=$true)]
      [string]                     $text
   )

   write-host (get-textInConsoleWarningColor $text)
}

function get-textInConsoleErrorColor {
   param (
      [parameter(mandatory=$true)]
      [string]                     $text
   )
   return get-textInConsoleXColor $host.PrivateData.ErrorBackgroundColor $host.PrivateData.ErrorForegroundColor $text
}

function write-textInConsoleErrorColor {
   param (
      [parameter(mandatory=$true)]
      [string]                     $text
   )

   write-host (get-textInConsoleErrorColor $text)
}

function get-consoleLineText {

   param (
      [parameter(mandatory=$false)]
      [int]                         $line  = -1,
      [switch]                      $noTrimEnd
   )

   if ($line -lt 0) {
      $line = $host.ui.rawui.CursorPosition.Y + $line-1
   }

   $region = new-object System.Management.Automation.Host.Rectangle `
          0                                   ,$line,               `
         ($host.ui.rawui.BufferSize.Width  -1),$line

   $cells = $host.ui.rawui.GetBufferContents($region)

   $ret= ''
   foreach ($cell in $cells) {
      $ret += $cell.Character
   }

   if (-not $noTrimEnd) {
      $ret = $ret.TrimEnd()
   }

   return $ret
}
