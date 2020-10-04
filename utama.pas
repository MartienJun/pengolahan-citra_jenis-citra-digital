unit Utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls;

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
    trackbarBiner: TTrackBar;
    procedure buttonBinerClick(Sender: TObject);
    procedure buttonBlueClick(Sender: TObject);
    procedure buttonGrayClick(Sender: TObject);
    procedure buttonGreenClick(Sender: TObject);
    procedure buttonRedClick(Sender: TObject);
    procedure buttonResetChange(Sender: TObject);
    procedure buttonSaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FormUtama: TFormUtama;

implementation

{$R *.lfm}

{ TFormUtama }
//==============================================================================
procedure TFormUtama.FormShow(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonSaveChange(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonResetChange(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonRedClick(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonGreenClick(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonBlueClick(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonBinerClick(Sender: TObject);
begin

end;
//==============================================================================


//==============================================================================
procedure TFormUtama.buttonGrayClick(Sender: TObject);
begin

end;
//==============================================================================

end.

