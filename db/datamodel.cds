namespace slah.db;

using { managed, cuid, sap.common } from '@sap/cds/common';

entity myentity : managed, cuid {
    UserID : String;
    PatientenID : String(15);
    Vorname : String;
    Nachname : String;
    GebDatum : Date;
    Geschlecht : String;
    text1 : String;
    text2 : String;
    zahl1 : Integer;
    zahl2 : Integer;
    zahl3 : Integer @readonly;
    hide: Association to one JaNein @mandatory @assert.range: [ 1, 2 ];
    hidden : Boolean not null default false;
}

entity JaNein : FragebogenCodeList {}

entity FragebogenCodeList : common.CodeList {
  key code : String(30);
}