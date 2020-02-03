# When a Backer instance is initialized, it should be initialized with a name.

# When a Project instance is initialized, it should be initialized with a title.

# When a ProjectBacker instance is initialized, it should be initialized with a Project instance and a Backer instance.

# The ProjectBacker class is maintaining the relationship. It should have an @@all class variable. When an instance is initialized, it should be stored in this variable.

# The ProjectBacker class should also have a class method .all that returns the @@all class variable.

# Once both classes have their attributes and readers set up, write an instance method on the Backer class called back_project that takes in a Project instance. This method should create a ProjectBacker instance using the provided Project instance and the current Backer instance (the instance this method was called on).

# Similarly, write a method on the Project class called add_backer that takes in a Backer instance and creates a ProjectBacker using the Backer instance and the current Project instance.

# With back_project set up, the final step for the Backer class is to build an instance method that returns all the projects associated with this Backer instance. Since Project instances are not directly associated with Backer instances, you will need to get this information _through the ProjectBacker class.

# For the Project class, write a similar method, backers, that returns all backers associated with this Project instance.

class Project
    attr_accessor :title
    @@all = []
    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        oaths = ProjectBacker.all.select{|oath| oath.project == self}
        oaths.map{|oath| oath.backer}
    end
end