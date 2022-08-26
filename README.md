#  Christopher Boynton - Summus Takehome

This represents about 6 hours of work, all that I had to spare for this challenge. Below I will go into some of the decisions I made and what I would do next if I had more time. This is my first experience with SwiftUI in any larger practical purpose. Previously all I had to done was small exercises.

Overall, I am satisfied with my work considering it's my first attempt at a SwiftUI project. I learned a lot over the course of building it, and I look forward to hearing feedback and criticisms on my work.

## Project Structure

I utilized an MVVM structure for my project. The source of the application data is the ApiClient and its methods. The ApiClient class interacts with the API endpoints and creates the model objects based on the response data. The Model also contains two services: PostService and UserService, which contain methods for gathering and organizing the raw model data from the APIClient. The service classes are in turn called by the view model classes, of which there is one for each view with any complexity. On top of that are the view objects, which are build using SwiftUI.

My logic behind creating the PostService is that Post objects are the top level object of the data strucutre. The Master page contains a list of these, and thus they can be applied to the PostListViewModel and passed as needed to the other view model classes. I imbedded the Comment objects within their associated posts as I found it was easier to handle the data this way. Comments are never used out of context with their post.

My logic behind creating the UserService class is that User object with two data types (Album and Photo) that are used only in context of the User. User objects are therefore pulled with Album and Photo data already imbedded within them. Additionally, Users are referenced in two different contexts. Post and Comment object each have a reference to a User, and User data was required to be shown on each of them. Therefore, having a lookup where I could easily pull the relevant User object was useful to me.

## Views & View Models

Each view structure with any complexity has its own view model class. Each view then only has a single view model property associated with it, and all data is embedded within that class. 

The ViewModel classes utilize the ObservableObject protocol to allow for updates to the view if the data is updated.

## Unfinished

As mentioned above, I spent as much time as I could spare on this project and left some things incomplete or omitted.

I know that I missed a few requirements from the prompt:

1. I did not include a standin profile image on the master page, I simply ran out of time.
1. I did not include utilization of the Combine library. This is new to me and while I tried to use it in my PostService & UserService to update data, I could not get it to work properly. This is something I'm going to work on in the future as it seems to be a very powerful toolset.
1. I did not get a chance to deterimine exactly why some images do not load on the AuthorDetail page.

## Next Steps

Some improvements I would make if I had more time, include overall formatting changes for the app to make it more readable. I would work on cleaning up the view model initialization, I feel the view model constructor within the view constructor makes the code look messy. I would work on the PostDetail page to have it be one piece of scrollable content.
