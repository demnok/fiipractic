Sequel.migration do

  change do

    self[:users].insert(:name => 'Florin', :email => 'florin.asavoaie@tss-yonder.com')
    self[:users].insert(:name => 'Alexandra', :email => 'alexandra.birsan@tss-yonder.com')

    self[:recipes].insert(
      :created_by => self[:users].select(:id).where(:email => 'florin.asavoaie@tss-yonder.com'),
      :title => 'Bors de peste',
      :body => 'Se ia un peste si se pune la fiert.')

  end

end
