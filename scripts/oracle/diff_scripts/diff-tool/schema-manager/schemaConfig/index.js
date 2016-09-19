
var _ = require('lodash');
var passwordGenerator = require('generate-password');
var passwordGenOpts = {
    length: 18,
    numbers: true,
    symbols: false,
    uppercase: true,
    excludeSimilarCharacters: true
};

module.exports = function(opts){
    
    opts.isManagedTableSpace = opts.isManagedTableSpace || false;

    opts.tablespaceOpts = opts.tablespaceOpts || {};
    opts.tablespaceOpts.separateIndexTablespace = opts.tablespaceOpts.separateIndexTablespace || false;
    opts.tablespaceOpts.separateLogTablespace = opts.tablespaceOpts.separateLogTablespace || false;

    opts.passwordGenOpts = opts.passwordGenOpts || {};
    opts.passwordGenOpts = _.assign({}, passwordGenOpts, opts.passwordGenOpts);

    if(opts.schemaCode){
        opts.schemaOwner = opts.schemaOwner || 'PNY_' + opts.schemaCode + '_DBO';
        opts.appSchema = opts.appSchema || 'PNY_' + opts.schemaCode + '_APP';
        opts.appRole = opts.appRole || 'PNY_' + opts.schemaCode + '_AR';
        opts.dataTablespace = opts.dataTablespace || 'PNY_' + opts.schemaCode + '_DATA';
        opts.tempTablespace = opts.tempTablespace || 'PNY_' + opts.schemaCode + '_TMP';


        if(opts.tablespaceOpts.separateIndexTablespace){
            opts.indexTablespace = opts.indexTablespace || 'PNY_' + opts.schemaCode + '_IDX';
        }else{
            opts.indexTablespace = opts.indexTablespace || opts.dataTablespace;
        }

        if(opts.tablespaceOpts.separateLogTablespace){
            opts.logTablespace = opts.logTablespace || 'PNY_' + opts.schemaCode + '_LOG';
            if(opts.tablespaceOpts.separateIndexTablespace){
                opts.logIndexTablespace = opts.logIndexTablespace || 'PNY_' + opts.schemaCode + '_LIDX';
            }
        }else{
            opts.logTablespace = opts.logTablespace || opts.dataTablespace;
            if(opts.tablespaceOpts.separateIndexTablespace){
                opts.logIndexTablespace = opts.logIndexTablespace || opts.indexTablespace;
            }
        }
    }else{
        opts.schemaOwner = opts.schemaOwner || 'PEONY_OWNER';
        opts.appSchema = opts.appSchema || 'PEONY_APP';
        opts.appRole = opts.appRole || 'PEONY_APP_ROLE';
        opts.dataTablespace = opts.dataTablespace || 'PEONY_DATA';
        opts.tempTablespace = opts.tempTablespace || 'TMP_PEONY_DATA';
        
        if(opts.tablespaceOpts.separateIndexTablespace){
            opts.indexTablespace = opts.indexTablespace || 'PEONY_IDX_DATA';
        }else{
            opts.indexTablespace = opts.indexTablespace || opts.dataTablespace;
        }

       if(opts.tablespaceOpts.separateLogTablespace){
            opts.logTablespace = opts.logTablespace || 'PEONY_LOG_DATA';
            if(opts.tablespaceOpts.separateIndexTablespace){
                opts.logIndexTablespace = opts.logIndexTablespace || 'PEONY_LOG_IDX_DATA';
            }
        }else{
            opts.logTablespace = opts.logTablespace || opts.dataTablespace;
            if(opts.tablespaceOpts.separateIndexTablespace){
                opts.logIndexTablespace = opts.logIndexTablespace || opts.indexTablespace;
            }
        }
    }

    opts.schemaOwnerPassword = opts.schemaOwnerPassword || generatePassword(opts.passwordGenOpts);
    opts.appSchemaPassword = opts.appSchemaPassword || generatePassword(opts.passwordGenOpts);

    if(!opts.isManagedTableSpace){
        opts.dataTablespaceFilename = opts.dataTablespaceFilename || (opts.dataTablespace + '.dat');
        opts.tempTablespaceFilename = opts.tempTablespaceFilename || (opts.tempTablespace + '.dat');

        if(opts.tablespaceOpts.separateIndexTablespace){
            opts.indexTablespaceFilename = opts.indexTablespaceFilename || (opts.indexTablespace + '.dat');
        }

        if(opts.tablespaceOpts.separateLogTablespace){
            opts.logTablespaceFilename = opts.logTablespaceFilename || (opts.logTablespace + '.dat');
            
            if(opts.tablespaceOpts.separateIndexTablespace){
                opts.indexTablespaceFilename = opts.indexTablespaceFilename || (opts.indexTablespace + '.dat');
            }
        }
    }

    return opts;
}

function generatePassword(opts){
    return passwordGenerator.generate(opts);
}