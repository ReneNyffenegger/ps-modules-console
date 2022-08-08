using System;
using System.Runtime.InteropServices;

namespace Win32API {
public static class Console {

   [StructLayout(LayoutKind.Sequential)]
    public struct COORD {

        public short X;
        public short Y;

        public COORD(short x, short y) {
           X = x;
           Y = y;
        }
    }

   [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct CONSOLE_FONT_INFOEX
    {
        public uint  cbSize;
        public uint  n;
        public COORD size;
        public int   family;
        public int   weight;

        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string name;
    }


    
   [DllImport("kernel32.dll", SetLastError = true)] 
    public static extern IntPtr GetStdHandle( 
        int nStdHandle 
    ); 
    

   [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    extern static bool GetCurrentConsoleFontEx(
       IntPtr hConsoleOutput,
       bool   bMaximumWindow,
       ref    CONSOLE_FONT_INFOEX lpConsoleCurrentFont
    );

   [DllImport("kernel32.dll", SetLastError = true)]
    static extern Int32 SetCurrentConsoleFontEx(
        IntPtr ConsoleOutput,
        bool   MaximumWindow,
        ref    CONSOLE_FONT_INFOEX lpConsoleCurrentFont
     );

    public static CONSOLE_FONT_INFOEX GetFont() {
     CONSOLE_FONT_INFOEX ret = new CONSOLE_FONT_INFOEX();

     ret.cbSize = (uint) Marshal.SizeOf(ret);
     if (GetCurrentConsoleFontEx(GetStdHandle(-11), false, ref ret)) {
        return ret;
     }

     throw new Exception("something went wrong with GetCurrentConsoleFontEx");
  }

  public static void SetFont(CONSOLE_FONT_INFOEX font) {

    if (SetCurrentConsoleFontEx(GetStdHandle(-11), false, ref font ) == 0) {
       throw new Exception("something went wrong with SetCurrentConsoleFontEx");

    }

  }

  public static void SetSize(short w, short h) {
     CONSOLE_FONT_INFOEX font = GetFont();
     font.size.X = w;
     font.size.Y = h;
     SetFont(font);
  }

  public static void SetName(string name) {
     CONSOLE_FONT_INFOEX font = GetFont();
     font.name = name;
     SetFont(font);

  }


}
}
