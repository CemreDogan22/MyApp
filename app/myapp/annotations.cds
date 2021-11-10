using Myservice as service from '../../srv/datamodel_srv';

annotate Myservice.MyEntity with @(

    //Anlegen Button entfernen. Das Anlegen wird nicht erlaubt
    Capabilities.InsertRestrictions : {
        Insertable : false
    },
    
    UI : {
        LineItem  : [
            {Label : '{i18n>ID}', Value : ID, ![@UI.Hidden]},
            {Label : '{i18n>UserID}', Value : UserID},
            {Label : '{i18n>PatientenID}', Value : PatientenID},
            {Label : '{i18n>Vorname}', Value : Vorname},
            {Label : '{i18n>Nachname}', Value : Nachname},
            {Label : '{i18n>GebDatum}', Value : GebDatum},
            {Label : '{i18n>Geschlecht}', Value : Geschlecht}
        ],
    }
);

/** Object Page - Detail Ansicht */
annotate Myservice.MyEntity with @(

    //Löschen Button entfernen. Das Löschen wird nicht erlaubt
    Capabilities.DeleteRestrictions : {
        Deletable : false
    },

    UI.HeaderInfo : {
        TypeName : '{i18n>Einzahl}',
        TypeNamePlural : '{i18n>Mehrzahl}',
        Title : { $Type : 'UI.DataField', Value : '{i18n>datenschutz}'},
        //Description : { $Type : 'UI.DataField', Value : '{i18n>ESSTitle}'}
    },

    UI.HeaderFacets : [
        {$Type : 'UI.ReferenceFacet',Target : '@UI.FieldGroup#PatientInformation'}
    ],

    UI.FieldGroup #PatientInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>UserID}',
                Value : UserID,  
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>PatientenID}',
                Value : PatientenID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Vorname}',
                Value : Vorname
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Nachname}',
                Value : Nachname
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>GebDatum}',
                Value : GebDatum
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Geschlecht}',
                Value : Geschlecht
            }
        ],
    },

    UI.Facets: [
        {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>appTitle}',
        ID     : 'Datenschutzrichtlinien',
        Target : '@UI.FieldGroup#text1'
        }        
    ],
    UI.FieldGroup#text1 : {
        Data: [
            {Value: text1},
            {Value: text2},
            {Value: zahl1},
            {Value: zahl2},
            {Value: zahl3},
            {Value : accept_code}         
        ]
    }

);