

module.exports = function(cmds){
    var cmdsWithBindings = [];
    cmds.forEach(function(item){
        cmdsWithBindings.push({
            cmd: item,
            bindings: []
        });
    });

    return cmdsWithBindings;
}