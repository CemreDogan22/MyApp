using { slah.db as slah } from '../db/datamodel';

Service Myservice {
    @odata.draft.enabled
    entity MyEntity as projection on slah.myentity;

}

annotate Myservice.MyEntity with {
    accept @Common : {
        Text            : accept.name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues
    };
};

annotate Myservice.JaNein with {
    code @UI.Hidden @Common : {
        Text : name,
        TextArrangement : #TextOnly
    }  
};