class Manager < Employee
  attr_reader :employee_list

  def initialize(name, title, salary, boss, employee_list = [])
    @employee_list = employee_list
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    total = 0
    employee_list.each do |employee1|
      if employee1.is_a?(Manager)
        total += employee1.salary * multiplier + employee1.bonus(multiplier)
      else
        total += employee1.bonus(multiplier)
      end
    end
    total
  end

  def add_employee(employee)
    employee_list << employee
  end
end
