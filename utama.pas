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
    cbRed: TCheckBox;
    cbGreen: TCheckBox;
    cbBlue: TCheckBox;
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
    procedure cbBlueChange(Sender: TObject);
    procedure cbGreenChange(Sender: TObject);
    procedure cbRedChange(Sender: TObject);
    //procedure cbRedChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure trackbarBinerChange(Sender: TObject);
  private

  public

  end;

var
  FormUtama: TFormUtama;
  //Variabel untuk menampung nilai RGB dari setiap piksel pada gambar
  bitmapR, bitmapG, bitmapB: Array [0..1000, 0..1000] of byte;
  bitmapBiner: Array [0..1000, 0..1000] of Boolean;

implementation

{$R *.lfm}

{ TFormUtama }
//==============================================================================
procedure TFormUtama.FormShow(Sender: TObject);
begin
  editBiner.Text:= IntToStr(trackbarBiner.Position);
end;

procedure TFormUtama.trackbarBinerChange(Sender: TObject);
begin
  editBiner.Text:= IntToStr(trackbarBiner.Position);
end;

//CheckBox Red
procedure TFormUtama.cbRedChange(Sender: TObject);
begin
  if cbRed.Checked = True then
  begin
    cbGreen.Enabled:= false;
    cbBlue.Enabled:= false;
  end
  else
  begin
    cbGreen.Enabled:= True;
    cbBlue.Enabled:= True;
  end;
end;

//CheckBox Green
procedure TFormUtama.cbGreenChange(Sender: TObject);
begin
  if cbGreen.Checked = True then
  begin
    cbRed.Enabled:= false;
    cbBlue.Enabled:= false;
  end
  else
  begin
    cbRed.Enabled:= True;
    cbBlue.Enabled:= True;
  end;
end;

//CheckBox Blue
procedure TFormUtama.cbBlueChange(Sender: TObject);
begin
  if cbBlue.Checked = True then
  begin
    cbRed.Enabled:= false;
    cbGreen.Enabled:= false;
  end
  else
  begin
    cbRed.Enabled:= True;
    cbGreen.Enabled:= True;
  end;
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
      //Memasukan kembali nilai RGB pada setiap piksel pada gambar, sehingga
      //gambar kembali memiliki warna (nilai RGB) awalnya pada setiapa piksel
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
var
  x,y: Integer;
  gray: byte;

begin
  for y:= 0 to imageBefore.Height - 1 do
  begin
    for x:= 0 to imageBefore.Width - 1 do
    begin
      gray:= (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
      imageAfter.Canvas.Pixels[x,y]:= RGB(gray, gray, gray);
    end;
  end;

  //Rumus untuk operasi grayscale adalah (nilai R + nilai G + nilai B)/3 untuk
  //setiap piksel.
end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonBinerClick(Sender: TObject);
var
  x,y: Integer;

begin
  //Panggil function button gray
  buttonGrayClick(Sender);

  //Simpan nilai biner (true/false) pada array
  for y:= 0 to imageAfter.Height - 1 do
  begin
    for x:= 0 to imageAfter.Width - 1 do
    begin
      //Jika nilai Red (nilai RGB pada suatu piksel pada citra grayscale adalah sama
      //oleh karena itu cukup ambil salah satu saja dari R/G/B) pada suatu piksel lebih
      //besar dari nilai pada trackbar, maka nilai RGB pada piksel tersebut adalah diubah
      //menjadi warna putih (255, 255, 255)
      if Red(imageAfter.Canvas.Pixels[x,y]) > trackbarBiner.Position then
      begin
        bitmapBiner[x,y]:= True;
      end
      else
      begin
        bitmapBiner[x,y]:= False;
      end;
    end;
  end;

  //Ubah nilai RGB pada setiap piksel yang ada di gambar SESUAI dengan nilai true/
  //false yang ada pada array bitmapBiner
  for y:= 0 to imageAfter.Height - 1 do
  begin
    for x:= 0 to imageAfter.Width - 1 do
    begin
      if bitmapBiner[x,y] = True then
      begin
        imageAfter.Canvas.Pixels[x,y] := RGB(255, 255, 255)
      end
      else
      begin
        imageAfter.Canvas.Pixels[x,y] := RGB(0, 0, 0)
      end;
    end;
  end;
end;
//==============================================================================

end.

