defmodule CustomIdTest.Repo.Migrations.CreateEntryFragment do
  use Ecto.Migration

  def change do
    execute("CREATE SEQUENCE my_sequence")

     execute("""
      CREATE OR REPLACE FUNCTION id_generator(OUT result bigint) AS $$
      DECLARE
          our_epoch bigint := 1314220021721;
          seq_id bigint;
          now_millis bigint;
          shard_id int := 5;
      BEGIN
          -- there is a typo here in the online example, which is corrected here
          SELECT nextval('my_sequence') % 1024 INTO seq_id;

          SELECT FLOOR(EXTRACT(EPOCH FROM clock_timestamp()) * 1000) INTO now_millis;
          result := (now_millis - our_epoch) << 23;
          result := result | (shard_id << 10);
          result := result | (seq_id);
      END;
      $$ LANGUAGE PLPGSQL;
      """)

    create table(:entry_fragment,  primary_key: false) do
      add :id, :bigint, primary_key: true, default: fragment("id_generator()")
      # Just to have something to fill the row
      add :entry, :string
    end
  end
end
