unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
  SG1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
  procedure FormActivate(Sender: TObject);
  procedure SG1SelectCell(Sender: TObject; ACol, ARow: Integer;
            var CanSelect: Boolean);
  procedure ChargeListe(Rx: Integer);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  procedure BTN1Click(Sender: TObject);
  procedure ChBx1Click(Sender: TObject);
  end;

var
  Form1: TForm1;
  CB1: TComboBox;
  ChBx1: TCheckBox;
  ED1: TEdit;
  BTN1: TButton;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
var
  R: TRect;
  i : integer;
begin
  SG1.ColWidths[0] := 30;
  SG1.ColWidths[1] := 70;
  SG1.ColWidths[2] := 40;
  SG1.ColWidths[3] := 210;
  SG1.ColWidths[4] := 60;
  SG1.ColWidths[5] := 50;
  SG1.Cells[0,0] := 'C0';
  SG1.Cells[1,0] := 'C1';
  SG1.Cells[2,0] := 'C2';
  SG1.Cells[3,0] := 'C3';
  SG1.Cells[4,0] := 'C4';
  SG1.Cells[5,0] := 'C5';
  for i :=1 to 9 do
    SG1.Cells[0,i] := IntToStr(i);
end;

procedure TForm1.SG1SelectCell(Sender: TObject; ACol, ARow: Integer;
          var CanSelect: Boolean);

var
  R: TRect;
  k: Integer;
begin
  for k := 1 to SG1.RowCount-1 do
    SG1.Cells[3,k] := ''; //vide le texte
  SG1.Options:=SG1.Options+[goColSizing,goThumbTracking]-[goEditing];
  //Création du ComboBox
  CB1.Free;
  CB1:=TComboBox.Create(Self);
  CB1.Parent:=Form1;
  CB1.DropDownCount := 10;
  CB1.Visible:=False;
  CB1.Clear;
  //Création du CheckBox
  ChBx1.Free;
  ChBx1:=TCheckBox.Create(Self);
  ChBx1.Parent:=Form1;
  ChBx1.Visible:=False;
  ChBx1.OnClick:=ChBx1Click;
  ChBx1.Checked := False;
  ChBx1.Width := 15;
  ChBx1.Height := 15;
  //Création de l'Edit
  ED1.Free;
  ED1:=TEdit.Create(Self);
  ED1.Parent:=Form1;
  ED1.Visible:=False;
  ED1.Text := '';
  //Création du Bouton
  BTN1.Free;
  BTN1:=TButton.Create(Self);
  BTN1.Parent:=Form1;
  BTN1.Caption := 'OK';
  BTN1.OnClick:=BTN1Click;
  BTN1.Visible:=False;
  if (ARow <> 0) and (ACol = 0) then
    begin
      SG1.Cells[3,ARow] := 'La boîte à cocher modifie la liste';
      //Installe le ComboBox
      R := SG1.CellRect(1, ARow);
      R.Left := R.Left + SG1.Left;
      R.Right := R.Right + SG1.Left;
      R.Top := R.Top + SG1.Top;
      R.Bottom := R.Bottom + SG1.Top;
      CB1.Left := R.Left + 1;
      CB1.Top := R.Top + 1;
      CB1.Width := (R.Right + 1) - R.Left;
      CB1.Height := (R.Bottom + 1) - R.Top;
      CB1.Visible := True;
      //Installe le CheckBox
      R := SG1.CellRect(2, ARow);
      R.Left := R.Left + SG1.Left;
      R.Right := R.Right + SG1.Left;
      R.Top := R.Top + SG1.Top;
      R.Bottom := R.Bottom + SG1.Top;
      ChBx1.Left := R.Left + (((R.Right - R.Left) - 15) div 2) + 1;
      ChBx1.Top := R.Top + (((R.Bottom - R.Top) - 15) div 2) + 1;
      ChBx1.Visible := True;
      //Installe l'Edit
      R := SG1.CellRect(4, ARow);
      R.Left := R.Left + SG1.Left;
      R.Right := R.Right + SG1.Left;
      R.Top := R.Top + SG1.Top;
      R.Bottom := R.Bottom + SG1.Top;
      ED1.Left := R.Left + 1;
      ED1.Top := R.Top + 1;
      ED1.Width := (R.Right + 1) - R.Left;
      ED1.Height := (R.Bottom + 1) - R.Top;
      ED1.Visible := True;
      //Installe le Bouton
      R := SG1.CellRect(5, ARow);
      R.Left := R.Left + SG1.Left;
      R.Right := R.Right + SG1.Left;
      R.Top := R.Top + SG1.Top;
      R.Bottom := R.Bottom + SG1.Top;
      BTN1.Left := R.Left + 1;
      BTN1.Top := R.Top + 1;
      BTN1.Width := (R.Right + 1) - R.Left;
      BTN1.Height := (R.Bottom + 1) - R.Top;
      BTN1.Visible := True;
      //charge les valeurs de la grille si existantes
      if SG1.Cells[2,ARow] = 'O' then ChBx1.Checked := True else ChBx1.Checked := False;
      ChargeListe(StrToInt(SG1.Cells[0,ARow])); // avec le chiffre de la 1ere cellule
      CB1.Text := SG1.Cells[1,ARow];
      ED1.Text := SG1.Cells[4,ARow];
      CB1.SetFocus;
    end;
    CanSelect := True;
end;

procedure TForm1.BTN1Click(Sender: TObject);
begin
  SG1.Cells[SG1.Col+1,SG1.Row] := CB1.Text;
  CB1.Visible := False;
  ChBx1.Visible := False;
  ED1.Visible := False;
  BTN1.Visible := False;
  SG1.Cells[SG1.Col+3,SG1.Row] := '';
  if ChBx1.Checked = False then
    SG1.Cells[SG1.Col+2,SG1.Row] := 'N'
  else
    SG1.Cells[SG1.Col+2,SG1.Row] := 'O';
  SG1.Cells[SG1.Col+4,SG1.Row] := ED1.Text;
  SG1.SetFocus;
end;

procedure TForm1.ChBx1Click(Sender: TObject);
begin
  ChargeListe(StrToInt(SG1.Cells[SG1.Col,SG1.Row]));
end;

procedure TForm1.ChargeListe(Rx: Integer);
var
  k: Integer;
begin
  Rx := Rx * 10; //pour exprimer la dizaine et la développer
  CB1.Clear;
  if ChBx1.Checked = True then
    for k := 1 to 99 do CB1.Items.Add(IntToStr(k))
  else
    for k := Rx to Rx + 9 do CB1.Items.Add(IntToStr(k))
end;

end.
