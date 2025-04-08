import 'package:flutter/material.dart';

import '../Views/Search.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 90,),
            const Text("There is no city to show",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: Color(0xff4D4D4D),

              ),
            ),
            const SizedBox(height: 25,),
            GestureDetector(
              onTap: ()
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              child: Container(
                decoration:BoxDecoration(
                  border: Border.all(
                    color:const Color(0xffEFF0F2),
                    width: 4.0,         // Optional: set border width
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child:  Row(
                    children: [
                       Text("Search For City",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Color(0xffA1A1A1),

                        ),
                      ),
                       Spacer(),
                       Icon(
                        Icons.search,
                        size: 35,
                        color: Color(0xff4D4D4D),
                      )

                    ],
                  ),
                ),
              ),
            ),
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/1555/1555512.png",
              color: const Color(0xffcecdcd),

            )
          ],
        ),
      ),
    );
  }
}
