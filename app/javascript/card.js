const pay = () =>{
  Payjp.setPublicKey('pk_test_50f1821cf52140eb68b6d656');

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formCard = document.getElementById("charge-form");
    const formData = new FormData(formCard);

    const card = {
      number: formData.get("order_address[number]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      cvc: formData.get("order_address[cvc]")
    };

    Payjp.createToken(card, (status, response)=>{
      if (status == 200){
        const token = response.id;
        const inHtml = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name = 'token' type = 'hidden'>`;
        inHtml.insertAdjacentHTML("beforeend", tokenObj);
      };

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");


      document.getElementById("charge-form").submit();
     });
  });
};

window.addEventListener("load", pay)