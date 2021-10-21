unit CleanArch_EmbrConf.Infra.Database.Conexao;

interface

uses
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Error,
  Firedac.UI.Intf,
  Firedac.Phys.Intf,
  Firedac.Stan.Def,
  Firedac.Stan.Pool,
  Firedac.Stan.Async,
  Firedac.Phys,
  Firedac.Phys.SQLite,
  Firedac.Phys.SQLiteDef,
  Firedac.Stan.ExprFuncs,
  Firedac.Phys.SQLiteWrapper.Stat,
  Firedac.VCLUI.Wait,
  Firedac.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  CleanArch_EmbrConf.Infra.Database.Interfaces,
  Data.DB;

type
  TConexao = class(TInterfacedObject, iConexao)
  private
    FConexao : TFDConnection;
    FQuery : TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConexao;
    function Params(aParam: String; Value: Variant): iConexao;
    function DataSet(DataSource: TDataSource): iConexao; overload;
    function DataSet: TDataSet; overload;
    function ExecSQL: iConexao;
    function Open: iConexao;
    function SQL(Value: String): iConexao;
  end;

implementation

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;
  FConexao.Params.Clear;
  FConexao.Params.Add('DriverID=SQLite');
  FConexao.Params.Add('DataBase=..\..\..\database\dados.sdb');
  FConexao.Params.Add('LockingMode=Normal');
  FConexao.Connected := True;
end;

function TConexao.DataSet(DataSource: TDataSource): iConexao;
begin
  Result := Self;
  DataSource.DataSet := FQuery;
end;

function TConexao.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TConexao.Destroy;
begin
  FConexao.DisposeOf;
  FQuery.DisposeOf;
  inherited;
end;

function TConexao.ExecSQL: iConexao;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

class function TConexao.New: iConexao;
begin
  Result := Self.Create;
end;

function TConexao.Open: iConexao;
begin
  Result := Self;
  FQuery.Open;
end;

function TConexao.Params(aParam: String; Value: Variant): iConexao;
begin
  Result := Self;
  FQuery.ParamByName(aParam).Value := Value;
end;

function TConexao.SQL(Value: String): iConexao;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

end.
