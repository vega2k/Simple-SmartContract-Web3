pragma solidity ^0.4.25;
contract Storage_Memory {
    uint[] ages;            //storage   
                            //[11,22,33]
    function learnDataLocation(uint[] newAges) public returns(uint a) {
        ages = newAges;     //newAges 배열을 ages 배열에 복사 ages 값 [11,22,33]
        
        uint16 myAge = 44;  //기본값 타입은(int,uint,bool) 로컬변수로 사용될때 memory
        
        uint[] studentAges = ages;  //배열타입이 로컬변수로 사용될 때는 storage
                                    //studentAges는 ages를 가리키는 포인터
                                    //studentAges 값은 [11,22,33]
                                    
        studentAges[0] = myAge;     //studentAges 배열의 첫번째 인덱스의 값을 44로 바꿈
                                    //studentAges 값 [44,22,33]
                                    //ages 값 [44,22,33]
                                    
        a = studentAges[0];         //44를 리턴변수에 대입, a는 memory                            
        return a;     
    }
}