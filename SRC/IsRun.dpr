program IsRun;

{$APPTYPE CONSOLE}

uses
    SysUtils, Windows, TLHelp32;


  { TODO -oUser -cConsole Main : Insert code here }

function IsRunnig (FicheroExe:string):boolean;
 
    function SacaExe(MangoW:HWND):string;
    {Obtiene el EXE de una tarea}
    {get EXE of a task}
    var 
      Datos    :TProcessEntry32;
      hID    :DWord;
      Snap    : Integer;
    begin 
      GetWindowThreadProcessId(MangoW,@hID);
      Snap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
      try
        Datos.dwSize:=SizeOf(Datos);
        if(Process32First(Snap,Datos))then
        begin 
          repeat 
            if Datos.th32ProcessID=hID then 
            begin 
              Result:=UpperCase(StrPas(Datos.szExeFile));
              Break;
            end;
          until not(Process32Next(Snap,Datos));
        end; 
      finally
        Windows.CloseHandle(Snap);
      end; 
    end; 
 
 
   function ObtieneVentanas(Mango: HWND;
            ACerrar: Pointer): Boolean; stdcall;
   begin 
     Result := True;
     {Mango es el handle de la tarea encontrada}
     {Si es el .EXE buscado, lo cierra}
     if SacaExe(Mango)=UpperCase( String(ACerrar^) )then
     begin 
       String(Acerrar^):='Encontrado';
     end; 
   end; 
 
 
  begin 
    EnumWindows( @ObtieneVentanas, Integer(@FicheroExe) );
    Result:=(FicheroExe='Encontrado');
  end; 



// PROGRAMA PRINCIAL
begin

if paramstr(1)='' then begin
   writeln;
   writeln('IsRun.EXE "aplicacion.exe" ');
   writeln('Nos indica si el programa "aplicacion.exe" esta ejecutandose.');
   writeln('Si no esta ejecutandose devolvera ERRORLEVEL 99');
   writeln;
   writeln('by Paco');
   exit;
end;

if IsRunnig(paramstr(1)) then writeln(paramstr(1)+' esta ejecutandose.')
   else begin
        writeln(paramstr(1)+' NO esta ejecutandose.');
        Halt(99); // salgo con errorlevel 99
   end;
end.
