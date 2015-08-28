require_relative('contact.rb')

class Rolodex
  @@id = 1

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, notes)
    contact = Contact.new(@@id, first_name, last_name, email, notes)
    @@id += 1

    @contacts << contact
  end

  def all
    @contacts
  end


  def modify_contact(mod_id, mod_info, new_info)

      selected_contact = @contacts.find do |contact|
       mod_id == contact.id
      end

     if mod_info == 1
       selected_contact.last_name = new_info
     elsif mod_info == 2
       selected_contact.first_name = new_info
     elsif mod_info == 3
       selected_contact.email = new_info
     elsif  mod_info == 4
       selected_contact.notes = new_info
     end
  
  end #end of method

  def display_contact(user_input_id)
      
      display_contact = @contacts.find do |contact|
      user_input_id == contact.id
     end
       puts "#{display_contact.id}: #{display_contact.full_name} / #{display_contact.email}"
      
  end
  def delete_contact(input_delete_id)
   delete_contact = @contacts.find do |contact|
                     input_delete_id == contact.id
                    end
    @contacts.delete(delete_contact)
    puts "The contact info of #{delete_contact.full_name} / #{delete_contact.email} has been deleted from the database."
 
  end

  def display_attribute_last_name
      @contacts.each do |contact|
      puts "#{contact.last_name}"
    end
  end

  def display_attribute_first_name
      @contacts.each do |contact|
      puts "#{contact.first_name}"
    end
  end

  def display_attribute_note
      @contacts.find do |contact|
      puts "#{contact.notes}"
    end

  end

  def display_attribute_email
      @contacts.each do |contact|
      puts "#{contact.email}"
    end

  end


end #end of class