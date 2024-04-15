const express = require("express");
var bodyParser = require("body-parser");
const app = express();
const port = 5000;
app.use(bodyParser.urlencoded({ extended: false }));

var session = require("express-session");
app.use(
  session({
    secret: "webslesson",
    resave: true,
    saveUninitialized: true,
  })
);
//khai bao sử dụng template ejs
app.set("view engine", "ejs");
app.set("views", "./views");
app.use(express.static("./public"));
app.use(express.static(__dirname + "/public"));
//querystringthư viện (khi false) hoặc qsthư viện (khi true).

var mysql = require("mysql"); // nhúng module mysql vào trang
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "apple", //tên database muốn kết nối
});
app.get("/", (req, res) => {
  let sql = "SELECT id, tenLoai from loai";
  let sqlApple = "SELECT id, tenSP, moTa, urlHinh, gia, giaCu from product";
  db.query(sql, function (err, listLoai) {
    if (err) throw err;
    db.query(sqlApple, function (err, listApple) {
      if (err) throw err;
      res.render("shop", { loaiApple: listLoai, listApple: listApple });
    });
  });
});

app.get("/product/:productId", (req, res) => {
  // thiếu dấu /
  let id = req.params.productId;
  let sql = `SELECT * from loai`;
  db.query(sql, function (err, listLoai) {
    if (err) throw err;
    let sqlApple = `SELECT * from product WHERE  idLoai = ${id}`;
    db.query(sqlApple, function (err, listApple) {
      res.render("shop", { loaiApple: listLoai, listApple: listApple });
    });
  });
});
app.get("/productdetail/:id", (req, res) => {
  // thiếu detail
  let id = req.params.id;
  let sql = `SELECT * from loai`;
  db.query(sql, function (err, listLoai) {
    if (err) throw err;
    let sqlApple = `SELECT * from product WHERE  id = ${id}`;
    db.query(sqlApple, function (err, data) {
      res.render("productdetail", {
        loaiApple: listLoai,
        productdetail: data[0],
      });
    });
  });
});
app.get("/admin", (req, res, next) => {
  res.render("admin/home", { session: req.session });
});

app.get("/admin/list", (req, res) => {
  let sqlLoai = "select id, tenLoai from loai";
  db.query(sqlLoai, (err, listLoai) => {
    if (err) throw err;
    let sqlSP = "select id, tenSP, moTa, urlHinh, gia, giaCu from product";
    db.query(sqlSP, (err, listSP) => {
      res.render("admin/list-product", { loaiSP: listLoai, listSP: listSP });
    });
  });
});
app.get("/admin/add-product", (req, res) => {
  res.render("admin/add-product");
});

var multer = require("multer");
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./public/images");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});
var upload = multer({ storage: storage });
app.post("/admin/add-product", upload.single("urlHinh"), (req, res) => {
  const file = req.file;
  let tenSP = req.body.tenSP;
  let gia = req.body.gia;
  let moTa = req.body.moTa;
  let hinhsp = file.filename;
  product = {
    tenSP: tenSP,
    gia: gia,
    moTa: moTa,
    urlHinh: hinhsp,
  };

  db.query("insert into product SET ?", product, function (err, data) {
    if (err) throw err;
    let sqlLoai = "select id, tenLoai from loai";
    db.query(sqlLoai, (err, listLoai) => {
      if (err) throw err;
      let sqlSP = "select id, tenSP, moTa, urlHinh, gia, giaCu from product";
      db.query(sqlSP, (err, listSP) => {
        res.render("admin/list-product", { loaiSP: listLoai, listSP: listSP });
      });
    });
  });
});
// xóa dlieu
app.get("/del/:id", (req, res) => {
  let id = req.params.id;
  db.query("DELETE FROM product WHERE id = ?", [id], function (err, data) {
    if (err) throw err;
    if (data.affectedRows == 0)
      console.log(`Không có id product để xóa: ${id}`);
    res.redirect("/admin/list");
  });
});
//update

app.get("/update/:id", function (req, res, next) {
  let id = req.params.id;
  let sql = `SELECT * FROM product where id=${id}`;
  db.query(sql, function (err, listSP) {
    res.render("./admin/edit", { product: listSP });
  });
});
app.post("/updateD/:id", upload.single("urlHinh"), (req, res) => {
  let id = req.params.id;
  const hinhsp = req.file ? req.file.filename : null;
  let tenSP = req.body.tenSP;
  let gia = req.body.gia;
  let moTa = req.body.moTa;

  product = {
    tenSP: tenSP,
    gia: gia,
    moTa: moTa,
    urlHinh: hinhsp,
  };
  db.query(
    `UPDATE product SET ? WHERE id = ${id}`,
    product,
    function (err, data) {
      if (err) throw err;
      if (data.affectedRows == 0) {
        console.log(`Không có id  để cập nhật: ${id}`);
      }
      res.redirect("/admin/list");
    }
  );
});
app.get("/login", (req, res) => {
  app.post("/login", function (req, res) {
    const username = req.body.username;
    const password = req.body.password;

    connection.query(
      "SELECT * FROM user WHERE username = ? AND password = ?",
      [username, password],
      function (error, results, fields) {
        if (error) {
          console.error("Error querying database: " + error.stack);
          res.send("An error occurred while processing your request.");
        } else if (results.length > 0) {
          res.send("Logged in successfully.");
        } else {
          res.send("Invalid username or password.");
        }
      }
    );
  });
  res.render("login");
});
const bcrypt = require("bcrypt");
const saltRounds = 10;
app.post("/login", function (req, res, next) {
  var user_email_address = req.body.user_email_address;
  var user_password = req.body.user_password;
  if (user_email_address && user_password) {
    query = ` SELECT * FROM user Where user_email = "${user_email_address}"`;

    database.query(query, function (err, data) {
      if (data.length > 0) {
        for (var count = 0; count < data.length; count++) {
          if (data[count].user_password == user_password) {
            req.session.user_id = data[count].user_id;
            res.redirect("/");
          } else {
            res.send("Nhập sai mật khẩu");
          }
        }
      }
    });
  } else {
    res.send("nhập user và mk đúng");
    res.end();
  }
});
app.get("/logout", function (req, res, next) {
  req.session.destroy();
  res.redirect("/");
});

app.listen(port, () => console.log(`Ứng dụng đang chạy với port ${port}!`));
