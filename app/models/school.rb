class School < ActiveRecord::Base
  has_many :standards
  has_many :sections, through: :standards
  has_many :roles
  has_many :users
  validates :name, :sub_domain,  presence:true

  def self.import( file ,file2)
    error_line = 0
    status_hash = ''

    School.transaction do
      csv_text = File.read(file.path)
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        error_line = error_line + 1
        school_hash = row.to_hash
        a = School.new( name: school_hash['name'], sub_domain: school_hash['sub_domain'] )

        if a.valid?
          a.save
          standards = row[2].split(',')
          standards.each do |name|
            b = a.standards.new(name: name)
            if  b.valid?
              b.save
              sections = row[3].split(',')
              sections.each do |sec|
                section = b.sections.new(name: sec)
                if section.valid?
                  section.save
                else
                  error = "section cannot be empty in row #{error_line} on ur 1st csv file"
                  raise error
                end
              end
            else
              error = "standard cannot be empty in row #{error_line} on ur 1st csv file"
              raise error
            end
          end
        else

          error = "school cannot be empty in row #{error_line} on ur 1st csv file"
          raise  error
        end
      end




      CSV.foreach(file2.path, headers: true) do |row|
        value = row.to_hash
        school = School.find_by( value.slice('SchoolSubDomain') )
        section = school.sections.find_by( value.slice('SectionName') )
        student = section.students.new( value.slice( 'AdmissionNumber', 'RollNumber', 'StudentName', 'Gender', 'DateOfBirth') )
        if student.valid?
          student.save
          parent = Parent.new( value.slice( 'FatherName', 'FatherEmail', 'FatherMobile', 'MotherName', 'MotherEmail', 'MotherMobile','Address').merge(student_id:student.id ))

          if parent.valid?

            parent.save
          else
            error = parent.errors.full_messages
          raise error
          end
        else
          error = "the student name cannot be empty in line #{error_line}"
          raise error
        end
      end
    end
    status_hash = { status:true,message:'successfully processed' }
  rescue StandardError => e
    status_hash = { status:false,message: e.message}
  ensure
    status_hash
  end






  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |school|
        csv << school.attributes.values_at(*column_names)
      end
    end
  end

end
