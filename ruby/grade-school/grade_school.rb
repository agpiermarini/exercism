class School
  def initialize
    @roster = {}
  end

  def students(grade)
    @roster[grade] ? @roster[grade].sort : []
  end

  def add(student, grade)
    @roster[grade] ? @roster[grade] << student : @roster[grade] = [student]
  end

  def students_by_grade
    @roster.sort.map { | grade, students | { grade: grade, students: students.sort } }
  end
end

module BookKeeping
  VERSION = 3
end
