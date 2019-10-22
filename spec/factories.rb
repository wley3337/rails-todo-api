FactoryBot.define do
    #example from docs : https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#configure-your-test-suite
    # factory :user do
    #   first_name { "John" }
    #   last_name  { "Doe" }
    #   admin { false }
    # end

    factory :user do 
      first_name { "Bob" }
      last_name { "Patt" }
      username { "Bob123" }
      password { "123" }
    end 

    factory :list do 
      user 
      heading { "Test List" }
      display_order { 1 }
    end 


    factory :to_do_1, class: ToDo do 
      list
      title { "first ToDo" }
      description { "date is: 1/1/2000" }
      due { DateTime.new(2000, 1, 1) }
    end 

    factory :to_do_2, class: ToDo do 
      list
      title { "Second ToDo" }
      description { "date is: 12/31/2000" }
      due { DateTime.new(2000, 12, 31) }
    end 

  end