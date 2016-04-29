

module.exports = function(knex){

    return knex.schema.createTable('DE_bin', function(table){
            table.increments('id').primary();
            table.specificType('directionForward', 'NUMBER');
            table.specificType('dsf', 'NUMBER');
            table.specificType('fro', 'NUMBER');
            table.string('extra5PrimeBps', 256);
            table.string('extra3PrimeBps', 256);
            table.string('binName', 256);
            table.string('iconID', 256);
            table.specificType('DEIndex', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            
    }).then(function(){
        return knex.schema.createTable('DE_bin_cell', function(table){
            table.increments('id').primary();
            table.specificType('index', 'NUMBER');
            table.string('fas', 256);
            table.specificType('part_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('access_control', function(table){
            table.increments('acId').primary();
            table.specificType('objectId', 'NUMBER').notNullable();
            table.string('objectName', 50).notNullable();
        });

    }).then(function(){
        return knex.schema.createTable('clob_buffer', function(table){
            table.increments('id').primary();
            table.string('chunk', 4000);
            table.string('bufferId', 400);
            table.specificType('chunkIndex', 'NUMBER');
            table.timestamp('dateCreated');
        });

    }).then(function(){
        return knex.schema.createTable('custom_fields', function(table){
            table.increments('id').primary();
            table.specificType('objectId', 'NUMBER').notNullable();
            table.string('objectName', 50).notNullable();
            table.string('fieldName', 400).notNullable();
            table.string('fieldValue', 4000);
            table.string('fieldDataType', 50);
        });

    }).then(function(){
        return knex.schema.createTable('custom_j5parameters', function(table){
            table.increments('id').primary();
            table.string('name', 256);
            table.specificType('suppress_primer_annotations', 'NUMBER');
            table.specificType('suppress_pure_primers', 'NUMBER');
            table.specificType('hmlgy_max_fraction_mismatches', 'NUMBER');
            table.specificType('hmlgy_min_length_bps', 'NUMBER');
            table.string('output_seq_format', 256);
            table.specificType('mispriming_oligo_conc', 'NUMBER');
            table.specificType('mispriming_salt_conc', 'NUMBER');
            table.specificType('mispriming_min_tm', 'NUMBER');
            table.specificType('mispriming_3pbp_to_warn_if_hit', 'NUMBER');
            table.specificType('primer_dna_conc', 'NUMBER');
            table.specificType('primer_salt_corrections', 'NUMBER');
            table.specificType('primer_tm_santalucia', 'NUMBER');
            table.specificType('primer_pair_max_compl_end_th', 'NUMBER');
            table.specificType('primer_pair_max_compl_any_th', 'NUMBER');
            table.specificType('primer_max_self_end_th', 'NUMBER');
            table.specificType('primer_max_self_any_th', 'NUMBER');
            table.specificType('primer_max_diff_tm', 'NUMBER');
            table.specificType('primer_max_tm', 'NUMBER');
            table.specificType('primer_min_tm', 'NUMBER');
            table.specificType('primer_max_size', 'NUMBER');
            table.specificType('primer_min_size', 'NUMBER');
            table.specificType('primer_gc_clamp', 'NUMBER');
            table.specificType('dir_synth_min_cost_per_piece', 'NUMBER');
            table.specificType('dir_synth_cost_per_bp', 'NUMBER');
            table.specificType('min_pcr_product_bps', 'NUMBER');
            table.specificType('oligo_max_len_no_page_pur_bps', 'NUMBER');
            table.specificType('oligo_page_pur_cost_per_piece', 'NUMBER');
            table.specificType('oligo_synthesis_cost_per_bp', 'NUMBER');
            table.specificType('max_ids_ggate_overhangs_cmptbl', 'NUMBER');
            table.string('ggate_termini_extra_seq', 256);
            table.string('ggate_recognition_seq', 256);
            table.specificType('ggate_overhang_bps', 'NUMBER');
            table.specificType('min_fragment_size_gibson_bps', 'NUMBER');
            table.specificType('max_oligo_length_bps', 'NUMBER');
            table.specificType('gibson_overlap_max_tm', 'NUMBER');
            table.specificType('gibson_overlap_min_tm', 'NUMBER');
            table.specificType('gibson_overlap_bps', 'NUMBER');
            table.specificType('master_plasmid_num_of_digits', 'NUMBER');
            table.specificType('master_oligo_num_of_digits', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('dd_part', function(table){
            table.increments('id').primary();
            table.specificType('part_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('devicedesign', function(table){
            table.increments('id').primary();
            table.string('name', 256);
            table.specificType('combinatorial', 'NUMBER');
            table.specificType('isCircular', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('eugene_rule', function(table){
            table.increments('id').primary();
            table.specificType('operand1_id', 'NUMBER');
            table.specificType('operand2_id', 'NUMBER');
            table.string('name', 256);
            table.string('originalRuleLine', 256);
            table.specificType('negationOperator', 'NUMBER');
            table.specificType('operand2IsNumber', 'NUMBER');
            table.specificType('operand2Number', 'NUMBER');
            table.string('compositionalOperator', 256);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('feature_type', function(table){
            table.increments('id').primary();
            table.string('name', 400);
            table.string('description', 2000);
            table.specificType('user_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('code', 400).notNullable();
        });

    }).then(function(){
        return knex.schema.createTable('group', function(table){
            table.increments('id').primary();
            table.string('name', 400);
            table.string('description', 4000);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('group_data', function(table){
            table.increments('id').primary();
            table.specificType('objectId', 'NUMBER').notNullable();
            table.specificType('objectName', 'NUMBER').notNullable();
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('group_project', function(table){
            table.increments('id').primary();
            table.string('name', 400).notNullable();
            table.string('description', 4000);
            table.timestamp('dateCreated').notNullable();
            table.timestamp('dateModified').notNullable();
        });

    }).then(function(){
        return knex.schema.createTable('group_project_data', function(table){
            table.increments('id').primary();
            table.specificType('objectId', 'NUMBER').notNullable();
            table.string('objectName', 400).notNullable();
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('group_project_user', function(table){
            table.increments('id').primary();
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('group_user', function(table){
            table.increments('id').primary();
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('import_data', function(table){
            table.increments('id').primary();
            table.specificType('import_file_id', 'NUMBER');
            table.specificType('importOrder', 'NUMBER');
            table.string('status', 400);
            table.specificType('objectId', 'NUMBER');
            table.string('objectName', 400);
            table.text('objectData');
            table.text('objectCustomFields');
            table.string('recordId', 250);
        });

    }).then(function(){
        return knex.schema.createTable('import_file', function(table){
            table.increments('id').primary();
            table.string('fileName', 4000).notNullable();
            table.text('fileData');
            table.timestamp('dateCreated').notNullable();
            table.specificType('user_id', 'NUMBER').notNullable();
        });

    }).then(function(){
        return knex.schema.createTable('import_log', function(table){
            table.increments('id').primary();
            table.string('logAction', 400);
            table.timestamp('dateLogged').notNullable();
            table.string('logMessage', 4000);
        });

    }).then(function(){
        return knex.schema.createTable('import_operation', function(table){
            table.increments('id').primary();
            table.string('fileName', 4000);
            table.string('status_cd', 400).notNullable();
            table.timestamp('dateCreated').notNullable();
            table.timestamp('dateModified').notNullable();
            table.specificType('contributor_id', 'NUMBER');
        });

    }).then(function(){
        return knex.schema.createTable('j5run', function(table){
            table.increments('id').primary();
            table.string('assemblyMethod', 256);
            table.string('assemblyType', 256);
            table.date('date');
            table.string('devicedesign_name', 256);
            table.date('endDate');
            table.string('name', 256);
            table.string('status', 256);
            table.specificType('devicedesign_id', 'NUMBER');
            table.specificType('staticProtocolId', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.text('results');
            table.text('j5output');
            table.specificType('project_id', 'NUMBER');
            table.string('clientTimeDiff', 256);
        });

    }).then(function(){
        return knex.schema.createTable('master', function(table){
            table.specificType('user_id', 'NUMBER');
            table.text('masterDirectSynthesesList');
            table.text('masterOligoList');
            table.text('masterPlasmidList');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.increments('id').primary();
        });

    }).then(function(){
        return knex.schema.createTable('part', function(table){
            table.increments('id').primary();
            table.string('definitionHash', 64);
            table.string('FQDN', 512);
            table.specificType('genbankStartBP', 'NUMBER');
            table.specificType('endBP', 'NUMBER');
            table.specificType('revComp', 'NUMBER');
            table.specificType('directionForward', 'NUMBER');
            table.string('features', 1028);
            table.string('iconID', 256);
            table.specificType('size', 'NUMBER');
            table.string('name', 256);
            table.string('partSource', 256);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('preferred3PrimeOverhangs', 256);
            table.string('preferred5PrimeOverhangs', 256);
        });

    }).then(function(){
        return knex.schema.createTable('preset', function(table){
            table.specificType('id', 'NUMBER');
            table.string('presetName', 256);
            table.string('j5parameters', 256);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('project', function(table){
            table.increments('id').primary();
            table.string('name', 256);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('protein', function(table){
            table.increments('id').primary();
            table.string('FQDN', 512);
            table.string('hash', 256);
            table.specificType('circular', 'NUMBER');
            table.string('description', 512);
            table.specificType('size', 'NUMBER');
            table.string('name', 256);
            table.text('sequence');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('shared_repo', 400);
        });

    }).then(function(){
        return knex.schema.createTable('protein_feature', function(table){
            table.increments('id').primary();
            table.string('name', 256);
            table.string('type', 128);
            table.specificType('start', 'NUMBER');
            table.specificType('end', 'NUMBER');
            table.string('notes', 4000);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.specificType('prot_feature_type_id', 'NUMBER');
        });

    }).then(function(){
        return knex.schema.createTable('protein_segment', function(table){
            table.increments('id').primary();
            table.specificType('startPosition', 'NUMBER');
            table.specificType('length', 'NUMBER');
            table.string('role', 400);
        });

    }).then(function(){
        return knex.schema.createTable('protocol', function(table){
            table.increments('id').primary();
            table.string('author', 256);
            table.text('htmlContent');
            table.string('assemblyMethods', 4000);
            table.string('name', 256);
            table.specificType('version', 'NUMBER');
            table.string('contact', 256);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('role', function(table){
            table.increments('id').primary();
            table.string('name', 400).notNullable();
            table.string('description', 2000);
        });

    }).then(function(){
        return knex.schema.createTable('segment_rel_type', function(table){
            table.increments('id').primary();
            table.string('code', 400).notNullable();
            table.string('name', 400);
            table.string('description', 4000);
        });

    }).then(function(){
        return knex.schema.createTable('segment_relationship', function(table){
            table.increments('id').primary();
            table.string('name', 400);
            table.string('description', 4000);
            table.string('type', 400).notNullable();
            table.timestamp('dateCreated').notNullable();
            table.timestamp('dateModified').notNullable();
        });

    }).then(function(){
        return knex.schema.createTable('seq_blacklist', function(table){
            table.specificType('id', 'NUMBER').notNullable();
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('seq_feature', function(table){
            table.increments('id').primary();
            table.string('name', 256);
            table.string('type', 128);
            table.specificType('start', 'NUMBER');
            table.specificType('end', 'NUMBER');
            table.specificType('strand', 'NUMBER');
            table.string('notes', 4000);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('sequence', function(table){
            table.increments('id').primary();
            table.string('FQDN', 512);
            table.string('hash', 256);
            table.specificType('circular', 'NUMBER');
            table.string('description', 512);
            table.specificType('size', 'NUMBER');
            table.string('name', 256);
            table.text('sequence');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('shared_repo', 400);
            table.string('type', 16);
            table.string('molecule_type', 400);
        });

    }).then(function(){
        return knex.schema.createTable('sequence_segment', function(table){
            table.increments('id').primary();
            table.string('role', 400);
            table.specificType('startPosition', 'NUMBER');
            table.specificType('length', 'NUMBER');
            table.specificType('strand', 'NUMBER');
            table.specificType('overhang5prime', 'NUMBER');
            table.specificType('overhang3prime', 'NUMBER');
        });

    }).then(function(){
        return knex.schema.createTable('strain', function(table){
            table.increments('id').primary();
            table.string('FQDN', 512);
            table.string('selectionMarkers', 1024);
            table.string('principalInvestigator', 512);
            table.string('intellectualProperty', 1024);
            table.string('references', 1024);
            table.string('summary', 4000);
            table.string('keywords', 512);
            table.string('genotype', 512);
            table.string('links', 512);
            table.string('parentStrain', 512);
            table.string('bioSafetyLevel', 512);
            table.string('status', 64);
            table.string('fundingSource', 512);
            table.string('creatorEmail', 256);
            table.string('creator', 256);
            table.string('alias', 256);
            table.string('name', 512);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('strain_plasmid', function(table){
            table.increments('id').primary();
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('test_knex_2', function(table){
            table.increments('id').primary();
            table.string('name', 400).notNullable();
            table.specificType('num', 'NUMBER');
            table.text('metadata');
            table.timestamp('dateCreated');
        });

    }).then(function(){
        return knex.schema.createTable('user', function(table){
            table.increments('id').primary();
            table.string('username', 256);
            table.string('password', 256);
            table.string('firstName', 256);
            table.string('lastName', 256);
            table.string('email', 256);
            table.string('activationCode', 256);
            table.string('groupName', 256);
            table.string('groupType', 256);
            table.date('lastAccess');
            table.specificType('debugAccess', 'NUMBER');
            table.specificType('verifiedEmail', 'NUMBER');
            table.specificType('activated', 'NUMBER');
            table.string('token', 256);
            table.string('middleName', 256);
            table.string('activeFlag', 1);
            table.string('phoneNumber', 64);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('userAccount', 256);
            table.text('userRestrictionEnzymeGroups');
        });

    }).then(function(){
        return knex.schema.createTable('user_role', function(table){
            table.increments('id').primary();
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('z_DE_bin', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('directionForward', 'NUMBER');
            table.specificType('dsf', 'NUMBER');
            table.specificType('fro', 'NUMBER');
            table.string('extra5PrimeBps', 256);
            table.string('extra3PrimeBps', 256);
            table.string('binName', 256);
            table.string('iconID', 256);
            table.specificType('devicedesign_id', 'NUMBER');
            table.specificType('DEIndex', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_DE_bin_cell', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('index', 'NUMBER');
            table.string('fas', 256);
            table.specificType('de_bin_id', 'NUMBER');
            table.specificType('part_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_access_control', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('acId', 'NUMBER');
            table.specificType('objectId', 'NUMBER');
            table.string('objectName', 50);
            table.specificType('userId', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_activity_log', function(table){
            table.increments('id').primary();
            table.string('objectName', 400);
            table.specificType('objectId', 'NUMBER');
            table.string('logSessionId', 50);
            table.string('logAction', 400);
            table.string('description', 4000);
            table.timestamp('dateLogged');
            table.specificType('recordsFetched', 'NUMBER');
            table.text('rawQuery');
        });

    }).then(function(){
        return knex.schema.createTable('z_custom_fields', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('objectId', 'NUMBER');
            table.string('objectName', 50);
            table.string('fieldName', 400);
            table.string('fieldValue', 4000);
            table.string('fieldDataType', 50);
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_custom_j5parameters', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 256);
            table.specificType('user_id', 'NUMBER');
            table.specificType('suppress_primer_annotations', 'NUMBER');
            table.specificType('suppress_pure_primers', 'NUMBER');
            table.specificType('hmlgy_max_fraction_mismatches', 'NUMBER');
            table.specificType('hmlgy_min_length_bps', 'NUMBER');
            table.string('output_seq_format', 256);
            table.specificType('mispriming_oligo_conc', 'NUMBER');
            table.specificType('mispriming_salt_conc', 'NUMBER');
            table.specificType('mispriming_min_tm', 'NUMBER');
            table.specificType('mispriming_3pbp_to_warn_if_hit', 'NUMBER');
            table.specificType('primer_dna_conc', 'NUMBER');
            table.specificType('primer_salt_corrections', 'NUMBER');
            table.specificType('primer_tm_santalucia', 'NUMBER');
            table.specificType('primer_pair_max_compl_end_th', 'NUMBER');
            table.specificType('primer_pair_max_compl_any_th', 'NUMBER');
            table.specificType('primer_max_self_end_th', 'NUMBER');
            table.specificType('primer_max_self_any_th', 'NUMBER');
            table.specificType('primer_max_diff_tm', 'NUMBER');
            table.specificType('primer_max_tm', 'NUMBER');
            table.specificType('primer_min_tm', 'NUMBER');
            table.specificType('primer_max_size', 'NUMBER');
            table.specificType('primer_min_size', 'NUMBER');
            table.specificType('primer_gc_clamp', 'NUMBER');
            table.specificType('dir_synth_min_cost_per_piece', 'NUMBER');
            table.specificType('dir_synth_cost_per_bp', 'NUMBER');
            table.specificType('min_pcr_product_bps', 'NUMBER');
            table.specificType('oligo_max_len_no_page_pur_bps', 'NUMBER');
            table.specificType('oligo_page_pur_cost_per_piece', 'NUMBER');
            table.specificType('oligo_synthesis_cost_per_bp', 'NUMBER');
            table.specificType('max_ids_ggate_overhangs_cmptbl', 'NUMBER');
            table.string('ggate_termini_extra_seq', 256);
            table.string('ggate_recognition_seq', 256);
            table.specificType('ggate_overhang_bps', 'NUMBER');
            table.specificType('min_fragment_size_gibson_bps', 'NUMBER');
            table.specificType('max_oligo_length_bps', 'NUMBER');
            table.specificType('gibson_overlap_max_tm', 'NUMBER');
            table.specificType('gibson_overlap_min_tm', 'NUMBER');
            table.specificType('gibson_overlap_bps', 'NUMBER');
            table.specificType('master_plasmid_num_of_digits', 'NUMBER');
            table.specificType('master_oligo_num_of_digits', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_dd_part', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('devicedesign_id', 'NUMBER');
            table.specificType('part_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_devicedesign', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 256);
            table.specificType('combinatorial', 'NUMBER');
            table.specificType('isCircular', 'NUMBER');
            table.specificType('user_id', 'NUMBER');
            table.specificType('project_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_eugene_rule', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('operand1_id', 'NUMBER');
            table.specificType('operand2_id', 'NUMBER');
            table.string('name', 256);
            table.string('originalRuleLine', 256);
            table.specificType('negationOperator', 'NUMBER');
            table.specificType('operand2IsNumber', 'NUMBER');
            table.specificType('operand2Number', 'NUMBER');
            table.string('compositionalOperator', 256);
            table.specificType('devicedesign_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_feature_type', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 400);
            table.string('description', 2000);
            table.specificType('user_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('code', 400);
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_group', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 400);
            table.string('description', 4000);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.specificType('user_id', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_group_data', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('group_id', 'NUMBER');
            table.specificType('objectId', 'NUMBER');
            table.specificType('objectName', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_group_project', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 400);
            table.string('description', 4000);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.specificType('user_id', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_group_project_data', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('group_project_id', 'NUMBER');
            table.specificType('objectId', 'NUMBER');
            table.string('objectName', 400);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_group_project_user', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('group_project_id', 'NUMBER');
            table.specificType('user_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_group_user', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('group_id', 'NUMBER');
            table.specificType('user_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_j5run', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('assemblyMethod', 256);
            table.string('assemblyType', 256);
            table.date('date');
            table.string('devicedesign_name', 256);
            table.date('endDate');
            table.string('name', 256);
            table.string('status', 256);
            table.specificType('user_id', 'NUMBER');
            table.specificType('devicedesign_id', 'NUMBER');
            table.text('clobTest');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
            table.string('clientTimeDiff', 256);
            table.specificType('project_id', 'NUMBER');
            table.specificType('staticProtocolId', 'NUMBER');
            table.text('results');
            table.text('j5output');
        });

    }).then(function(){
        return knex.schema.createTable('z_master', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
            table.text('masterDirectSynthesesList');
            table.text('masterOligoList');
            table.text('masterPlasmidList');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.specificType('user_id', 'NUMBER');
        });

    }).then(function(){
        return knex.schema.createTable('z_part', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('definitionHash', 64);
            table.string('FQDN', 512);
            table.specificType('genbankStartBP', 'NUMBER');
            table.specificType('endBP', 'NUMBER');
            table.specificType('revComp', 'NUMBER');
            table.specificType('directionForward', 'NUMBER');
            table.string('features', 1028);
            table.string('iconID', 256);
            table.specificType('size', 'NUMBER');
            table.string('name', 256);
            table.specificType('user_id', 'NUMBER');
            table.specificType('sequence_id', 'NUMBER');
            table.string('partSource', 256);
            table.string('preferred3PrimeOverhangs', 256);
            table.string('preferred5PrimeOverhangs', 256);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_preset', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('presetName', 256);
            table.string('j5parameters', 256);
            table.specificType('user_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_project', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 256);
            table.specificType('user_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_protein', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('FQDN', 512);
            table.string('hash', 256);
            table.specificType('circular', 'NUMBER');
            table.string('description', 512);
            table.specificType('size', 'NUMBER');
            table.specificType('user_id', 'NUMBER');
            table.string('name', 256);
            table.text('sequence');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
            table.string('shared_repo', 400);
        });

    }).then(function(){
        return knex.schema.createTable('z_protein_feature', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 256);
            table.string('type', 128);
            table.specificType('start', 'NUMBER');
            table.specificType('end', 'NUMBER');
            table.string('notes', 4000);
            table.specificType('prot_feat_type_id', 'NUMBER');
            table.specificType('protein_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_protein_segment', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('segment_relationship_id', 'NUMBER');
            table.specificType('startPosition', 'NUMBER');
            table.specificType('length', 'NUMBER');
            table.string('role', 400);
            table.specificType('protein_id', 'NUMBER');
            table.specificType('prot_feature_id', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_protocol', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('user_id', 'NUMBER');
            table.string('author', 256);
            table.text('htmlContent');
            table.string('assemblyMethods', 4000);
            table.string('name', 256);
            table.specificType('version', 'NUMBER');
            table.string('contact', 256);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_role', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 400);
            table.string('description', 2000);
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_segment_rel_type', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('code', 400);
            table.string('name', 400);
            table.string('description', 4000);
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_segment_relationship', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 400);
            table.string('description', 4000);
            table.string('type', 400);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.specificType('user_id', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_seq_blacklist', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('user_id', 'NUMBER');
            table.specificType('sequence_id', 'NUMBER');
            table.specificType('id', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('z_seq_feature', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('name', 256);
            table.string('type', 128);
            table.specificType('start', 'NUMBER');
            table.specificType('end', 'NUMBER');
            table.specificType('sequence_id', 'NUMBER');
            table.specificType('strand', 'NUMBER');
            table.string('notes', 4000);
            table.specificType('protein_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_sequence', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('FQDN', 512);
            table.string('hash', 256);
            table.specificType('circular', 'NUMBER');
            table.string('description', 512);
            table.specificType('size', 'NUMBER');
            table.specificType('user_id', 'NUMBER');
            table.string('name', 256);
            table.text('sequence');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
            table.string('shared_repo', 400);
            table.string('type', 16);
            table.string('molecule_type', 400);
        });

    }).then(function(){
        return knex.schema.createTable('z_sequence_segment', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('segment_relationship_id', 'NUMBER');
            table.specificType('sequence_id', 'NUMBER');
            table.string('role', 400);
            table.specificType('seq_feature_id', 'NUMBER');
            table.specificType('startPosition', 'NUMBER');
            table.specificType('length', 'NUMBER');
            table.specificType('strand', 'NUMBER');
            table.specificType('overhang5prime', 'NUMBER');
            table.specificType('overhang3prime', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_strain', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('FQDN', 512);
            table.string('selectionMarkers', 1024);
            table.string('principalInvestigator', 512);
            table.string('intellectualProperty', 1024);
            table.string('references', 1024);
            table.string('summary', 4000);
            table.string('keywords', 512);
            table.string('genotype', 512);
            table.string('links', 512);
            table.string('parentStrain', 512);
            table.string('bioSafetyLevel', 512);
            table.string('status', 64);
            table.string('fundingSource', 512);
            table.string('creatorEmail', 256);
            table.string('creator', 256);
            table.string('alias', 256);
            table.string('name', 512);
            table.specificType('user_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_strain_plasmid', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('strain_id', 'NUMBER');
            table.specificType('sequence_id', 'NUMBER');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
        });

    }).then(function(){
        return knex.schema.createTable('z_user', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.string('username', 256);
            table.string('password', 256);
            table.string('firstName', 256);
            table.string('lastName', 256);
            table.string('email', 256);
            table.string('activationCode', 256);
            table.string('groupName', 256);
            table.string('groupType', 256);
            table.date('lastAccess');
            table.specificType('debugAccess', 'NUMBER');
            table.specificType('verifiedEmail', 'NUMBER');
            table.specificType('activated', 'NUMBER');
            table.string('token', 256);
            table.string('middleName', 256);
            table.string('activeFlag', 1);
            table.string('phoneNumber', 64);
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
            table.string('userAccount', 256);
            table.text('userRestrictionEnzymeGroups');
            table.text('masterDirectSynthesesList');
            table.text('masterOligoList');
            table.text('masterPlasmidList');
        });

    }).then(function(){
        return knex.schema.createTable('z_user_role', function(table){
            table.increments('logId').primary();
            table.string('logSessionId', 50);
            table.specificType('id', 'NUMBER');
            table.specificType('user_id', 'NUMBER');
            table.specificType('role_id', 'NUMBER');
            table.string('logAction', 400);
            table.timestamp('dateLogged');
            table.timestamp('dateCreated');
            table.timestamp('dateModified');
        });

    }).then(function(){
        return knex.schema.createTable('z_winston', function(table){
            table.increments('id').primary();
            table.specificType('user_id', 'NUMBER');
            table.string('requestId', 100);
            table.string('level', 400);
            table.text('message');
            table.text('metadata');
            table.timestamp('dateLogged');
            table.string('channel', 400);
        });

    }).then(function(){
        return knex.schema.table("DE_bin", function(table){
            table.specificType('devicedesign_id', 'NUMBER').references('id').inTable('devicedesign');
        });
    }).then(function(){
        return knex.schema.table("DE_bin_cell", function(table){
            table.specificType('de_bin_id', 'NUMBER').references('id').inTable('DE_bin');
        });
    }).then(function(){
        return knex.schema.table("access_control", function(table){
            table.specificType('userId', 'NUMBER').notNullable().references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("custom_j5parameters", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("dd_part", function(table){
            table.specificType('devicedesign_id', 'NUMBER').references('id').inTable('devicedesign');
        });
    }).then(function(){
        return knex.schema.table("devicedesign", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("devicedesign", function(table){
            table.specificType('project_id', 'NUMBER').references('id').inTable('project');
        });
    }).then(function(){
        return knex.schema.table("eugene_rule", function(table){
            table.specificType('devicedesign_id', 'NUMBER').references('id').inTable('devicedesign');
        });
    }).then(function(){
        return knex.schema.table("group", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("group_data", function(table){
            table.specificType('group_id', 'NUMBER').notNullable().references('id').inTable('group');
        });
    }).then(function(){
        return knex.schema.table("group_project", function(table){
            table.specificType('user_id', 'NUMBER').notNullable().references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("group_project_data", function(table){
            table.specificType('group_project_id', 'NUMBER').notNullable().references('id').inTable('group_project');
        });
    }).then(function(){
        return knex.schema.table("group_project_user", function(table){
            table.specificType('group_project_id', 'NUMBER').notNullable().references('id').inTable('group_project');
        });
    }).then(function(){
        return knex.schema.table("group_project_user", function(table){
            table.specificType('user_id', 'NUMBER').notNullable().references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("group_user", function(table){
            table.specificType('group_id', 'NUMBER').notNullable().references('id').inTable('group');
        });
    }).then(function(){
        return knex.schema.table("group_user", function(table){
            table.specificType('user_id', 'NUMBER').notNullable().references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("import_data", function(table){
            table.specificType('import_operation_id', 'NUMBER').notNullable().references('id').inTable('import_operation');
        });
    }).then(function(){
        return knex.schema.table("import_file", function(table){
            table.specificType('import_operation_id', 'NUMBER').notNullable().references('id').inTable('import_operation');
        });
    }).then(function(){
        return knex.schema.table("import_log", function(table){
            table.specificType('import_operation_id', 'NUMBER').notNullable().references('id').inTable('import_operation');
        });
    }).then(function(){
        return knex.schema.table("import_log", function(table){
            table.specificType('import_data_id', 'NUMBER').references('id').inTable('import_data');
        });
    }).then(function(){
        return knex.schema.table("import_log", function(table){
            table.specificType('user_id', 'NUMBER').notNullable().references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("import_operation", function(table){
            table.specificType('user_id', 'NUMBER').notNullable().references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("j5run", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("part", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("part", function(table){
            table.specificType('sequence_id', 'NUMBER').references('id').inTable('sequence');
        });
    }).then(function(){
        return knex.schema.table("preset", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("project", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("protein", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("protein_feature", function(table){
            table.specificType('protein_id', 'NUMBER').references('id').inTable('protein');
        });
    }).then(function(){
        return knex.schema.table("protein_segment", function(table){
            table.specificType('segment_relationship_id', 'NUMBER').notNullable().references('id').inTable('segment_relationship');
        });
    }).then(function(){
        return knex.schema.table("protein_segment", function(table){
            table.specificType('protein_id', 'NUMBER').notNullable().references('id').inTable('protein');
        });
    }).then(function(){
        return knex.schema.table("protein_segment", function(table){
            table.specificType('prot_feature_id', 'NUMBER').references('id').inTable('protein_feature');
        });
    }).then(function(){
        return knex.schema.table("protocol", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("segment_relationship", function(table){
            table.specificType('user_id', 'NUMBER').notNullable().references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("seq_blacklist", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("seq_blacklist", function(table){
            table.specificType('sequence_id', 'NUMBER').references('id').inTable('sequence');
        });
    }).then(function(){
        return knex.schema.table("seq_feature", function(table){
            table.specificType('sequence_id', 'NUMBER').references('id').inTable('sequence');
        });
    }).then(function(){
        return knex.schema.table("seq_feature", function(table){
            table.specificType('protein_id', 'NUMBER').references('id').inTable('protein');
        });
    }).then(function(){
        return knex.schema.table("sequence", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("sequence_segment", function(table){
            table.specificType('segment_relationship_id', 'NUMBER').notNullable().references('id').inTable('segment_relationship');
        });
    }).then(function(){
        return knex.schema.table("sequence_segment", function(table){
            table.specificType('sequence_id', 'NUMBER').notNullable().references('id').inTable('sequence');
        });
    }).then(function(){
        return knex.schema.table("sequence_segment", function(table){
            table.specificType('seq_feature_id', 'NUMBER').references('id').inTable('seq_feature');
        });
    }).then(function(){
        return knex.schema.table("strain", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("strain_plasmid", function(table){
            table.specificType('strain_id', 'NUMBER').references('id').inTable('strain');
        });
    }).then(function(){
        return knex.schema.table("strain_plasmid", function(table){
            table.specificType('sequence_id', 'NUMBER').references('id').inTable('sequence');
        });
    }).then(function(){
        return knex.schema.table("user_role", function(table){
            table.specificType('user_id', 'NUMBER').notNullable().references('id').inTable('user');
        });
    }).then(function(){
        return knex.schema.table("user_role", function(table){
            table.specificType('role_id', 'NUMBER').notNullable().references('id').inTable('role');
        });
    }).then(function(){
        return knex.schema.table("z_activity_log", function(table){
            table.specificType('user_id', 'NUMBER').references('id').inTable('user');
        });
    });

};