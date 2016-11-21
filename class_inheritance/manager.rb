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


    # total * multiplier
  end

  def add_employee(employee)
    employee_list << employee
  end
end
# total = 0
# return 0 if employee_list.nil? || employee_list.empty?
# employee_list.each do |employee|
#   total += employee.salary * multiplier if employee_list
#   total += employee.bonus(multiplier)

# end
# total
