pragma solidity ^0.4.25;

contract DataType_Arrays {
    uint[] myArray;
    uint8[3] d = [1, 2, 3];     //함수 외부에서 리터털로 배열을 초기화 가능

    function learnArrays() public {
        //배열은 지역변수로 사용되면 자동으로 storage 이지만 데이터 위치를 memory로 변경함
        uint256[] memory a = new uint256[](5);
        bytes32[] memory b = new bytes32[](10);

        a[0] = 1;   //a 배열 첫번째 인덱스 값에 숫자 1 대입
        a[1] = 2;    //a 배열 두번째 인덱스 값에 숫자 2 대입

        uint8[3] memory c = [1, 2, 3];    //함수안에서 리터털을 통해 배열 초기화 할때 저장위치 memory
        uint8[3] d = [1, 2, 3];   //함수 내부에서 리터럴을 통해 초기화 하면 저장 위치 memory 않써주어서 에러발생

        myArray.push(5);    //상태변수 myArray 배열에 push()를 사용해서 마지막에 5를 저장
        uint myArrayLength = myArray.length;    //myArray 배열의 길이 확인

    }
}