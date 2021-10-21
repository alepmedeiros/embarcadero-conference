unit CleanArch_EmbrConf.Infra.Database.Impl.Database;

interface

uses
  Dataset.Serialize,
  CleanArch_EmbrConf.Infra.Database.Interfaces,
  CleanArch_EmbrConf.Core.Entity.Interfaces,
  CleanArch_EmbrConf.Infra.Database.Conexao,
  CleanArch_EmbrConf.Core.Entity.Impl.ParkingLot, System.JSON;

type
  TDatabase = class(TInterfacedObject, iDatabase)
    private
      FConexao : iConexao;
      FParkingLot : iParkingLot;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDatabase;
      function getOneOrNone(aSQL : String; const aParams : Array of String) : iParkingLot;
      function OneOrNone(aSQL : String; const aParams : Array of String) : TJsonArray;
      function postPark(aSQL : String; const aParams : Array of String) : iDatabase;
  end;

implementation

constructor TDatabase.Create;
begin
  FConexao := TConexao.New;
  FParkingLot := TParkingLot.New;
end;

destructor TDatabase.Destroy;
begin

  inherited;
end;

function TDatabase.getOneOrNone(aSQL: String;
  const aParams: array of String): iParkingLot;
begin
  FConexao
    .SQL(aSQL)
    .Params('code', aParams[0])
  .Open;

  Result := FParkingLot
              .Code(FConexao.DataSet.FieldByName('code').AsString)
              .Capacity(FConexao.DataSet.FieldByName('capacity').AsInteger)
              .OpenHour(FConexao.DataSet.FieldByName('openhour').AsInteger)
              .CloseHour(FConexao.DataSet.FieldByName('closehour').AsInteger)
              .OccupiedSpaces(FConexao.DataSet.FieldByName('occupied_spaces').AsInteger);
end;

class function TDatabase.New : iDatabase;
begin
  Result := Self.Create;
end;

function TDatabase.OneOrNone(aSQL: String;
  const aParams: array of String): TJsonArray;
begin
  Result := FConexao
              .SQL(aSQL)
              .Params('code', aParams[0])
            .Open.DataSet.ToJSONArray;
end;

function TDatabase.postPark(aSQL: String;
  const aParams: array of String): iDatabase;
begin
  Result := Self;
  FConexao
    .SQL(aSQL)
    .Params('code',aParams[0])
    .Params('plate',aParams[1])
    .Params('data',aParams[2])
  .ExecSQL;
end;

end.
