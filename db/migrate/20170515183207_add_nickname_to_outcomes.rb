class AddNicknameToOutcomes < ActiveRecord::Migration[5.0]
  def change
    add_column :standard_outcomes, :nickname, :string
    add_column :outcomes, :nickname, :string

    reversible do |dir|
      dir.up do
        mapping = {
          a: 'Science and Engineering',
          b: 'Experimentation',
          c: 'Design',
          d: 'Teamwork',
          e: 'Problem Solving',
          f: 'Ethics',
          g: 'Communication',
          h: 'Broad Education',
          i: 'Life-long Learning',
          j: 'Contemporary Issues',
          k: 'Modern Practice',
        }

        mapping.each do |name, nickname|
          execute <<-SQL
            UPDATE standard_outcomes
            SET nickname = '#{nickname}'
            WHERE name = '#{name}'
          SQL
        end

        execute <<-SQL
          UPDATE outcomes
          SET nickname = standard_outcomes.nickname
          FROM standard_outcomes
          WHERE standard_outcomes.description = outcomes.description
        SQL

        execute <<-SQL
          UPDATE outcomes
          SET nickname = outcomes.name
          WHERE nickname IS NULL
        SQL
      end
    end

    change_column_null :standard_outcomes, :nickname, false
    change_column_null :outcomes, :nickname, false

    add_index :standard_outcomes, :nickname, unique: true
    add_index :outcomes, [:course_id, :nickname], unique: true
  end
end
