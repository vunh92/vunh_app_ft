
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vunh_app_ft/models/values_model.dart';

class ShopHome extends StatefulWidget {

  @override
  ShopHomeState createState() {
    return ShopHomeState();
  }
}

class ShopHomeState extends State<ShopHome> {
  int _counter = 0;
  bool _showClearButton = false;
  Color _colorPrimary = Colors.lightBlueAccent;
  TextEditingController _textController = new TextEditingController();

  List<String> titleCategory;
  List<ImageMidView> imageListMidView;
  List<ImageBottomDetailView> imageListBotDetailView;

  @override
  void initState() {
    super.initState();
    titleCategory = ValuesModel.titleCategory;
    imageListMidView = ValuesModel.imageListMidView;
    imageListBotDetailView = ValuesModel.imageListBotDetailView;
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 70,
        elevation: 0,
        title: searchCombo(),
        centerTitle: true,
        backgroundColor: _colorPrimary,
        leading: IconButton(
          icon: Icon(
            Icons.home, // add custom icons also
          ),
          onPressed: () {
            _toastText('home');
          },
        ),
        actions: <Widget>[
          iconAppBarButton(Icon(Icons.shopping_cart), _counter),
          // iconButton(Icon(Icons.shopping_cart), _counter),
        ],
      ),
      body: GestureDetector(
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerView(),
            categoryTitle(),
            listSubCategory(),
            Container(height: 3, color: Colors.grey, margin: EdgeInsets.fromLTRB(0, 5, 0, 5),),
            Expanded(
              child: builBottomGridView(),
            )
          ],
        ),
        onTap: () {
          _toastText('_body');
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }

  void _incrementCartShopping(int qty) {
    setState(() {
      _counter += qty;
    });
  }

  Widget searchCombo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(10)),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
//      maxLength: 250,
        maxLines: 1,
        cursorColor: Colors.red,
        controller: _textController,
        onChanged: (value) {
          setState(() {
            _showClearButton = _textController.text != "" ? true : false;
          });
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: clearTextButton(),
          hintText: "Search",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  Widget iconAppBarButton(Icon icons, int _counter) {
    if (_counter != 0) {
      return Container(
        child: Badge(
          badgeContent: Text("$_counter"),
          badgeColor: Colors.white,
          child: IconButton(
            icon: icons,
            onPressed: () {
              _toastText('$_counter');
            },
          ),
        ),
        margin: EdgeInsets.only(right: 10, top: 8),
      );
    } else {
      return Container(
        child: IconButton(
          icon: icons,
          onPressed: () {
            _toastText('$_counter');
          },
        ),
        margin: EdgeInsets.only(right: 10, top: 8),
      );
    }
  }

  Widget clearTextButton() {
    if (!_showClearButton) {
      return null;
    } else {
      return IconButton(
        onPressed: () {
          setState(() {
            _textController.clear();
            _showClearButton = _textController.text != "" ? true : false;
          });
        },
        icon: Icon(
          Icons.clear,
          color: Colors.grey,
        ),
      );
    }
  }

  Widget headerView() {
    return Container(
      height: 50,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance,
                          color: _colorPrimary,
                        )
                      ],
                    ),
                  ),
                  Text('All Vendors',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      )),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: viewMoreButton(true),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget viewMoreButton(bool enable) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: enable ? 5 : 0),
        child: Row(
          children: [
            Icon(
              Icons.navigate_next,
              color: enable ? Colors.grey : Colors.white,
            )
          ],
        ),
      ),
      onTap: () {
        if (enable) {
          print("tap view more ALL");
          _toastText('tap view more ALL');
        } else {
          print("ko lam gi het");
          _toastText('ko lam gi het');
        }
      },
    );
  }

  Widget categoryTitle() {
    return Container(
      color: _colorPrimary,
      height: 50,
      child: Container(
        child: Row(
          children: [
            Container(
              child: Row(
                children: [
                  for (int i = 0; i < titleCategory.length; i++)
                    textAndIcon(titleCategory[i], i),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textAndIcon(String text, int index) {
    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 8 : 0),
      child: Row(
        children: [
          InkWell(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              print(text);
              _toastText(text);
            },
          ),
          index == titleCategory.length - 1
              ? Container()
              : viewMoreButton(false),
        ],
      ),
    );
  }

  Widget listSubCategory() {
    return Container(
      height: 120,
      child: _buildMidListView(),
    );
  }

  Widget _buildMidListView() {
    return ListView.builder(
      itemCount: imageListMidView.length,
//        physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return itemListMidView(imageListMidView[index]);
      },
    );
  }

  Widget itemListMidView(ImageMidView obj) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          height: 120,
          // width: 100,
          child: Column(
            children: [
              imageListMidView.length > 0
                  ? Container(
                height: 80,
                child: Image.network(obj.url, fit: BoxFit.fill),
              )
                  : null,
              Text(obj.name)
            ],
          ),
        ),
      ),
      onTap: () {
        print(obj.name);
        _toastText(obj.name);
      },
    );
  }

  Widget builBottomGridView() {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,

      shrinkWrap: true,
      children: List.generate(imageListBotDetailView.length, (index) {
        return Center(
          child: itemBottomGridView(imageListBotDetailView[index],),
        );
      }),
    );
  }

  Widget itemBottomGridView(ImageBottomDetailView obj) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: new BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.25,
          ),
        ),
        child: Container(
          child: Column(
            children: [
              imageListBotDetailView.length > 0
                  ? Expanded(
                child: Image.network(obj.url, fit: BoxFit.cover),
              )
                  : null,
              Row(
                children: [
                  Text(obj.name),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Giá : ' +
                      obj.price,
                    style: TextStyle(color: _colorPrimary),
                  ),
                  Text(obj.unit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  qtyControl(obj),
                  ButtonTheme(
                    minWidth: 20.0,
                    buttonColor: Colors.white,
//                    height: 100.0,
                    child: FlatButton(
                      onPressed: () {
                        _incrementCartShopping(obj.qty);
                        FocusScope.of(context).unfocus();
                        _toastText(obj.qty.toString());
                        obj.qty = 0;
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        size: 20,
                        color: _colorPrimary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        print(obj.name);
        _toastText(obj.name);
      },
    );
  }

  Widget qtyControl(ImageBottomDetailView obj) {
    var ctrl = TextEditingController(text: obj.qty.toString());
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 4 / 2 / 2,
                  child: Text(
                    '-',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () {
                  obj.qty > 0 ? obj.qty-- : 0;
                  ctrl.text = obj.qty.toString();
                  _toastText('-');
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4 / 2,
                height: 35,
                alignment: Alignment.center,
                child: TextField(
                  controller: ctrl,
                  maxLines: 1,
                  maxLength: 4,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "0",
                    counterStyle: TextStyle(height: double.minPositive),
                    counterText: "",
                  ),
                  onSubmitted: (text) {
                    String value = text == "" ? "0" : text;
                    obj.qty = int.parse(value);
                  },
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 4 / 2 / 2,
                  child: Text(
                    '+',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () {
                  obj.qty++;
                  ctrl.text= obj.qty.toString();
                  _toastText('+');
                },
              ),
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width / 4,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  void _toastText(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
    );
  }
}