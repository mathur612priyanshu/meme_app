import 'package:flutter/material.dart';
import 'package:unsad_app/controller/fetch_meme.dart';
import 'package:unsad_app/controller/save_my_data.dart';

class mainScreen extends StatefulWidget {
  mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  String imgUrl = "https://i.redd.it/i8f3zg9onsjc1.gif";
  // int memeNo = 0;
  int targetMeme = 100;
  bool isLoading = true;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GetInitMemeNo();
    UpdateImg();
  }

  void incrementor() {
    count++;
  }

  GetInitMemeNo() async {
    // memeNo = await SaveMyData.fetchData() ?? 0;
    if (count > 100) {
      targetMeme = 500;
    } else if (count > 500) {
      targetMeme = 1000;
    }
    setState(() {});
  }

  void UpdateImg() async {
    String getImgUrl =
        await FetchMeme.fetchNewMeme() ?? "https://i.redd.it/i8f3zg9onsjc1.gif";

    setState(() {
      imgUrl = getImgUrl;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "MEME #${count}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "TARGET ${targetMeme} Memes",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            isLoading
                ? Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator()),
                    ),
                  )
                : Image.network(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                    imgUrl),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  incrementor();
                  // print(memeNo);
                  // await SaveMyData.saveData(memeNo! + 1);
                  GetInitMemeNo();

                  UpdateImg();
                },
                child: Text(
                  "More",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            Spacer(),
            Text("APP CREATED BY"),
            Text(
              "PRIYSNSHU MATHUR",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
