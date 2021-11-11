using { slah.db as slah } from '../db/datamodel';

@requires: 'authenticated-user'
service Myservice {
    @odata.draft.enabled
    entity MyEntity as projection on slah.myentity;

}

annotate Myservice.MyEntity with {
    hide @Common : {
        Text            : hide.name,
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