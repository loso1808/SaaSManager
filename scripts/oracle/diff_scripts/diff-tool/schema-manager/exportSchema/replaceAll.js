

module.exports = function(target, search, replacement){
    return target.replace(new RegExp(escapeRegExp(search), 'g'), replacement);

    function escapeRegExp(str) {
        return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&"); // $& means the whole matched string
    }
}