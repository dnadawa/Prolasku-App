import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money2/money2.dart';
import 'package:prolasku/screens/products/product-details.dart';
import 'package:prolasku/widgets/button.dart';
import 'package:prolasku/widgets/custom-text.dart';
import 'package:prolasku/widgets/marquee.dart';

import '../products.dart';

class ProductsGridView extends StatefulWidget {
  final List products;

  const ProductsGridView({Key key, this.products}) : super(key: key);
  @override
  _ProductsGridViewState createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    String language = context.locale.toString().toLowerCase();
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
      child: widget.products!=null?GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: ScreenUtil().setWidth(10),
          mainAxisSpacing: ScreenUtil().setWidth(25),
          childAspectRatio: 0.57
        ),
        itemCount: widget.products.length+1,
        controller: Products.scrollController,
        itemBuilder: (context,i){
          if(i == widget.products.length){
            return CupertinoActivityIndicator();
          }
          String image;
          String description;
          List images;
          if(widget.products[i]['images'].length>0){
            image = widget.products[i]['images'][0]['URL'];
            images = widget.products[i]['images'];
          }
          else{
            image = '';
            images = [];
          }

          String name = widget.products[i]['product_name'][language];
          try{
            description = widget.products[i]['product_desc'][language];
          }catch(e){
            description = "";
          }
          String id = widget.products[i]['pid'];
          int discount = widget.products[i]['discount'];
          String vat = widget.products[i]['vat'];
          List stockData = widget.products[i]['stock_data'];
          int stock = stockData[0]['stock'];
          int stockAlert = int.parse(widget.products[i]['stock_alert_qty'].toString());

          Currency euro = Currency.create('EUR', 2, symbol: '€', invertSeparators: true, pattern: '0,00S');
          Money price = Money.from(widget.products[i]['price'], euro);
          Money disPrice = Money.from(widget.products[i]['price_buy'], euro);

          return GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ProductDetails(
                    productID: id,
                    name: name,
                    discount: discount,
                    images: images,
                    price: price.toString(),
                    vat: vat,
                    description: description,
                    stockData: stockData,
                    stockAlert: stockAlert,
                    disPrice: disPrice.toString(),
                  ))
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenUtil().setHeight(200),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                          child: Center(child: CachedNetworkImage(
                            imageUrl: image,
                            placeholder: (context,x)=>Icon(Icons.no_photography,size: 50,),
                            errorWidget: (context,x,error)=>Icon(Icons.no_photography,size: 50,),
                          )),
                        ),
                        if(discount!=0)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              height: ScreenUtil().setHeight(120),
                              width: ScreenUtil().setHeight(120),
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/coupon.png'),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: ScreenUtil().setHeight(10)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CustomText(text: "$discount%",size: ScreenUtil().setSp(35),font: 'josefin',),
                                            CustomText(text: tr('discount'),size: ScreenUtil().setSp(20),font: 'josefin',),
                                          ],
                                        ),
                                      ))
                                ],
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(text: price.toString(),font: 'josefin',size: ScreenUtil().setSp(40),color: Colors.red,),
                        SizedBox(width: ScreenUtil().setWidth(5),),
                        if(discount!=0)
                        Text(disPrice.toString(),style: GoogleFonts.josefinSans(
                            fontSize: ScreenUtil().setSp(25),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            fontStyle: FontStyle.italic
                        ),),
                        SizedBox(width: ScreenUtil().setWidth(5),),
                        CustomText(text: '(${tr('vat')} 14%)',size: ScreenUtil().setSp(15),isBold: false,),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
                    child: Container(
                      width: 148,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 1)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              stock > stockAlert ? Theme
                                  .of(context)
                                  .accentColor :
                              stock <= stockAlert && stock < 0
                                  ? Colors.orange
                                  :
                              stock <= 0 ? Colors.red :
                              stock <= stockAlert && stock > 0
                                  ? Colors.orange
                                  :
                              Colors.transparent,
                              radius: 5,
                            ),
                            Expanded(child: CustomText(text: '$stock '+tr('availableInStock'),font: 'josefin',)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20),),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
                    child: MarqueeWidget(child: CustomText(text: name,font: 'josefin',size: ScreenUtil().setSp(40),)),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(ScreenUtil().setWidth(15)),
                    child: CustomText(
                      text: description,
                      size: ScreenUtil().setSp(20),
                      align: TextAlign.start,
                      isBold: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: ScreenUtil().setHeight(60),
                      child: Button(
                        text: tr('addToCart'),
                        fontSize: 20,
                        borderRadius: 5,
                        isCart: true,
                        onPressed: (){},
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20),),
                ],
              ),
            ),
          );
        },
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
