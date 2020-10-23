# Restaurantes

## Description

The application uses information from the public API of Hotmart establishments.
After that it will be possible to obtain the hash value to use at the end of your URL to get the necessary information.

## Installation

Just clone the project repository on your machine.
It is necessary to have Xcode installed with a simulator or an Iphone with the updated version of the operating system (iOS 13.2).

## Result

With the application it is possible to search and have the result with the list of restaurants in a customized collection.
Clicking on one of the establishments opens a new screen with details and descriptions of the place.
There is also a TabBar to select which screen you want to be with a subtle animation.

The requests for json are made natively through the URLSession.
As I had used Alamofire before, I challenged myself to do the same without using Pods.

There is a small bank of images that are selected at random for the cards.
