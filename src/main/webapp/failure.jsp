<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    <title>Failure/Error</title>
</head>
<style>
    body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
    }
    h1 {
        color: #903415;
        font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
        font-weight: 900;
        font-size: 40px;
        margin-bottom: 10px;
    }
    h2 {
        color: #903415;
        font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
        font-weight: 600;
        font-size: 30px;
        margin-bottom: 10px;
    }
    p {
        color: #903415;
        font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
        font-size:20px;
        margin: 0;
    }
    i {
        color: #903415;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
    }
    .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
    }
</style>
<body>
<div class="card">
    <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <i class="checkmark">x</i>
    </div>
    <h1>FAILURE !!!</h1>
    <h2>There is some issue with the processing !!!!</h2>
    <p><%=session.getAttribute("errorMessage")%></p>
    <h2><a href="index.html">Return to Dashboard</a></h2>
</div>
</body>
</html>