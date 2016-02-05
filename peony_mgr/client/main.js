var appCtx = { };

$(document).ready(function(){
   function initControlPaths(){
       appCtx.controls = {
         mainContent: "#main-content",
         clientTable: {
             addButton: "#btn-add-client",
             editRowButton: ".itemAction-edit"
         },
         addNewClient: {
             cancelButton: ".new-client-form .btn-cancel",
             provisionClientButton: ".new-client-form .btn-provision-client",
             formWrapper: ".new-client-div",
             waitMsg: ".wait-msg",
             clientId: ".new-client-form .txt-clientid",
             clientName: ".new-client-form .txt-clientname"             
         }
       };
   }
   
   function initEventHandlers(){
       
   }
     
   function showAddClient(){
        $.get("client/client-add.tmp.html",renderAddClient);         
   }
   
   function renderAddClient(data){
         renderMainContent(data);   
         $(appCtx.controls.addNewClient.cancelButton).click(showClientTable);
         $(appCtx.controls.addNewClient.provisionClientButton).click(provisionClient);
          
   }
   
   function provisionClient(){
       $(appCtx.controls.addNewClient.formWrapper).hide();
       $(appCtx.controls.addNewClient.waitMsg).removeClass("hidden");
       var newClient = {};
       
       newClient.clientId = $(appCtx.controls.addNewClient.clientId).val();
       newClient.clientName = $(appCtx.controls.addNewClient.clientName).val();
       
       var strNewClient = JSON.stringify(newClient);
       console.log(strNewClient);
       
       setTimeout(function(){
           $.post("/api/client/", newClient, function(data){
               showClientTable();
           })
           .fail(function(data){
                if(data.responseJSON.msg){
                    alert(data.responseJSON.msg);
                }else{
                    alert("Error provisioning client");
                }
                $(appCtx.controls.addNewClient.formWrapper).show();
                $(appCtx.controls.addNewClient.waitMsg).hide();                
           });
       }, 5000);
      return false;
   }
   
   function showClientTable(){
        $.get("client/client-table.tmp.html", renderClientTable);        
   }
   
   function notImplemented(){
       alert("This feature is not yet implemented.");
   }
   
   function renderClientTable(data){
       renderMainContent(data);
       $(appCtx.controls.clientTable.addButton).click(showAddClient);     
       $.get("/api/client/", populateClientTableData);
   }
   
   function populateClientTableData(data){
       $(".client-table-datarows").empty();
       $.each(data, function(index){
           var item = this;
           
           var template = '' +
            '<tr class="tbl-row client-row"> ' +                     
                '<td class="item-id">{{ID}}</td> ' +                
                '<td class="item-code">{{CODE}}</td> ' +             
                '<td class="item-name">{{NAME}}</td> ' +         
                '<td class="item-url"><a href="{{URL}}" target="_blank">{{URL}}</a></td> ' + 
                '<td class="item-owner-schema">{{STATUS}}</td> ' + 
                '<td class="item-owner-schema">{{OWNER_SCHEMA}}</td> ' + 
                '<td class="item-owner-password">{{OWNER_PASSWORD}}</td> ' + 
                '<td class="item-user-count">{{USER_COUNT}}</td> ' + 
                '<td> ' +                                           
                    '<button type="submit" ' +      
                    'class="btn btn-default itemAction-edit"> ' +   
                        'Edit ' +
                    '</button> ' +                                   
                '</td> ' +                                          
            '</tr>';
    
           template = template.replace("{{ID}}", item.ID);
           template = template.replace("{{CODE}}", item.CODE);
           template = template.replace("{{NAME}}", item.NAME);
           template = template.replace("{{OWNER_SCHEMA}}", "PNY_DBO_" + item.CODE);
           template = template.replace("{{OWNER_PASSWORD}}", item.OWNER_USER_PASSWORD);
           template = template.replace(new RegExp("{{URL}}", 'g'), "http://localhost:" + item.PORT + "/");
           template = template.replace("{{STATUS}}", item.PM2_STATUS);
           template = template.replace("{{USER_COUNT}}", 25);
           
           $(template).appendTo(".client-table-datarows");
           
        //    var tmpRow = $(".client-row .tmp").clone(true);
        //    tmpRow.find(".item-id").html(item.ID);
        //    tmpRow.find(".item-code").html(item.CODE);
        //    tmpRow.removeClass("tmp");
        //    $(".client-table-datarows").append(tmpRow);
       });
         
       $(appCtx.controls.clientTable.editRowButton).click(notImplemented);
   }
   
   function renderMainContent(data){
       $(appCtx.controls.mainContent).html(data);
   }
   
   initControlPaths();
   initEventHandlers();
   showClientTable();
   
   
});