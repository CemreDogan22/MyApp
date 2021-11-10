module.exports = srv => {
    srv.before('PATCH', 'MyEntity', async(req) => {
        if(req.data.hide_code == 2){
            req.data.hidden = true;
        }else req.data.hidden = false;        
    })

    srv.on('error', (err) => {
        err.message = "Bitte Auswaehlen, ob alles versteckt werden soll."
    })
}