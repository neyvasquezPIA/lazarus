unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

// Pezzo 2: Bottone "Una settimana" con il ciclo FOR
procedure TForm1.Button1Click(Sender: TObject);
var
  quota, totale: Real;
  i: Integer;
begin
  Memo1.Lines.Clear;

  // Legge la quota inserita nella prima casella (Edit1)
  quota := StrToFloat(Edit1.Text);
  totale := 0;

  // Calcola i risparmi giorno per giorno per 7 giorni
  for i := 1 to 7 do
  begin
    totale := totale + quota;
    Memo1.Lines.Add('Giorno ' + IntToStr(i) + ': ' + FloatToStr(totale) + ' €');
  end;
end;

// Pezzo 3 e 4: Bottone "Quanti giorni mi servono?" con il ciclo WHILE e Paghetta
procedure TForm1.Button2Click(Sender: TObject);
var
  quota, obiettivo, totale: Real;
  giorni: Integer;
begin
  Memo1.Lines.Clear;

  // Legge quota e obiettivo dai due Edit
  quota := StrToFloat(Edit1.Text);
  obiettivo := StrToFloat(Edit2.Text);

  totale := 0;
  giorni := 0;

  // Continua ad accumulare risparmi finché non si raggiunge l'obiettivo
  while totale < obiettivo do
  begin
    giorni := giorni + 1;
    totale := totale + quota;

    // Sfida "Con la paghetta": aggiunge un extra di 5€ ogni 7 giorni
    if (giorni mod 7 = 0) then
    begin
      totale := totale + 5;
    end;

    Memo1.Lines.Add('Giorno ' + IntToStr(giorni) + ': ' + FloatToStr(totale) + ' €');
  end;

  Memo1.Lines.Add('----------------------------------------');
  Memo1.Lines.Add('Servono ' + IntToStr(giorni) + ' giorni per raggiungere ' + FloatToStr(obiettivo) + ' €!');
end;



end.
