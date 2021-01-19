perval = 70;
typeval = 1;

function perfn1() {
        $('#50per').attr('class', 'btn btn-success');
        $('#70per').attr('class', 'btn btn-secondary');
        perval = 50;
}

function perfn2() {
        $('#70per').attr('class', 'btn btn-success');
        $('#50per').attr('class', 'btn btn-secondary');
        perval = 70;
}

function monfn() {
        $('#monbtn').attr('class', 'btn btn-success');
        $('#yearbtn').attr('class', 'btn btn-secondary');
        typeval = 1;
}

function yearfn() {
        $('#yearbtn').attr('class', 'btn btn-success');
        $('#monbtn').attr('class', 'btn btn-secondary');
        typeval = 12;
}

function changecalc() {         
        var burden = $("#cus_money option:selected").val();
        var joinmoney = 900;
        var paymoney1 = 30000;
        var paymoney2 = 1366;
        var paymoney3 = 7605;
        var paymoney4 = 9157;
        var paymoney5 = 269;
        var paymoney6 = 419;

        if (burden == "1man") {
                joinmoney *= 1.5;
                paymoney1 *= 1.5;
                paymoney2 *= 1.5;
                paymoney3 *= 1.5;
                paymoney4 *= 1.5;
        }

        if (burden == "2man") {
                joinmoney *= 1.25;
                paymoney1 *= 1.25;
                paymoney2 *= 1.25;
                paymoney3 *= 1.25;
                paymoney4 *= 1.25;
        }

        if (perval == 50) {
                /* joinmoney = joinmoney/3*2; */
                joinmoney *= 0.7;
                paymoney1 *= 0.7;
                paymoney2 *= 0.7;
                paymoney3 *= 0.7;
                paymoney4 *= 0.7;
        }

        var totalmoney = paymoney1;

        if ($("input:checkbox[id=gugang]").is(":checked") == true) {
                totalmoney += paymoney2;
        }
        if ($("input:checkbox[id=talgu]").is(":checked") == true) {
                totalmoney += paymoney3;
        }
        if ($("input:checkbox[id=skin]").is(":checked") == true) {
                totalmoney += paymoney4;
        }
        if ($("input:checkbox[id=funeral]").is(":checked") == true) {
                totalmoney += paymoney5;
        }
        if ($("input:checkbox[id=baesang]").is(":checked") == true) {
                totalmoney += paymoney6;
        }

        totalmoney *= typeval;
        var totaldiscount = totalmoney*0.9;

        if (typeval == 12) {
                $("#typeshow").text("연간");
        }s

        $("#join").text(Math.floor(joinmoney));
        $("#pay1").text(Math.floor(paymoney1));
        $("#pay2").text(Math.floor(paymoney2));
        $("#pay3").text(Math.floor(paymoney3));
        $("#pay4").text(Math.floor(paymoney4));
        $("#totalbefore").text(Math.floor(totalmoney));
        $("#total").text(Math.floor(totaldiscount));
}