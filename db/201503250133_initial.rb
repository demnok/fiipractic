Sequel.migration do

  change do

    create_table(:users) do
      primary_key :id, :type => Bignum
      String :name, :fixed => true
      String :email, :fixed => true
    end

    create_table(:recipes) do
      primary_key :id, :type => Bignum
      foreign_key :created_by, :users
      String :title
      String :body, :text => true
    end

  end

end
