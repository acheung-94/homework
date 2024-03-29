class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end

class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
    snack_box.methods.grep(/^get_(.*)_info$/) { MetaCorgiSnacks.define_snack $1 }
  end

  # def method_missing(name, *args)
  #   # Your code here
  #   get_snack = "get_#{name}"
  #   get_info = "#{get_snack}_info"
  #   get_taste = "#{get_snack}_tastiness"

  #   info = @snack_box.send(get_info, @box_id)
  #   taste = @snack_box.send(get_taste, @box_id)

  #   output = "#{name}: #{info}: #{taste}"
  #   taste > 30 ? "* #{output}" : output
  # end
  
  def self.define_snack(name)
    # Your code here
    define_method(name) do 
      get_info = "get_#{name}_info"
      get_taste = "get_#{name}_tastiness"
      info = @snack_box.send(get_info, @box_id)
      taste = @snack_box.send(get_taste, @box_id)
      p "#{name.capitalize}: #{info}: #{taste}"
      #define_method(name) { puts "#{name.capitalize}: #{info}: #{taste}"}
    end
  end
  # define_snack(:bone)
  # define_snack(:kibble)
  # define_snack(:treat)

end

# class Dog
#   # defines a class method that will define more methods; this is
#   # called a **macro**.

#   def self.makes_sound(name)
#     define_method(name) { puts "#{name}!" }
#   end

#   makes_sound(:woof)
#   makes_sound(:bark)
#   makes_sound(:grr)
# end
