class DropTables < ActiveRecord::Migration[6.0]
	def up
		drop_table :Rows
		drop_table :Execute
		drop_table :Change_Request
	end
	def down
		raise ActiveRecord::IrreversibleMigration
	end
end
