create index "part_sequence_idx" on "part" ("sequence_id");

alter index "part_sequence_idx" rebuild;