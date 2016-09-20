

module.exports = function (combinedDDL){
    //appendToScript(combinedDDL);
    var strScript = "";
    var appendToScript = function(str){
        strScript += str + "\n";
    }

    //output sequences
    appendToScript('\n\n----- Sequences ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'sequence'){
            appendToScript(item.ddl + ';');
        }
    });

    //output tables
    appendToScript('\n\n----- Tables ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'table'){
            appendToScript(item.ddl + ';');
        }
    });


    //output indexes
    appendToScript('\n\n----- Table Indexes ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'index'){
            appendToScript(item.ddl + ';');
        }
    });

    //output Constraints
    appendToScript('\n\n----- Table Constraints ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'constraint'){
            appendToScript(item.ddl + ';');
        }
    });

    //output ref Constraints
    appendToScript('\n\n----- Table Ref Constraints ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'refConstraint'){
            appendToScript(item.ddl + ';');
        }
    });

    //output functions
    appendToScript('\n\n----- Functions ------');
    combinedDDL.forEach(function(item){
        if(item.objectType === 'function'){
            appendToScript(item.ddl);
        }
    });

    return strScript;
}