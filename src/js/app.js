App = {
    web3Provider: null,
    contracts: {},

    initWeb3: function () {
        //metamask 설치여부 체크함
        if (typeof web3 !== 'undefined') {
          //web3Provier 전역변수에 공급자를 불러온다.
          //metamask가 설치되어 있으면 metamask를 web3 공급자로 사용
          App.web3Provider = web3.currentProvider;
          web3 = new Web3(App.web3Provider);
        } else {
          //metamask가 설치되어 있지 않으면 web3를 인스턴스화할 때 
          //필요한 공급자를 내 로컬 노드로(ganache) 대신 사용한다.
          App.web3Provider = new web3.provider.HttpProvider('http://localhost:8545');
          web3 = new Web3(App.web3Provider);
        }
        return App.initContract();
      },
    
      initContract: function() {
        //web3 가 스마트 컨트랙트 인스턴스를 찾을 수 있게  
        //스마트 컨트랙트를 인스턴스화 한다.
        //truffle에서 제공하는 library(truffle-contract.js)를 이용한다.
        //build 디렉토리의 RealEstate artifact 파일(ABI,컨트랙 배포된 주소)을 불러온다. 
        $.getJSON('Coursetro.json', function (data) {
          //읽은 data를 TruffleContract에 전달하여 컨트랙트를 인스턴스화 시킨다.
          App.contracts.Coursetro = TruffleContract(data);
          //App.web3Provider를 컨트랙트의 공급자로 설정한다.
          App.contracts.Coursetro.setProvider(App.web3Provider);
          return App.getInstructor();
        });
      },
      
      getInstructor: function() {
        App.contracts.Coursetro.deployed().then(function (instance) {
          return instance.getInstructor.call();
        }).then(function (result) {
            console.log(result);
            $("#instructor").html(web3.toUtf8(result[0])+' ('+result[1]+' years old)');
        }).catch(function (err) {
            console.log(err.message);
        })
      },
      
      setInstructor: function () {
          var name = $('#name').val();
          var age = $('#age').val();
          App.contracts.Coursetro.deployed().then(function (instance) {
            return instance.setInstructor(web3.toHex(name), age);
          }).then(function () {
            $('#name').val('');
            $('#age').val('');
            return App.getInstructor();
          }).catch(function (err) {
            console.log(err.message);
          })
      }
      
};

$(function () {
    $(window).load(function () {
        App.initWeb3();
    });
    $("#button").click(function () {
        App.setInstructor();
    });    
});    