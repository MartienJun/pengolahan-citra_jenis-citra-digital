unit Utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, ExtDlgs, windows;

type

  { TFormUtama }

  TFormUtama = class(TForm)
    buttonBiner: TButton;
    buttonRed: TButton;
    buttonGreen: TButton;
    buttonBlue: TButton;
    buttonGray: TButton;
    buttonOpen: TButton;
    buttonSave: TToggleBox;
    buttonReset: TToggleBox;
    editBiner: TEdit;
    groupBiner: TGroupBox;
    groupEdit: TGroupBox;
    groupImage: TGroupBox;
    imageBefore: TImage;
    imageAfter: TImage;
    lblBefore: TLabel;
    lblAfter: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    trackbarBiner: TTrackBar;
    procedure buttonBinerClick(Sender: TObject);
    procedure buttonBlueClick(Sender: TObject);
    procedure buttonGrayClick(Sender: TObject);
    procedure buttonGreenClick(Sender: TObject);
    procedure buttonOpenClick(Sender: TObject);
    procedure buttonRedClick(Sender: TObject);
    procedure buttonResetChange(Sender: TObject);
    procedure buttonSaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FormUtama: TFormUtama;
  //Variabel untuk menampung nilai RGB dari setiap piksel pada gambar
  bitmapR, bitmapG, bitmapB: Array [0..1000, 0..1000] of byte;

implementation

{$R *.lfm}

{ TFormUtama }
//==============================================================================
procedure TFormUtama.FormShow(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonOpenClick(Sender: TObject);
var
  x, y: Integer;

begin
  if OpenPictureDialog1.Execute then
  begin
    imageBefore.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    imageAfter.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    for y:= 0 to imageBefore.Height - 1 do
    begin
      for x:= 0 to imageBefore.Width - 1 do
      begin
        //Isi array dengan nilai RGB pada setiap piksel,
        //dimulai dari piksel kiri atas ke kanan bawah
        bitmapR[x,y]:= GetRValue(imageBefore.Canvas.Pixels[x,y]);
        bitmapG[x,y]:= GetGValue(imageBefore.Canvas.Pixels[x,y]);
        bitmapB[x,y]:= GetBValue(imageBefore.Canvas.Pixels[x,y]);

        //Load untuk imageAfter
        bitmapR[x,y]:= GetRValue(imageAfter.Canvas.Pixels[x,y]);
        bitmapG[x,y]:= GetGValue(imageAfter.Canvas.Pixels[x,y]);
        bitmapB[x,y]:= GetBValue(imageAfter.Canvas.Pixels[x,y]);
      end;
    end;
  end; //End if

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonSaveChange(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  begin
    imageAfter.Picture.SaveToFile(SavePictureDialog1.FileName);
  end;
end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonResetChange(Sender: TObject);
var
  x,y: Integer;

begin
  for y:= 0 to imageBefore.Height - 1 do
    begin
      for x:= 0 to imageBefore.Width - 1 do
      begin
        imageAfter.Canvas.Pixels[x,y]:= RGB(bitmapR[x,y], bitmapG[x,y], bitmapB[x,y]);
      end;
    end;
end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonRedClick(Sender: TObject);
var
  x,y: Integer;

begin
  for y:= 0 to imageBefore.Height - 1 do
    begin
      for x:= 0 to imageBefore.Width - 1 do
      begin
        imageAfter.Canvas.Pixels[x,y]:= RGB(bitmapR[x,y], 0, 0);
      end;
    end;

  //Loop y dan x, lalu isi kembali nilai Red dari RGB di setiap piksel, sementara
  //nilai Blue dan Green diganti dengan 0. Hal ini membuat hanya nilai Red yang terlihat
  //sehingga gambarnya hanya terdiri dari warna merah (gradasi merah gelap dan terang),
  //atau hitam (RGB 0,0,0 adalah hitam)
end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonGreenClick(Sender: TObject);
var
  x,y: Integer;

begin
  for y:= 0 to imageBefore.Height - 1 do
    begin
      for x:= 0 to imageBefore.Width - 1 do
      begin
        imageAfter.Canvas.Pixels[x,y]:= RGB(0, bitmapG[x,y], 0);
      end;
    end;
end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonBlueClick(Sender: TObject);
var
  x,y: Integer;

begin
  for y:= 0 to imageBefore.Height - 1 do
    begin
      for x:= 0 to imageBefore.Width - 1 do
      begin
        imageAfter.Canvas.Pixels[x,y]:= RGB(0, 0, bitmapB[x,y]);
      end;
    end;
end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonGrayClick(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonBinerClick(Sender: TObject);
begin

end;
//==============================================================================

end.

