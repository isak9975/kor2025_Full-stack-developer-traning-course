function func1(){console.log("func1 run")
    let btn1 = document.querySelector("#btn1");
    let input = document.querySelector("#input");

    btn1.setAttribute("style","display :none")
    input.setAttribute("style","block")
}


function func2(){console.log("func2 run")
    let btn1 = document.querySelector("#btn1");
    let btn2 = document.querySelector("#btn2");
    let input = document.querySelector("#input");
    let newinput = document.querySelector("#newinput").value;    

    document.querySelector("#name").textContent =  newinput

    input.setAttribute("style","display : none")    
}