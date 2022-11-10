import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:wellness_hub_australia/models/address.model.dart';

import 'package:wellness_hub_australia/models/offered_service.model.dart';
import 'package:wellness_hub_australia/models/badge.model.dart';
import 'package:wellness_hub_australia/models/client.model.dart';
import 'package:wellness_hub_australia/models/company.model.dart';
import 'package:wellness_hub_australia/models/custom_link.model.dart';
import 'package:wellness_hub_australia/models/mail.model.dart';
import 'package:wellness_hub_australia/models/credential.model.dart';
import 'package:wellness_hub_australia/models/service_provider.model.dart';
import 'package:faker/faker.dart' as fkr;

List<ServiceProvider> fakeServiceProviders(int? count) {
  return List.generate(count ?? 10, (index) {
    return ServiceProvider(
        id: index,
        firstName: fkr.faker.person.firstName(),
        lastName: fkr.faker.person.lastName(),
        email: fkr.faker.internet.email(),
        mobileNumber: "09238988128",
        profilePic:
            "https://gwf-cors-anywhere.herokuapp.com/https://randomuser.me/api/portraits/${fkr.faker.randomGenerator.element([
              "men",
              "women"
            ])}/${index + 20}.jpg",
        address: Address(
          postcode: fkr.faker.randomGenerator.integer(9999, min: 1000),
          placeName: fkr.faker.address.city(),
          stateName: fkr.faker.address.state(),
          stateCode: fkr.faker.randomGenerator
              .element(["NSW", "VIC", "NT", "QLD", "SA", "Tas", "WA", "ACT"]),
          latitude: fkr.faker.randomGenerator.decimal(min: 80),
          longitude: fkr.faker.randomGenerator.decimal(min: 80),
          accuracy: fkr.faker.randomGenerator.integer(6, min: 1),
        ),
        gender: "Male",
        rating: fkr.faker.randomGenerator.element([0, 3, 4, 4.5, 5]),
        verified: fkr.faker.randomGenerator.element([1, 0]),
        shortBio:
            "I am skillfully trained disability support worker/personal care attendant, and I have been in the industry for almost 4 years. In terms of client exposure and handling, I have handled a diversity of people: both young and the aged with different disability care plans.",
        credentials: List.generate(
          fkr.faker.randomGenerator.integer(4, min: 1),
          (index) => Credential(
              id: index,
              title: fkr.faker.randomGenerator.element(
                [
                  "Psychologists",
                  "Therapist",
                  "Meditation Instructor",
                  "Gp",
                  "Nutritionist",
                  "Massage Therapist",
                  "Osteopath",
                  "Yoga Teacher",
                  "Personal Trainer",
                  "Financial Advisor",
                ],
              ),
              description: fkr.faker.lorem.sentence(),
              attachment: fkr.faker.internet.httpsUrl()),
        ),
        reviews: [],
        offeredServices: List.generate(
          fkr.faker.randomGenerator.integer(4, min: 1),
          (index) => OfferedService(
            id: index,
            title: fkr.faker.randomGenerator.element(
              [
                "Psychologist",
                "Therapist",
                "Meditation Instructor",
                "General Practitioner",
                "Nutritionist",
                "Therapist",
                "Osteopath",
                "Yoga Teacher",
                "Personal Trainer",
                "Financial Advisor",
              ],
            ),
            description: fkr.faker.lorem.sentence(),
            pillarId: fkr.faker.randomGenerator.element(
              [1, 2, 3, 4],
            ),
          ),
        ));
  });
}

/* List<PushNotification> fakePushNotifications() {
  return List.generate(10, (index) {
    return PushNotification(
      id: index,
      title: fkr.faker.lorem.sentences(1).join(" "),
      link: fkr.faker.internet.httpsUrl(),
      createdAt: fkr.faker.date.dateTime(minYear: 2021, maxYear: 2022),
      updatedAt: DateTime.now(),
    );
  });
} */

List<Mail> fakeMails() {
  return List.generate(10, (index) {
    return Mail(
      id: index,
      subject: fkr.faker.conference.name(),
      body: fkr.faker.lorem.sentences(5).join(" "),
      link: fkr.faker.internet.httpsUrl(),
      isRead: fkr.faker.randomGenerator.element([true, false]),
      createdAt: fkr.faker.date.dateTime(minYear: 2021, maxYear: 2022),
      updatedAt: DateTime.now(),
    );
  });
}

List<ChatUser> fakeChats() {
  return List.generate(10, (index) {
    return ChatUser(
        id: fkr.faker.guid.guid(),
        firstName: fkr.faker.person.firstName(),
        lastName: fkr.faker.person.lastName(),
        profileImage:
            "https://gwf-cors-anywhere.herokuapp.com/https://randomuser.me/api/portraits/${fkr.faker.randomGenerator.element([
              "men",
              "women"
            ])}/$index.jpg",
        customProperties: {
          "recent_message": fkr.faker.lorem.sentences(3).join(" "),
          "recent_message_date":
              fkr.faker.date.dateTime(minYear: 2020, maxYear: 2022),
        });
  });
}

List<ChatMessage> fakeChatThread() {
  return List.generate(10, (index) {
    return ChatMessage(
      text: fkr.faker.lorem.sentences(3).join(" "),
      user: ChatUser(
        id: fkr.faker.guid.guid(),
        firstName: fkr.faker.person.firstName(),
        lastName: fkr.faker.person.lastName(),
        profileImage:
            "https://gwf-cors-anywhere.herokuapp.com/https://randomuser.me/api/portraits/${fkr.faker.randomGenerator.element([
              "men",
              "women"
            ])}/$index.jpg",
      ),
      createdAt: fkr.faker.date.dateTime(minYear: 2022, maxYear: 2022),
    );
  });
}

/* List<AppointmentServiceProvider> fakeAppointments() {
  return List.generate(10, (index) {
    return AppointmentServiceProvider(
      id: index,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(hours: 1)),
      total: fkr.faker.randomGenerator.decimal(min: 40),
      fieldDetails: Field(title: "VVVVVVV"),
      paid: 1,
      status: "Accepted",
      paymentType: "Cash",
      serviceProvider: ServiceProvider(
        id: index,
        firstName: fkr.faker.person.firstName(),
        lastName: fkr.faker.person.lastName(),
        mobileNumber: "543543535",
        email: fkr.faker.internet.email(),
      ),
    );
  });
} */

List<CustomLink> fakeCustomLinks() {
  return List.generate(
      10,
      (index) => CustomLink(
            id: index,
            companyName: fkr.faker.company.name(),
            title: fkr.faker.conference.name(),
            url: fkr.faker.internet.httpsUrl(),
            linkIcon:
                "https://gwf-cors-anywhere.herokuapp.com/https://picsum.photos/id/${fkr.faker.randomGenerator.integer(100)}/400/400",
            description: fkr.faker.lorem.sentences(5).join(" "),
            createdAt: fkr.faker.date.dateTime(minYear: 2021, maxYear: 2022),
            updatedAt: DateTime.now(),
          ));
}

List<Client> fakeCompanyMembers() {
  return List.generate(20, (index) {
    return Client(
      id: index,
      firstName: fkr.faker.person.firstName(),
      lastName: fkr.faker.person.lastName(),
      birthDate: fkr.faker.date.toString(),
      address: fkr.faker.address,
      companyId: fkr.faker.randomGenerator.integer(10, min: 1),
      email: fkr.faker.internet.email(),
      height: fkr.faker.randomGenerator.integer(200, min: 40),
      weight: fkr.faker.randomGenerator.integer(200, min: 40),
      gender: fkr.faker.randomGenerator.element([
        "Male",
        "Female",
        "Other",
      ]),
      profilePic:
          "https://gwf-cors-anywhere.herokuapp.com/https://randomuser.me/api/portraits/${fkr.faker.randomGenerator.element([
            "men",
            "women"
          ])}/$index.jpg",
      mobileNumber: fkr.faker.phoneNumber.us(),
    );
  });
}

List<Company> fakeCompanies() {
  return List.generate(20, (index) {
    return Company(
      id: index,
      name: fkr.faker.company.name(),
      description: fkr.faker.lorem.sentences(5).join(" "),
      logoUrl: fkr.faker.image.image(),
      paymentStatus: fkr.faker.randomGenerator.element([
        "Ongoing",
        "Finished",
        "Missed",
        "Cancelled",
      ]),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  });
}

List<Badge> fakeBadges() {
  List<String> badgeNames = [
    "New Member",
    "The Employee of the Month",
    "Stand out Performer",
    "Go That Extra Mile",
    "Most Improved Performer",
    "Achiever of the Month",
    "The Mountain Mover",
    "The Ultimate Contributor",
    "The Conquerer",
    "The Brainiac",
  ];

  List<String> badgeIcons = [
    "https://i.ibb.co/KXBJsFK/50-Awards-and-Badges-45.png",
    "https://i.ibb.co/1fmVn83/50-Awards-and-Badges-15.png",
    "https://i.ibb.co/1qY5cyB/50-Awards-and-Badges-9.png",
    "https://i.ibb.co/QCk0874/50-Awards-and-Badges-14.png",
    "https://i.ibb.co/Sm7qNK2/50-Awards-and-Badges-16.png",
    "https://i.ibb.co/Gc71Dbn/50-Awards-and-Badges-20.png",
    "https://i.ibb.co/KN0yjkY/50-Awards-and-Badges-28.png",
    "https://i.ibb.co/G22Xc9Y/50-Awards-and-Badges-38.png",
    "https://i.ibb.co/hcbmJmx/50-Awards-and-Badges-37.png",
    "https://i.ibb.co/sVwh4Jt/50-Awards-and-Badges-44.png",
  ];

  return List.generate(10, (index) {
    return Badge(
        id: index,
        badgeName: badgeNames[index],
        imgPath: badgeIcons[index],
        description: (badgeNames[index] == "New Member")
            ? "Join Wellness Hub Australia for the first time"
            : "Praesent sapien massa, convallis a pellentesque nec",
        acquired: (badgeNames[index] == "New Member") ? true : false,
        createdAt: fkr.faker.date.dateTime(minYear: 2021, maxYear: 2022),
        updatedAt: fkr.faker.date.dateTime(minYear: 2021, maxYear: 2022));
  });
}
