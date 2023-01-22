function add_to_cart(pid, pname, price)
{

    let cart = localStorage.getItem("cart");
    if (cart == null)
    {
        //no cart yet  
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
//        console.log("Product is added for the first time")
        showToast("Item is added to cart")
    } else
    {
        //cart is already present
        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pid)
        console.log(oldProduct)
        event.currentTarget.classList.remove("card-btn");
        event.currentTarget.innerHTML = `<svg width="31" height="30" viewBox="0 0 31 30" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect x="0.631854" y="0.411883" width="29.1772" height="29.1762" rx="13.5921" stroke="#E2E2E2" stroke-width="0.823767"/>
<path d="M20.8042 15C20.8042 15.2469 20.7095 15.4855 20.5325 15.6583C20.3596 15.8353 20.1209 15.934 19.8739 15.934H16.1528V19.6538C16.1528 19.9007 16.054 20.1393 15.877 20.3121C15.7041 20.485 15.4695 20.5837 15.2225 20.5837C14.9755 20.5837 14.7368 20.485 14.5639 20.3121C14.3869 20.1393 14.2881 19.9007 14.2881 19.6538V15.934H10.567C10.32 15.934 10.0813 15.8353 9.90839 15.6583C9.73551 15.4855 9.63672 15.2469 9.63672 15C9.63672 14.7531 9.73551 14.5186 9.90839 14.3416C10.0813 14.1688 10.32 14.07 10.567 14.07H14.2881V10.3503C14.2881 10.1034 14.3869 9.86477 14.5639 9.69195C14.7368 9.51501 14.9755 9.41626 15.2225 9.41626C15.4695 9.41626 15.7041 9.51501 15.877 9.69195C16.054 9.86477 16.1528 10.1034 16.1528 10.3503V14.07H19.8739C20.1209 14.07 20.3596 14.1688 20.5325 14.3416C20.7095 14.5186 20.8042 14.7531 20.8042 15Z" fill="#53B175"/>
</svg>
`;
        if (oldProduct)
        {
            //we have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1
            pcart.map((item) => {

                if (item.productId === oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }

            })
            event.currentTarget.parentElement.querySelector('.cart-quantity').innerText = oldProduct.productQuantity;
            event.currentTarget.parentElement.querySelector('.cart-quantity').style.display = 'unset';
            event.currentTarget.parentElement.querySelector('.card-subtract').style.display = 'unset';
            localStorage.setItem("cart", JSON.stringify(pcart));
            showToast(oldProduct.productName + " quantity is increased , Quantity = " + oldProduct.productQuantity)

        } else
        {
            //we have add the product
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            pcart.push(product)
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added")
            showToast("Product is added to cart")
            event.currentTarget.parentElement.querySelector('.cart-quantity').innerText = 1;
            event.currentTarget.parentElement.querySelector('.cart-quantity').style.display = 'unset';
            event.currentTarget.parentElement.querySelector('.card-subtract').style.display = 'unset';

        }


    }


    updateCart();

}

function sub_to_cart(pid, pname, price)
{

    let cart = localStorage.getItem("cart");
    if (cart == null || cart.length == 0)
    {
        //no cart yet  
//        let products = [];
//        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
//        products.push(product);
//        localStorage.setItem("cart", JSON.stringify(products));
////        console.log("Product is added for the first time")
        showToast("Cart is empty");

    } else
    {
        //cart is already present
        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pid)
        console.log(oldProduct)
        if (oldProduct && oldProduct.productQuantity > 1)
        {
            //we have to decrease the quantity
            oldProduct.productQuantity = oldProduct.productQuantity - 1
            pcart.map((item) => {

                if (item.productId === oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }

            })
            event.currentTarget.parentElement.querySelector('.cart-quantity').innerText = oldProduct.productQuantity;
            localStorage.setItem("cart", JSON.stringify(pcart));
            showToast(oldProduct.productName + " quantity is decreased , Quantity = " + oldProduct.productQuantity)

        } else {
            deleteItemFromCart(pid);
            event.currentTarget.parentElement.querySelector('.cart-quantity').innerText = 0;
            event.currentTarget.parentElement.querySelector('.cart-quantity').style.display = 'none';
            event.currentTarget.style.display = 'none';
            event.currentTarget.parentElement.lastElementChild.classList.add("card-btn");
            event.currentTarget.parentElement.lastElementChild.innerHTML = `<svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_57_1285)">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 10.5C3.5 9.94772 3.94772 9.5 4.5 9.5C5.05228 9.5 5.5 9.94772 5.5 10.5C5.5 11.0523 5.05228 11.5 4.5 11.5C3.94772 11.5 3.5 11.0523 3.5 10.5Z" fill="white"/>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M9 10.5C9 9.94772 9.44772 9.5 10 9.5C10.5523 9.5 11 9.94772 11 10.5C11 11.0523 10.5523 11.5 10 11.5C9.44772 11.5 9 11.0523 9 10.5Z" fill="white"/>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M0 0.5C0 0.223858 0.223858 0 0.5 0H2.5C2.73831 0 2.94351 0.168193 2.99028 0.401872L3.41022 2.5H11.5C11.649 2.5 11.7903 2.56646 11.8852 2.68128C11.9802 2.79609 12.0191 2.94729 11.9911 3.09366L11.1904 7.29241C11.1219 7.63771 10.934 7.94788 10.6598 8.16863C10.3869 8.38829 10.0458 8.50548 9.69568 8.5H4.84432C4.49419 8.50548 4.1531 8.38829 3.88024 8.16863C3.60612 7.94797 3.41832 7.63796 3.34966 7.29283C3.34964 7.29269 3.34969 7.29297 3.34966 7.29283L2.51439 3.1196C2.51101 3.1058 2.50819 3.09177 2.50598 3.07754L2.09016 1H0.5C0.223858 1 0 0.776142 0 0.5ZM3.61036 3.5L4.33042 7.09759C4.35328 7.21269 4.4159 7.31608 4.50731 7.38967C4.59872 7.46325 4.71309 7.50234 4.83042 7.50009L4.84 7.5H9.7L9.70958 7.50009C9.82691 7.50234 9.94129 7.46325 10.0327 7.38967C10.1237 7.31642 10.1861 7.21365 10.2093 7.0992L10.8956 3.5H3.61036Z" fill="white"/>
                                    </g>
                                    <defs>
                                    <clipPath id="clip0_57_1285">
                                        <rect width="12" height="12" fill="white"/>
                                    </clipPath>
                                    </defs>
                                    </svg>
                                    Add to Cart`;
        }


    }


    updateCart();

}

//update cart:
window.addEventListener('storage', function (e) {
    console.log(e.key, e.oldValue, e.newValue);
});


function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0)
    {
        console.log("Cart is empty !!")
        $(".cart-items").html("0");
        $(".cart-body").html("<h3>Cart does not have any items </h3>");
        $(".checkout-btn").attr('disabled', true)
    } else
    {


        //there is some in cart to show
        console.log(cart)
        $(".cart-items").html(`${cart.length}`);
        let table = `
            <table class='table'>
            <thead class='thread-light'>
                <tr>
                <th>Item Name </th>
                <th>Price </th>
                <th>Quantity </th>
                <th>Total Price </th>
                <th>Action</th>
                
        
                </tr>
        
            </thead>

        


            `;

        let totalPrice = 0;
        cart.map((item) => {


            table += `
                    <tr>
                        <td> ${item.productName} </td>
                        <td> ${item.productPrice} </td>
                        <td> ${item.productQuantity} </td>
                        <td> ${item.productQuantity * item.productPrice} </td>
                        <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button> </td>    
                     </tr>
                 `

            totalPrice += item.productPrice * item.productQuantity;
        })




        table = table + `
            <tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalPrice} </td></tr>
         </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false)
        console.log("removed")

    }

}

function orderPlaced()
{
    let cartString = localStorage.getItem("cart");
    let walletAmount = localStorage.getItem("wallet");
    let cart = JSON.parse(cartString);
    let totalPrice = 0;
    cart.map((item) => {
        totalPrice += item.productPrice * item.productQuantity;
    });
    if (cart == null || cart.length == 0 || walletAmount == 0 || walletAmount < totalPrice)
    {
        console.log("Cannot Place the order!!")
        $(".payment-body").html(`Not enough balance in the wallet. Please add minimum ₹ ${totalPrice - walletAmount}.`);
        if (localStorage.getItem("wallet") && document.querySelector('.current-balance')) {

            document.querySelector('.current-balance').innerHTML = `<b>Current Balance:</b> ₹ ${localStorage.getItem("wallet")}`;
        }
//        $(".cart-body").html("<h3>Cart does not have any items </h3>");
    } else
    {


        //there is some in cart to show
        console.log(cart)
        walletAmount -= totalPrice;
        localStorage.setItem("wallet", walletAmount);
        document.querySelector(".payment-body").innerHTML = `<img src="img/confirmicon.png" /> <h1>Your Order has been accepted!</h1><p>Delivery in 24 hours.</p><br/><p>Wallet Amount Remaining: ${walletAmount}</p>`;
        if (localStorage.getItem("wallet") && document.querySelector('.current-balance')) {

            document.querySelector('.current-balance').innerHTML = `<b>Current Balance:</b> ₹ ${localStorage.getItem("wallet")}`;
        }
        cart.map((item) => {
            deleteItemFromCart(item.productId);
        });

    }

}


//delete item 
function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));

    let newcart = cart.filter((item) => item.productId != pid)

    localStorage.setItem('cart', JSON.stringify(newcart))

    updateCart();

    showToast("Item is removed from cart ")

}

function addBalance() {
    let amountAdded = document.querySelector('#walletForm input').value;
    if (localStorage.getItem("wallet")) {
        let oldValue = localStorage.getItem("wallet");
        let newValue = parseInt(amountAdded) + parseInt(oldValue);
        localStorage.setItem("wallet", newValue);
        if (localStorage.getItem("wallet") && document.querySelector('.current-balance')) {
            document.querySelector('.current-balance').innerHTML = `<b>Current Balance:</b> ₹ ${localStorage.getItem("wallet")}`;
        }
    }
}


$(document).ready(function () {
    if (localStorage.getItem("wallet")) {
        console.log("Already present");
        if (document.querySelector('.current-balance')) {

            document.querySelector('.current-balance').innerHTML = `<b>Current Balance:</b> ₹ ${localStorage.getItem("wallet")}`;
        }
    } else {
        localStorage.setItem("wallet", 0);
    }
    updateCart()
})


function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}


function goToCheckout() {

    window.location = "checkout.jsp"

}

function goToPayment() {
    window.location = "payment.jsp"
}