% --- Knowledge Base ---

% student(Name, RollNo).
student(karthik, 101).
student(priya, 102).
student(rahul, 103).

% teacher(Name, EmpID).
teacher(suresh, t001).
teacher(meena, t002).

% subject(SubjectName, Code).
subject(maths, m101).
subject(physics, p102).
subject(ai, ai103).

% teaches(TeacherName, SubjectCode).
teaches(suresh, m101).
teaches(meena, p102).
teaches(meena, ai103).

% enrolled(StudentName, SubjectCode).
enrolled(karthik, m101).
enrolled(karthik, ai103).
enrolled(priya, p102).
enrolled(rahul, m101).
enrolled(rahul, p102).

% --- Rules ---

% Find which teacher teaches a subject
teacher_of(Subject, Teacher) :-
    subject(Subject, Code),
    teaches(Teacher, Code).

% Find which subjects a student is enrolled in
subjects_of_student(Student, Subject) :-
    enrolled(Student, Code),
    subject(Subject, Code).

% Find which students are taught by a teacher
students_of_teacher(Teacher, Student) :-
    teaches(Teacher, Code),
    enrolled(Student, Code).
