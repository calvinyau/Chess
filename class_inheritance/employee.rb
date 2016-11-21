class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    self.employee_assigner
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def employee_assigner
    @boss.add_employee(self) unless @boss.nil?
  end

end
