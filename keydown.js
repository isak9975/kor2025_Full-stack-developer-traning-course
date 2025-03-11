document.addEventListener("DOMContentLoaded",
    function(e){
        //브라우저에서 값을 입력하는 과정
        //키 눌림 -> 그게 어떤 값인지 계산함 -> 해당  값을 화면에 표시함
        //따라서 우리가 a를 누르는 타이밍에는 아직 브라우저의 input태그 
        //내부에는 입력되지 않은 상태이다.

        //한박자 늦게 나오는데 왜 쓰냐
        //사용자가 뭘 입력하는지가 중요한게 아니라, 입력을 하고 있는 행위 
        //자체를 감지할 수 있다는 장점이 있다.
        //웹 페이지에 단축키 긴으을 제공할 수 있다.
        let keydown = document.querySelector("#keydown")
        keydown.addEventListener("keydown",
            //e : 발생한 이벤트
            function(e){
                //e.target.value : 이벤트가 발생한 타겟의 값
                //e.key : 내가 누른 키
                console.log(e.key);
                if(e.key === 'q'){
                    alert("This is Q!")
                }
            }
        )
    }
)//end don