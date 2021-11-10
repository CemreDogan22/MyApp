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
        Title : { $Type : 'UI.DataField', Value : '{i18n>appTitle}'},
        Description : { $Type : 'UI.DataField', Value : '{i18n>appDescription}'}
    },

    UI.HeaderFacets : [
        {$Type : 'UI.ReferenceFacet',Target : '@UI.FieldGroup#Information'}
    ],

    UI.FieldGroup #Information : {
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
        Target : '@UI.FieldGroup#text1'
        }        
    ],
    UI.FieldGroup#text1 : {
        Data: [
            {Value: text1, Label : '{i18n>text1}', ![@UI.Hidden] : hidden},
            {Value: text2, Label : '{i18n>text2}', ![@UI.Hidden] : hidden},
            {Value: zahl1, Label : '{i18n>zahl1}', ![@UI.Hidden] : hidden},
            {Value: zahl2, Label : '{i18n>zahl2}', ![@UI.Hidden] : hidden},
            {Value: zahl3, Label : '{i18n>zahl3}', ![@UI.Hidden] : hidden},
            {Value : hide_code, Label : '{i18n>hide}'}         
        ]
    }
);

//SideEffects um Elemente in Echtzeit aus- bzw. einzublenden
annotate Myservice.MyEntity with @(
    Common.SideEffects #hidden : {
        SourceProperties : [
            hide_code
        ],
        TargetProperties : [
            'hidden'
        ]
    }
);
