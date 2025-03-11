//document 객체르 대상으로 이벤트 리스터 추가하기
//DOMContentLoaded : 문서의 콘텐츠 로딩이 완료됐을때 발생
document.addEventListener("DOMContentLoaded",
    function(e){
        //input 태그 선택하기
        let button = document.querySelector("input");
        //input 태그에 표준 이벤트 처리
        //"input" -> <input> 요소의 값이 변경될 때마다 발생
        button.addEventListener("input",
            function(e){
            console.log(e.target.value);
            }
        )
    }
)

//1) 스크립트를  body안에 사용하던가
//2) 인라인 함수를 사용하던가
//3) DOMContentLoaded 사용하던가


//================================================================================================
//<p> 태그에서 인라인 이벤트 모델로 호출할 함수를 정의
function hi(){
    alert("hi")
}