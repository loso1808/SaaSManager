


module.exports = (function(){
    
    
    function addStringAttr(knex, tableName, columnName, nullable, maxLength){
        
    }
        
    function addNumberAttr(knex, tableName, columnName, nullable){
        
    }    
       
    function addTextAttr(knex, tableName, columnName, nullable){
        
    }    
       
    function addTimestampAttr(knex, tableName, columnName, nullable){
        
    }
           
    function addDateAttr(knex, tableName, columnName, nullable){
        
    }
    
    function addIdAttr(knex, tableName, columnName){
        
    }
    
    var dataTypeAttributeMap = {
      "number": addNumberAttr,
      "string": addStringAttr,
      "text": addTextAttr,
      "timestamp": addTimestampAttr,
      "date": addDateAttr,
      "id": addIdAttr
    };
    
    function getAddAttrForType(dataTypeName){
        var name = dataTypeName.toLowerCase();
        return dataTypeAttributeMap[name];
    }
    
    var Snowbird = function(knex){
        this.knex = knex;
    };
    
    Snowbird.prototype.addEntity = function(entityName){
        var self = this;
        
        return self.knex.createTable(entityName);       
    };
    
    Snowbird.prototype.addAttribute = function(entityName, attributeName, dataType, isRequired, maxLength){
        var attrMethod = getAddAttrForType(dataType);
        return attrMethod.apply(this, [this.knex, entityName, attributeName, isRequired, maxLength])
    }
    
    Snowbird.prototype.addReference = function(entityName, referencedEntityName, attributeName, referencedAttributeName){
        
    }
})();