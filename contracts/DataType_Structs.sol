pragma solidity ^0.4.25;

contract DataType_Structs {
    struct Student {
        string studentName;
        string gender;
        uint age;
    }

    Student[] students;

    function addStudent(string _name, string _gender, uint _age) public {
        students.push(Student(_name, _gender, _age));    //students 상태변수 배열에 새로운 Student 입력

        Student storage updateStudent = students[0];    //storage에 저장하는 새로운 Student 선언
                                                        //상태변수 students 배열의 첫번째 인덱스 값을 대입
                                                        //storage로 선언했기 때문에 상태변수를 가르키는 포인터 역할
        updateStudent.age = 55;       //updateStudent의 age 필드를 55로 변경
                                      //결과적으로 상태변수 students 배열의 첫번째 인덱스의 age 필드를 55로 변경한다
        Student memory updateStudent2 = students[0];    //memory에 저장하는 새로운 Student 선언
                                                        //상태변수 students 배열의 첫번째 인덱스 값을 대입
                                                        //memory로 선언됐기 때문에 복사한다.
        updateStudent2.age = 20;     //updateStudent2의 age 필드를 20으로 변경 
                                     //결과적으로 updateStudent2의 age필드만 변경하고 students 배열의 age필드는 변경되지 않는다                                                                                          
    }
}