unit CleanArch_EmbrConf.Infra.Database.Interfaces;

interface

uses
  Data.DB, CleanArch_EmbrConf.Core.Entity.Interfaces, System.JSON;

Type
  iConexao = interface
    function Params(aParam : String; Value : Variant) : iConexao;
    function DataSet(DataSource : TDataSource) : iConexao; overload;
    function DataSet : TDataSet; overload;
    function ExecSQL : iConexao;
    function Open : iConexao;
    function SQL(Value : String) : iConexao;
  end;

  iDatabase = interface
    function getOneOrNone(aSQL : String; const aParams : Array of String) : iParkingLot;
    function OneOrNone(aSQL : String; const aParams : Array of String) : TJsonArray;
    function postPark(aSQL : String; const aParams : Array of String) : iDatabase;
  end;

implementation

end.
