document.addEventListener("DOMContentLoaded",(e)=>{
//톱니바퀴 아이콘
    let configID = document.querySelector("#id i")
//id값이 들어있는 텍스트
    let idText = document.querySelector("#id span")

//톱니바퀴 버튼을 눌렀을 때
    configID.addEventListener("click",(e)=>{
        idText.textContent = prompt("새로운 아이디를 입력하세요")
    })//end f

//프로필  편집 버튼
    let profileEditButton = document.querySelector("#profile_info button")
//이름
    let userInfo = document.querySelector("#userInfo")
//직업
    let summary= document.querySelector("#summary")
//사이트
    let profileDetail = document.querySelector("#profileDetail")

    let changing = false;

    profileEditButton.addEventListener("click",(e)=>{
        
        if(changing){
            let _userInfo =  userInfo.querySelector("input").value;
            
            let _summary = summary.querySelector("input").value;
            let _profileDetail = profileDetail.querySelector("input").value;

            userInfo.innerHTML = _userInfo
            summary.innerHTML = _summary

            if(_profileDetail.startsWith("https")){
                _profileDetail = "<a href=" + _profileDetail + ">" + _profileDetail + "<a>"
            }
            profileDetail.innerHTML = _profileDetail
            

            //버튼에 텍스트 수정
            e.target.textContent = "프로필 편집";
            changing = false;

        }else{
            //처음 들어왔을때 //input태그로 수정 //버튼 처음 눌렀을때
                //현재 프로필에 있는 값을 변수에 담아 놓기.
            let _userInfo = userInfo.textContent.trim();
            console.log(_userInfo)
            let _summary = summary.textContent.trim();
            console.log(_summary)
            let _profileDetail = profileDetail.textContent.trim();
            console.log(_profileDetail)

            //textContent : 문자열만 들어감(태그도 문자열 취급)
            //innerHTML : 태그는 태그로 작동한다.
            userInfo.innerHTML = `<input value=`+ _userInfo+ `>`
            summary.innerHTML = `<input value=`+ _summary + `>`
            profileDetail.innerHTML = `<input value=`+ _profileDetail+`>`

            //버튼에 텍스트 수정
            e.target.textContent = "프로필 편집 완료";
            changing = true;
        }
    })//end f

//프로필 사진 바꾸기
    let profile_pic = document.querySelector("#profile_pic .circle_pic")

    profile_pic.addEventListener("click",(e)=>{
            profile_pic.setAttribute("src",prompt("이미지 url을 입력해주세요"));

    })//end f

///프로필 사진 호버
    profile_pic.addEventListener("mouseover",(e)=>{
        e.target.style.filter = "grayscale(50%)";
    })//end f

    profile_pic.addEventListener("mouseleave",(e)=>{
        e.target.style.filter = "grayscale(0%)";
    })//end f



    

})//end class