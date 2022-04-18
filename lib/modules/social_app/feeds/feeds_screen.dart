import 'package:flutter/material.dart';
import 'package:social_app/shared/styles/colors.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Image(
                  image: NetworkImage(
                      'https://img.freepik.com/free-photo/portrait-happy-contented-satisfied-attractive-man-denim-trendy-shirt-showing-with-his-index-finger-top-right-cornerxt_295783-1217.jpg?w=996'),
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Communicate With Friends',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index)=> buildPostItem(context),
              separatorBuilder: (context, index) => SizedBox(height: 10.0,),
              itemCount: 10
          ),
          SizedBox(height: 8.0,),
        ],
      ),
    );
  }


  Widget buildPostItem(context) =>
      Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      'https://media-exp1.licdn.com/dms/image/D4E03AQE_SqFCireGjg/profile-displayphoto-shrink_800_800/0/1644780087459?e=1651104000&v=beta&t=DveP8tDl23nNwMM0CnQYWssh3XcLzNbOmWsasR1HDUQ',
                      // 'https://img.freepik.com/free-photo/young-woman-with-round-glasses-yellow-sweater_273609-7091.jpg?w=996'
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Muhammad Al-Rifai',
                              style: TextStyle(
                                height: 1.4,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: defaultColor,
                              size: 16.0,
                            ),
                          ],
                        ),
                        Text(
                          'January 21, 2022 at 11:00 pm',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .caption
                              .copyWith(
                            height: 1.4,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 16.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 6.0),
                        child: Container(
                          height: 25.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 1.0,
                            padding: EdgeInsets.zero,
                            child: Text(
                              '#software',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: defaultColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 6.0),
                        child: Container(
                          height: 25.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 1.0,
                            padding: EdgeInsets.zero,
                            child: Text(
                              '#flutter',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: defaultColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/portrait-happy-contented-satisfied-attractive-man-denim-trendy-shirt-showing-with-his-index-finger-top-right-cornerxt_295783-1217.jpg?w=996'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0,),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Heart,
                                size: 16.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '120',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                IconBroken.Chat,
                                size: 16.0,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '120 comment',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(
                              'https://media-exp1.licdn.com/dms/image/D4E03AQE_SqFCireGjg/profile-displayphoto-shrink_800_800/0/1644780087459?e=1651104000&v=beta&t=DveP8tDl23nNwMM0CnQYWssh3XcLzNbOmWsasR1HDUQ',
                              // 'https://img.freepik.com/free-photo/young-woman-with-round-glasses-yellow-sweater_273609-7091.jpg?w=996'
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'write a comment ...',
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .caption
                                .copyWith(),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 16.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Like',
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),

                ],
              ),
            ],
          ),
        ),
      );


}
