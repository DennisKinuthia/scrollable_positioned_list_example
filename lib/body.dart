
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:scroller/data.dart';

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {

  late ItemScrollController _scrollController;
  
  @override
  void initState() {
    super.initState();
    _scrollController = ItemScrollController();
    var indexy = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      DateTime closestDate = matches.first.matchDateTime;
      for (var match in matches) {
        if (DateTime.now().difference(match.matchDateTime).abs() < DateTime.now().difference(closestDate).abs()) {
          closestDate = match.matchDateTime;
          indexy = matches.indexOf(match);
        }
      }
      _scrollController.scrollTo(index: indexy, duration: const Duration(milliseconds: 250), curve: Curves.easeInCubic);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    matches.sort((a,b) => a.matchDateTime.compareTo(b.matchDateTime));
    return  ScrollablePositionedList.builder(
      itemScrollController: _scrollController,
      itemCount: matches.length,
      itemBuilder: (context, index) {          
        return Card(
          elevation: 2.0,
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow:  [
                  BoxShadow(
                    blurRadius: 2.0,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 2.0,
                    color: Colors.grey[200]!
                  )
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 20.0,
                            height: 20.0,
                            
                              child: Icon(Icons.sports),
                              ),
                          
                          
                           const SizedBox(width: 20.0),
                          Text(
                            matches[index].homeTeamName,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: Icon(Icons.sports),
                            ),
                          const SizedBox(width: 20.0),
                          Text(
                            matches[index].awayTeamName,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    DateFormat('EEE, MMMM dd, yyyy').format(matches[index].matchDateTime),
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 10.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),             
                ],
              ),
            ),
        );
      },
    );
  }
}
