class Backer
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        myoaths = ProjectBacker.all.select{|oath| oath.backer == self}
        myoaths.map{|oath| oath.project}
    end
end